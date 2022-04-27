//
//  ProductCard.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit
import Kingfisher


class ProductCard : UITableViewCell  {
    
    var product : Result? {
        didSet {
            if let p = product {

                let value = HelperCurrency.convertCurrency(price: p.price ?? 0)
                let price = p.price != nil ? (value) : "$0.00"
                let discounts = p.discounts != nil ? "\(p.discounts!)%" : ""
                let buyingMode = p.shipping?.freeShipping ?? false  ? "Envio Gratis" : ""
                let quantity =  p.installments?.quantity != nil ? "\(p.installments!.quantity!)" : ""
                let amount =  p.installments?.amount != nil ? "\(p.installments!.amount!)" : ""
                
                let coutas = quantity.isEmpty ? "" :  "en \(quantity)x $\(amount)"
                titleLabel.text = p.title
                priceLabel.text = price
                discountLabel.text = discounts
                freeShippingLabel.text = buyingMode
                nameSeller.text = coutas
                guard let url = URL(string:  product?.thumbnail ?? "") else {
                    return
                }
                imagenView.kf.setImage(with: url)
                
                if(p.shipping?.freeShipping ?? false){
                    freeShippingLabel.textColor = UIColor(named: "colorGreenMeli")
                }else {
                    freeShippingLabel.textColor = UIColor.gray.withAlphaComponent(0.7)
                }
            }
        }
    }
    
    var imageContainer: UIView!
    var infoContainer: UIStackView!
    
    var titleLabel: UILabel!
    var imagenView: UIImageView!
    
    var priceLabel: UILabel!
    var discountLabel: UILabel!
    var freeShippingLabel: UILabel!
    var nameSeller: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setup()
    }
    
    
    func setup(){
        sectionImage()
        sectionInfo()
    }
    
    func sectionImage(){
        imageContainer = UIView()
       
        imageContainer.backgroundColor = UIColor(named: "colorGrayMeli")
        imageContainer.layer.cornerRadius = 8
        
        imagenView = UIImageView()
        imagenView.contentMode = .scaleAspectFit
        
        self.addSubview(imageContainer)
        imageContainer.addSubview(imagenView)

        imageContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading)
            make.width.equalTo(self.frame.size.width * 0.5)
            make.height.equalTo(self.frame.size.width * 0.5)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        imagenView.snp.makeConstraints { make in
            make.top.equalTo(imageContainer.snp.top).offset(10)
            make.leading.equalTo(imageContainer.snp.leading).offset(10)
            make.trailing.equalTo(imageContainer.snp.trailing).offset(-10)
            make.bottom.equalTo(imageContainer.snp.bottom).offset(-10)
        }
        
    }
    
    func sectionInfo(){
        infoContainer = UIStackView()
        titleLabel = UILabel()
        priceLabel = UILabel()
        discountLabel = UILabel()
        freeShippingLabel = UILabel()
        nameSeller = UILabel()
        
        infoContainer.addSubview(titleLabel)
        infoContainer.addSubview(priceLabel)
        infoContainer.addSubview(discountLabel)
        infoContainer.addSubview(freeShippingLabel)
        infoContainer.addSubview(nameSeller)
        
        infoContainer = UIStackView(arrangedSubviews: [titleLabel, freeShippingLabel,priceLabel,nameSeller,discountLabel])
        infoContainer.axis = .vertical
        infoContainer.distribution = .equalCentering
        
        self.addSubview(infoContainer)
    
        infoContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.equalTo(imageContainer.snp.trailing).offset(8)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
        
        titleLabel.numberOfLines = 3
        titleLabel.font = UIFont.systemFont(ofSize: 14)
    
        priceLabel.font = UIFont.systemFont(ofSize: 22)
        
        discountLabel.font = UIFont.systemFont(ofSize: 14)
        discountLabel.textColor = UIColor(named: "colorGreenMeli")
        
        freeShippingLabel.font = UIFont.systemFont(ofSize: 14)
        
        nameSeller.font = UIFont.systemFont(ofSize: 14)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
