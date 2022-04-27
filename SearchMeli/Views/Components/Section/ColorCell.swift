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
        }
    }
    
    var Section:  UIView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        colorSection()
        
    }
    
    
    func colorSection(){
        let text1 = UILabel()
        text1.text = "Color:"
        text1.font = UIFont.systemFont(ofSize: 14)
        
        let text2 = UILabel()
        text2.text = "Marron"
        text2.font = UIFont.boldSystemFont(ofSize: 14)
        
        Section = UIView()
        Section.backgroundColor = UIColor(named: "colorGrayMeli")
        Section.translatesAutoresizingMaskIntoConstraints = false
        Section.layer.cornerRadius = 8
        
        Section.translatesAutoresizingMaskIntoConstraints = false
        text1.translatesAutoresizingMaskIntoConstraints = false
        text2.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(Section)
        
        Section.addSubview(text1)
        Section.addSubview(text2)
        
        Section.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
            make.height.equalTo(60)
        }
        
        text1.snp.makeConstraints { make in
            make.top.equalTo(Section.snp.top).offset(10)
            make.leading.equalTo(Section.snp.leading).offset(10)
            make.trailing.equalTo(Section.snp.trailing).offset(10)
        }
        
        text2.snp.makeConstraints { make in
            make.top.equalTo(text1.snp.bottom)
            make.leading.equalTo(Section.snp.leading).offset(10)
            make.trailing.equalTo(Section.snp.trailing).offset(10)
            make.bottom.equalTo(Section.snp.bottom).offset(-10)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
