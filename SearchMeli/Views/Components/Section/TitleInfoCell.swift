//
//  TitleInfoCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation

import UIKit
class TitleInfoCell : UITableViewCell {
    
    var product : ProductModel? {
        didSet {
//            productImage.image = product?.productImage
//            productNameLabel.text = product?.productName
//            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    var stackView:  UIStackView!
    
    private let productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let productDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
 
        self.backgroundColor = .red
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)

        headerInfo()
        
    }
    
    func headerInfo(){
        let text1 = UILabel()
        text1.text = "Nuevo | 14 vendidos"
        
        let text2 = UILabel()
        text2.text = "Nuevo2"
        
        let text3 = UILabel()
        text3.text = "Nuevo3"
        
        stackView = UIStackView(arrangedSubviews: [text1, text2, text3])
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .green
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
