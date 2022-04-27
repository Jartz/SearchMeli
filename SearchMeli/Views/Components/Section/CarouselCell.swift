//
//  CarouselCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import FSPagerView
import UIKit


class CarouselCell : UITableViewCell{
 
    var product : ProductModel? {
        didSet {
            pictures = product?.pictures
        }
    }
    
    var stackView:  UIStackView!
    var pictures: [Picture]!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
      
    }
    
    func carrousel(_ pagerView: FSPagerView?){
        if let pagerView = pagerView {
            pagerView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(pagerView)
            
            pagerView.snp.makeConstraints { make in
                make.top.equalTo(self.snp.top)
                make.leading.equalTo(self.snp.leading)
                make.trailing.equalTo(self.snp.trailing)
                make.height.equalTo(200)
                make.bottom.equalTo(self.snp.bottom)
             
            }
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
  
    
}
