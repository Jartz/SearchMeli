//
//  ProductListVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import UIKit
import Combine
import MapKit
import Kingfisher

class ProductListVC: UIViewController {
    private var viewModel: ProductVM?
    private var canellables: Set<AnyCancellable> = []
    var tableView: UITableView = UITableView()
    var searchView: NavigationSearch?
    var listProd: [Result] = []
    var txtSearched: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView = NavigationSearch(vc: self, blockInput: true)
        viewModel = ProductVM()
        searchView?.delegate = self
        self.internetConnection()
        setup()
        if !txtSearched.isEmpty {
            self.loadingSpinner()
            viewModel?.getProductList(text: txtSearched)
        }
        binding()
    }
    deinit {
        print("Delete in memory ProductListVC")
    }

    func binding() {
        viewModel?.$dataSource.sink { [weak self] data in
            if let results =  data?.results {
                self?.hideSpinner()
                self?.listProd = results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }.store(in: &canellables)
        viewModel?.$error.sink {  [weak self] errorActive in
            if errorActive ?? false {
                self?.hideSpinner()
            }
        }.store(in: &canellables)
    }
    func setup() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCard.self, forCellReuseIdentifier: "productCard")
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            guard let search = searchView else { return }
            make.top.equalTo(search.snp.bottom)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel = nil
        searchView = nil
        self.clearCache()
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.clearCache()
    }
}

extension ProductListVC: NavigationSearchDelegate {
    func searchBarSearchButtonClicked(text: String) {
        return
    }
    func textDidChange(text: String) {
        viewModel?.getProductList(text: text)
    }
    func actionBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
extension ProductListVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listProd.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCard", for: indexPath) as? ProductCard
        cell?.product = self.listProd[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProducDetailVC()
        vc.result = self.listProd[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
