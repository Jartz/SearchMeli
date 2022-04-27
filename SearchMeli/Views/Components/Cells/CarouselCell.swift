//
//  CarouselCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import FSPagerView
import UIKit


class CarouselCell : UITableViewCell,  FSPagerViewDataSource, FSPagerViewDelegate {
    
    var pagerView: FSPagerView!
    var product : ProductModel? {
        didSet {
//            productImage.image = product?.productImage
//            productNameLabel.text = product?.productName
//            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    var stackView:  UIStackView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .green
        carrousel()
        
    }
    
    func carrousel(){
        // Create a pager view
        pagerView = FSPagerView(frame:CGRect(x: 0, y: 0, width: self.frame.width, height: 300))
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.backgroundView?.backgroundColor = .yellow
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
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
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 2
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
           cell.imageView?.image = UIImage(named: "banner-home-1")
           return cell
    }
    
}
