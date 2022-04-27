//
//  ColorCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//


import Foundation
import FSPagerView
import UIKit


class ColorCell : UITableViewCell  {
    
    var stackViewColor:  UIStackView!
    var product : ProductModel? {
        didSet {
//            productImage.image = product?.productImage
//            productNameLabel.text = product?.productName
//            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    var stackView:  UIStackView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .green
        colorSection()
        
    }
    
   
    func colorSection(){
        let text1 = UILabel()
        text1.text = "Color:"
        
        let text2 = UILabel()
        text2.text = "Marron"
        
        stackViewColor = UIStackView(arrangedSubviews: [text1, text2])
        stackViewColor.axis = .vertical
        stackViewColor.spacing = 5.0
        stackViewColor.alignment = .fill
        stackViewColor.distribution = .fillEqually
        stackViewColor.translatesAutoresizingMaskIntoConstraints = false
        stackViewColor.backgroundColor = .gray
        
        self.addSubview(stackViewColor)
        stackViewColor.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
