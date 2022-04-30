//
//  PriceCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import FSPagerView
import UIKit

class PriceCell: UITableViewCell {
    var product: Result? {
        didSet {
            let price = HelperCurrency.convertCurrency(price: product?.price ?? 0)
            priceLabel.text = price
            coutasLabel.text = "Hasta 48 coutas"
            moreInformationLabel.text = "Más información"
            disocuntLabel.text = "51% OFF"
        }
    }
    var sectionPrice: UIView!
    var priceLabel: UILabel!
    var disocuntLabel: UILabel!
    var coutasLabel: UILabel!
    var moreInformationLabel: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        priceSection()
    }
    func priceSection() {
        sectionPrice = UIView()
        sectionPrice.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sectionPrice)
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 32)
        sectionPrice.addSubview(priceLabel)
        disocuntLabel = UILabel()
        disocuntLabel.translatesAutoresizingMaskIntoConstraints = false
        disocuntLabel.font = UIFont.systemFont(ofSize: 16)
        disocuntLabel.textColor = UIColor(named: "colorGreenMeli")
        sectionPrice.addSubview(disocuntLabel)
        coutasLabel = UILabel()
        coutasLabel.translatesAutoresizingMaskIntoConstraints = false
        coutasLabel.font = UIFont.systemFont(ofSize: 14)
        sectionPrice.addSubview(coutasLabel)
        moreInformationLabel = UILabel()
        moreInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        moreInformationLabel.textColor = UIColor(named: "colorBlueMeli")
        moreInformationLabel.font = UIFont.systemFont(ofSize: 14)
        sectionPrice.addSubview(moreInformationLabel)
        sectionPrice.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(sectionPrice.snp.leading)
        }
        disocuntLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(priceLabel.snp.trailing).offset(20)
            make.centerY.equalTo(priceLabel.snp.centerY)
        }
        coutasLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(15)
            make.leading.equalTo(sectionPrice.snp.leading).offset(20)
            make.trailing.equalTo(sectionPrice.snp.trailing)
            make.centerX.equalTo(self.snp.centerX)
        }
        moreInformationLabel.snp.makeConstraints { make in
            make.top.equalTo(coutasLabel.snp.bottom)
            make.leading.equalTo(sectionPrice.snp.leading).offset(20)
            make.trailing.equalTo(sectionPrice.snp.trailing)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(sectionPrice.snp.bottom)
        }
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
