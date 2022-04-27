//
//  ButtonCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit


class ButtonCell : UITableViewCell  {
    
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

        buttonBuy()
        
    }
    
    
    func buttonBuy(){
        let button = UIButton()
        button.setTitle("Comprar Ahora", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(100)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
