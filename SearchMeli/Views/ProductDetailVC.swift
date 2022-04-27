//
//  ProductDetail.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import UIKit
import Combine
import FSPagerView

class ProducDetailVC : UIViewController, NavigationSearchDelegate {
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    func textDidChange(text: String) {
        print("")
    }
    private var canellables: Set<AnyCancellable> = []
    var viewModel = SearchVM()
    var searchHeader = NavigationSearch()
    var result: Result!
    
    
    var tableView: UITableView = UITableView()
    let cellId = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHeader = NavigationSearch(vc: self,showOnlyIcon: true)
        searchHeader.delegate = self
        self.view.backgroundColor = .red
        binding()
        setup()
        if let id = result.id {
            viewModel.getProduct(id: id)
        }
    }
    
    func binding(){
        viewModel.$product.sink { _ in
            
        }.store(in: &canellables)
    }
    
    func setup(){
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TitleInfoCell.self, forCellReuseIdentifier: "titleInfoCell")
        tableView.register(CarouselCell.self, forCellReuseIdentifier: "carouselCell")
        tableView.register(ColorCell.self, forCellReuseIdentifier: "colorCell")
        tableView.register(PriceCell.self, forCellReuseIdentifier: "priceCell")
        tableView.register(QuantityCell.self, forCellReuseIdentifier: "quantityCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "buttonCell")
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(searchHeader.snp.bottom)
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


extension ProducDetailVC : UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "titleInfoCell", for: indexPath) as! TitleInfoCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "carouselCell", for: indexPath) as! CarouselCell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorCell
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath) as! PriceCell
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "quantityCell", for: indexPath) as! QuantityCell
        case 5:
            cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonCell
        default:
            return UITableViewCell()
        }
        return cell
    }
    
}
