//
//  HomeVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import FSPagerView


import UIKit
class HomeVC: UIViewController {
    
    var pagerView: FSPagerView!
    let list = ["banner-home-1","banner-home-2"]
    
    var tableView: UITableView = UITableView()
    let cellId = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "colorGrayMeli")
        self.title = "Inicio"
        self.setupView()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView(){
        let navigationSearch = NavigationSearch(vc: self, blockInput: true,showBack: false)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(AdsCell.self, forCellReuseIdentifier: "adsCell")
        tableView.register(InitialCell.self, forCellReuseIdentifier: "initialAccount")
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.top.equalTo(navigationSearch.snp.bottom).offset(20)
        }
    
        pagerView = FSPagerView(frame:CGRect.zero)
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.translatesAutoresizingMaskIntoConstraints = false
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension HomeVC : UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    // Set the spacing between sections
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "adsCell", for: indexPath) as! AdsCell
            cell.carrousel(pagerView)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "initialAccount", for: indexPath) as! InitialCell
            cell.vc = self
            return cell
        default:
            return UITableViewCell()
        }
       
    }
    
}


extension HomeVC : FSPagerViewDelegate, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return list.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.list[index])
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.clipsToBounds = true
        return cell
    }
}
