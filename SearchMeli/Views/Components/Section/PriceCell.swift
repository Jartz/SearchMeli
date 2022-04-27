//
//  PriceCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import FSPagerView
import UIKit


class PriceCell : UITableViewCell  {
    
    var product : ProductModel? {
        didSet {
//            productImage.image = product?.productImage
//            productNameLabel.text = product?.productName
//            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    var sectionPrice: UIView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .green
        priceSection()
        
    }
    
   
    
    func priceSection(){
        
        sectionPrice = UIView()
        sectionPrice.translatesAutoresizingMaskIntoConstraints = false
        sectionPrice.backgroundColor = .red
        self.addSubview(sectionPrice)
        
        let text1 = UILabel()
        text1.text = "$ 723.900"
        text1.translatesAutoresizingMaskIntoConstraints = false
        sectionPrice.addSubview(text1)
        
        let text2 = UILabel()
        text2.text = "Hasta 48 coutas"
        text2.translatesAutoresizingMaskIntoConstraints = false
        sectionPrice.addSubview(text2)
        
        let text3 = UILabel()
        text3.text = "Mas información"
        text3.translatesAutoresizingMaskIntoConstraints = false
        sectionPrice.addSubview(text3)
        
        sectionPrice.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }

        
        text1.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(sectionPrice.snp.leading)
            make.trailing.equalTo(sectionPrice.snp.trailing)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        text2.snp.makeConstraints { make in
            make.top.equalTo(text1.snp.bottom)
            make.leading.equalTo(sectionPrice.snp.leading)
            make.trailing.equalTo(sectionPrice.snp.trailing)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        text3.snp.makeConstraints { make in
            make.top.equalTo(text2.snp.bottom)
            make.leading.equalTo(sectionPrice.snp.leading)
            make.trailing.equalTo(sectionPrice.snp.trailing)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(sectionPrice.snp.bottom)
        }
       
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
