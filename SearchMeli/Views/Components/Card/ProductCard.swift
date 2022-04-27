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
            titleLabel.text = product?.title
            
            guard let url = URL(string:  product?.thumbnail ?? "") else {
                return
            }
            imagenView.kf.setImage(with: url)
        }
    }
    
    var imageContainer: UIView!
    var infoContainer: UIView!
    
    var titleLabel: UILabel!
    var imagenView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    
    func setup(){
        sectionImage()
        sectionInfo()
    }
    
    func sectionImage(){
        imageContainer = UIView()
        self.addSubview(imageContainer)
        
        imagenView = UIImageView()
        imageContainer.addSubview(imagenView)
    
        
        let widthIamge = self.frame.size.width * 0.4
        let hegihtImage = widthIamge * 0.7
        
        imageContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.width.equalTo(widthIamge)
            make.height.equalTo(hegihtImage)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        imagenView.snp.makeConstraints { make in
            make.top.equalTo(imageContainer.snp.top)
            make.leading.equalTo(imageContainer.snp.leading)
            make.trailing.equalTo(imageContainer.snp.trailing)
            make.bottom.equalTo(imageContainer.snp.bottom)
        }
        
    }
    
    func sectionInfo(){
        infoContainer = UIView()
        self.addSubview(infoContainer)
        infoContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(imageContainer.snp.trailing)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
       
        titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        infoContainer.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoContainer.snp.top)
            make.leading.equalTo(infoContainer.snp.leading)
            make.trailing.equalTo(infoContainer.snp.trailing)
            make.bottom.equalTo(infoContainer.snp.bottom)
        }
    }
    
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
