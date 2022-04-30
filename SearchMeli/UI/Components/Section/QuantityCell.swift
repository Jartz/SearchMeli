//
//  QuantityCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit

class QuantityCell: UITableViewCell {
    var product: Result? {
        didSet {
            quantityLabel.text = "1"
            let valueInStore =  "(\(String(product?.soldQuantity ?? 0)) Disponibles)"
            quantityInStoreLabel.text = valueInStore
        }
    }
    var quiantitySection: UIView!
    var titleLabel: UILabel!
    var quantityLabel: UILabel!
    var quantityInStoreLabel: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        quantitySection()
    }
    func quantitySection() {
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
        quantityLabel = UILabel()
        quantityLabel.text = "1"
        quantityLabel.font = UIFont.boldSystemFont(ofSize: 14)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityInStoreLabel = UILabel()
        quantityInStoreLabel.text = "(9 Disponibles)"
        quantityInStoreLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityInStoreLabel.textColor = .gray.withAlphaComponent(0.4)
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.forward")
        image.tintColor = UIColor(named: "colorBlueMeli")
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        self.addSubview(quiantitySection)
        quiantitySection.addSubview(text1)
        quiantitySection.addSubview(quantityLabel)
        quiantitySection.addSubview(quantityInStoreLabel)
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
        quantityLabel.snp.makeConstraints { make in
            make.top.equalTo(quiantitySection.snp.top)
            make.leading.equalTo(text1.snp.trailing).offset(8)
            make.bottom.equalTo(quiantitySection.snp.bottom)
        }
        quantityInStoreLabel.snp.makeConstraints { make in
            make.top.equalTo(quiantitySection.snp.top)
            make.leading.equalTo(quantityLabel.snp.trailing).offset(16)
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
