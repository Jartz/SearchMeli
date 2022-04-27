//
//  TabBarVC.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//


import UIKit
class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = HomeVC()
        let tabOneBarItem = UITabBarItem(title: "Inicio", image: UIImage(named: "home-icon"), selectedImage: UIImage(named: "home-icon"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = FavoriteVC()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))

        
        tabTwo.tabBarItem = tabTwoBarItem2

        
        self.viewControllers = [tabOne]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
}
