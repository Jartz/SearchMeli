//
//  QuantityCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit


class QuantityCell : UITableViewCell  {
    
    var product : ProductModel? {
        didSet {
//            productImage.image = product?.productImage
//            productNameLabel.text = product?.productName
//            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    var quiantitySection: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        quantitySection()
        
    }
    
    
    func quantitySection(){
        
         quiantitySection = UIView()
        quiantitySection.backgroundColor = .gray
        quiantitySection.translatesAutoresizingMaskIntoConstraints = false
        let text1 = UILabel()
        text1.text = "Cantidad:"
        text1.translatesAutoresizingMaskIntoConstraints = false
        
        let text2 = UILabel()
        text2.text = "1"
        text2.translatesAutoresizingMaskIntoConstraints = false
        
        let text3 = UILabel()
        text3.text = "(9 Disponibles)"
        text3.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImageView()
        image.image = UIImage(named: "share")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(quiantitySection)
        quiantitySection.addSubview(text1)
        quiantitySection.addSubview(text2)
        quiantitySection.addSubview(text3)
        quiantitySection.addSubview(image)
        
        quiantitySection.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        text1.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        text2.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(text1.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        text3.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(text2.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.bottom.equalTo(self.snp.bottom)
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
