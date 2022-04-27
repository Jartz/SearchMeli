//
//  TitleInfoCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation

import UIKit
class TitleInfoCell : UITableViewCell {
    
    var product : Result? {
        didSet {
            totalSell.text = "Nuevo | 14 vendidos"
            titleLabel.text = product?.title
        }
    }
    
    var stackView:  UIStackView!
    var totalSell: UILabel!
    var titleLabel: UILabel!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        headerInfo()
        
    }
    
    func headerInfo(){
        totalSell = UILabel()
        totalSell.font = UIFont.systemFont(ofSize: 14)
        totalSell.textColor = UIColor.gray.withAlphaComponent(0.7)
        
         titleLabel = UILabel()
       
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        
        let text3 = UILabel()
        text3.text = ""
        
        stackView = UIStackView(arrangedSubviews: [totalSell, titleLabel, text3])
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
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
