//
//  ProductListVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import UIKit
import Combine


class ProductListVC: UIViewController, NavigationSearchDelegate {

    private var viewModel = SearchVM()
    private var canellables: Set<AnyCancellable> = []
    
    func textDidChange(text: String) {
        viewModel.getProductList(text: text)
    }
    
    func actionBackButton() {
        print("actionBackButton")
        self.dismiss(animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow

        viewModel = SearchVM()
       let data = NavigationSearch(vc: self)
        data.delegate = self
        binding()
       
    }
    
    func binding(){
        viewModel.$dataSource.sink { data in
            print(data)
        }.store(in: &canellables)
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
