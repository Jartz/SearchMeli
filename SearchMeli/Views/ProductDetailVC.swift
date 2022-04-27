//
//  ProductDetail.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import UIKit
import Combine
import FSPagerView

class ProducDetailVC : UIViewController {
  
    private var canellables: Set<AnyCancellable> = []
    var viewModel = SearchVM()
    var searchHeader = NavigationSearch()
    var result: Result!
    var productDetail: ProductModel!
    var pagerView: FSPagerView!
    
    
    var tableView: UITableView = UITableView()
    let cellId = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHeader = NavigationSearch(vc: self,blockInput: true, showOnlyIcon: true)
        searchHeader.delegate = self
        self.view.endEditing(true)
        self.view.backgroundColor = .white
        binding()
        setup()
        if let id = result.id {
            print(id)
            viewModel.getProduct(id: id)
        }
    }
    
    func binding(){
        viewModel.$product.sink { product in
            DispatchQueue.main.async {  [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.productDetail = product
                
                strongSelf.pagerView = FSPagerView(frame:CGRect(x: 0, y: 0, width: strongSelf.view.frame.width, height: 300))
                strongSelf.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
                strongSelf.pagerView.dataSource = self
                strongSelf.pagerView.delegate = self
                
                strongSelf.tableView.reloadData()
            }
           
        }.store(in: &canellables)
    }
    
    func setup(){
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(TitleInfoCell.self, forCellReuseIdentifier: "titleInfoCell")
        tableView.register(CarouselCell.self, forCellReuseIdentifier: "carouselCell")
        tableView.register(ColorCell.self, forCellReuseIdentifier: "colorCell")
        tableView.register(PriceCell.self, forCellReuseIdentifier: "priceCell")
        tableView.register(QuantityCell.self, forCellReuseIdentifier: "quantityCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "buttonCell")
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.top.equalTo(searchHeader.snp.bottom)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.view.endEditing(true)
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
      
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleInfoCell", for: indexPath) as! TitleInfoCell
            cell.product = self.result
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "carouselCell", for: indexPath) as! CarouselCell
            cell.product = self.productDetail
            cell.carrousel(pagerView)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorCell
            // cell.product = self.result
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath) as! PriceCell
            cell.product = self.result
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "quantityCell", for: indexPath) as! QuantityCell
            //cell.product = self.result
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ButtonCell
            //cell.product = self.result
            return cell
        default:
            return UITableViewCell()
        }
       
    }
    
}

extension ProducDetailVC : NavigationSearchDelegate {
    
    func searchBarSearchButtonClicked(text: String) {
        return
    }
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    func textDidChange(text: String) {
        print("")
    }
}

extension ProducDetailVC : FSPagerViewDelegate, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.productDetail?.pictures.count ?? 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let url = URL(string: self.productDetail.pictures[index].url )
        cell.imageView?.kf.setImage(with: url)
        return cell
    }
}
