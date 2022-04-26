//
//  ProductListVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import UIKit


class ProductListVC: UIViewController, NavigationSearchDelegate {
    func actionBackButton() {
        print("actionBackButton")
        self.dismiss(animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
       let data = NavigationSearch(vc: self)
        data.delegate = self
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
        // Dispose of any resources that can be recreated.
    }
    
}
