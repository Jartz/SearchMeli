//
//  NavigationSearch.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import UIKit
import SnapKit

protocol NavigationSearchDelegate: AnyObject {
    func actionBackButton()
    func textDidChange(text: String)
    func searchBarSearchButtonClicked(text: String)
}

class NavigationSearch: UIView, UISearchBarDelegate, UIGestureRecognizerDelegate {
    var heightBar = 98.0
    var offsetTop = 30
    weak var delegate: NavigationSearchDelegate?
    weak var navigationController: UINavigationController?
    weak var vc: UIViewController!
    var blockInput: Bool = false
    var label: UILabel =  {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    deinit {
       // print("delete in memory NavigationSearch")
    }
    var searchBar: UISearchBar =  {
        var search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .minimal
        search.searchTextField.backgroundColor = .white
        search.backgroundColor = .clear
        search.placeholder = "Buscar en Mercado libre"
        search.searchTextField.font =  UIFont.systemFont(ofSize: 14)
        search.searchTextField.layer.cornerRadius = 20
        search.searchTextField.layer.masksToBounds = true
        return search
    }()
    var backButton: UIButton =  {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage( UIImage(named: "back-icon"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.isEnabled = true
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return btn
    }()
    var shopButton: UIButton =  {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage( UIImage(named: "shopping-cart"), for: .normal)
        btn.isEnabled = true
        btn.isUserInteractionEnabled = true
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(shopScreen), for: .touchUpInside)
        return btn
    }()
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public convenience init(vc: UIViewController, blockInput: Bool = false, showOnlyIcon: Bool = false, showBack: Bool = true) {
        self.init(frame: .zero)
        self.vc = vc
        self.blockInput = blockInput
        setupView(vc: vc, showOnlyIcon: showOnlyIcon, showBack: showBack)
    }
    func setupView(vc: UIViewController, showOnlyIcon: Bool, showBack: Bool) {
        self.navigationController = vc.navigationController
        self.vc.view.addSubview(self)
        self.addSubview(backButton)
        self.addSubview(shopButton)
        self.addSubview(searchBar)
        if !self.blockInput {
            searchBar.becomeFirstResponder()
        }
        self.searchBar.isHidden = showOnlyIcon
        self.searchBar.delegate = self
        self.backgroundColor = UIColor(named: "colorMeli")
        self.snp.makeConstraints { (make) -> Void in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(heightBar)
        }
        self.backButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.snp.leading).offset(10)
            make.top.equalTo(self.snp.top).offset(offsetTop)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        self.backButton.isHidden = !showBack
        self.searchBar.snp.makeConstraints { (make) -> Void in
            if showBack {
                make.leading.equalTo(backButton.snp.trailing).offset(5)
            } else {
                make.leading.equalTo(self.snp.leading).offset(5)
            }
            make.trailing.equalTo(shopButton.snp.leading).offset(-5)
            make.top.equalTo(self.snp.top).offset(offsetTop)
            make.bottom.equalTo(self.snp.bottom)
        }
        self.shopButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.top.equalTo(self.snp.top).offset(offsetTop)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        if blockInput {
            self.goToScreenPresenting()
        }
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text  = searchBar.text {
            if text.isEmpty { return }
            self.endEditing(true)
            delegate?.searchBarSearchButtonClicked(text: text)
        }
    }
    func goToScreenPresenting() {
        DispatchQueue.main.async {
            let vcPresenter = ProductSearchedVC()
            vcPresenter.modalPresentationStyle = .fullScreen
            vcPresenter.callback = { results in
                let vcDetail =  ProductListVC()
                vcDetail.txtSearched = results
                self.navigationController?.pushViewController(vcDetail, animated: true)
            }
            self.navigationController?.present(vcPresenter, animated: false, completion: nil)
        }
    }
    @objc func backScreen() {
        delegate?.actionBackButton()
    }
    @objc func shopScreen() {
        HelperUI.showAlert(vc: self.vc)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.delegate?.textDidChange(text: searchText)
    }
}
