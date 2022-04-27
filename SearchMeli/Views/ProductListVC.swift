//
//  ProductListVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import UIKit
import Combine
import MapKit


class ProductListVC: UIViewController {

    private var viewModel = SearchVM()
    private var canellables: Set<AnyCancellable> = []
    var tableView: UITableView = UITableView()
    var searchView = NavigationSearch()
    var listProd: [Result] = []
    var txtSearched: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        viewModel = SearchVM()
        searchView = NavigationSearch(vc: self,blockInput: true)
        searchView.delegate = self
        setup()
        if !txtSearched.isEmpty{
            viewModel.getProductList(text: txtSearched)
        }
        binding()
    }
    
    func binding(){
        viewModel.$dataSource.sink { data in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.listProd = data?.results ?? []
                strongSelf.tableView.reloadData()
            }
        }.store(in: &canellables)
    }
    
    
    func setup(){
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCard.self, forCellReuseIdentifier: "productCard")
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(searchView.snp.bottom)
        }
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ProductListVC: NavigationSearchDelegate {
    func searchBarSearchButtonClicked(text: String) {
        return
    }
    
    func textDidChange(text: String) {
        viewModel.getProductList(text: text)
    }
    
    func actionBackButton() {
        print("actionBackButton")
        self.navigationController?.popViewController(animated: true)
    }
}


extension ProductListVC : UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listProd.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCard", for: indexPath) as! ProductCard
        cell.product = self.listProd[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProducDetailVC()
        vc.result = self.listProd[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
