//
//  ProductSearchedVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//
import UIKit
import Combine
import MapKit
import Kingfisher

class ProductSearchedVC: UIViewController {
    var viewModel: ProductVM!
    private var canellables: Set<AnyCancellable> = []
    var tableView: UITableView = UITableView()
    lazy var searchView = NavigationSearch()
    var listProd: [Result] = []
    var listSearched: [String] = []
    var callback: ((String) -> Void)?
    var textUsed: String = ""
    let cache = KingfisherManager.shared.cache
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewModel = ProductVM()
        searchView = NavigationSearch(vc: self)
        searchView.delegate = self
        setup()
        getSearchedList()
    }
    func getSearchedList() {
        listSearched = HelperCoreData.getSearchedData()
        tableView.reloadData()
    }
    func setup() {
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(SearchedCard.self, forCellReuseIdentifier: "searchedCard")
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
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
        cache.clearMemoryCache()
        cache.clearDiskCache(completion: nil)
        cache.cleanExpiredDiskCache()
    }

}

extension ProductSearchedVC: NavigationSearchDelegate {
    func textDidChange(text: String) {
        textUsed = text
    }
    func actionBackButton() {
        self.dismiss(animated: false, completion: nil)
    }
    func searchBarSearchButtonClicked(text: String) {
        self.dismiss(animated: false) {
            if let cb = self.callback {
                HelperCoreData.saveSearchedData(name: text)
                cb(text)
            }
        }
    }
}
extension ProductSearchedVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listSearched.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchedCard", for: indexPath) as? SearchedCard
        cell?.nameSearched = self.listSearched[indexPath.row]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false) {
            self.dismiss(animated: false) {
                if let callBack = self.callback {
                    HelperCoreData.saveSearchedData(name: self.listSearched[indexPath.row])
                    callBack(self.listSearched[indexPath.row])
                }
            }
        }
    }
}
