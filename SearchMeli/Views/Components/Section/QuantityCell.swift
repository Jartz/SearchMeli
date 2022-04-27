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
    var titleLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        quantitySection()
        
    }
    
    
    func quantitySection(){
        titleLabel = UILabel()
        titleLabel.text = "Stock disponible"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        quiantitySection = UIView()
        quiantitySection.backgroundColor = UIColor(named: "colorGrayMeli")
        quiantitySection.translatesAutoresizingMaskIntoConstraints = false
        quiantitySection.layer.cornerRadius = 8
        
        
        
        let text1 = UILabel()
        text1.text = "Cantidad:"
        text1.translatesAutoresizingMaskIntoConstraints = false
        
        let text2 = UILabel()
        text2.text = "1"
        text2.font = UIFont.boldSystemFont(ofSize: 14)
        text2.translatesAutoresizingMaskIntoConstraints = false
        
        let text3 = UILabel()
        text3.text = "(9 Disponibles)"
        text3.translatesAutoresizingMaskIntoConstraints = false
        text3.textColor = .gray.withAlphaComponent(0.4)
        
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.forward")
        image.tintColor = UIColor(named: "colorBlueMeli")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        self.addSubview(quiantitySection)
        quiantitySection.addSubview(text1)
        quiantitySection.addSubview(text2)
        quiantitySection.addSubview(text3)
        quiantitySection.addSubview(image)
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        quiantitySection.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(60)
        }
        
        text1.snp.makeConstraints { make in
            make.top.equalTo(quiantitySection.snp.top).offset(10)
            make.leading.equalTo(quiantitySection.snp.leading).offset(10)
            make.bottom.equalTo(quiantitySection.snp.bottom).offset(-10)
        }
        
        text2.snp.makeConstraints { make in
            make.top.equalTo(quiantitySection.snp.top)
            make.leading.equalTo(text1.snp.trailing).offset(8)
            make.bottom.equalTo(quiantitySection.snp.bottom)
        }
        
        text3.snp.makeConstraints { make in
            make.top.equalTo(quiantitySection.snp.top)
            make.leading.equalTo(text2.snp.trailing).offset(16)
            make.bottom.equalTo(quiantitySection.snp.bottom)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(quiantitySection.snp.top).offset(20)
            make.trailing.equalTo(quiantitySection.snp.trailing).offset(-10)
            make.height.equalTo(20)
            make.width.equalTo(16)
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
