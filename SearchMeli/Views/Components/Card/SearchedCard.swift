//
//  SearchedCard.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//


import Foundation
import UIKit
import Kingfisher


class SearchedCard : UITableViewCell  {
    
    var product : Result? {
        didSet {
            titleLabel.text = product?.title
        
        }
    }
    
    var infoContainer: UIView!
    
    var titleLabel: UILabel!
    var imagenView: UIImageView!
    var imagenSelectView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setup()
    }
    

    func setup(){
        sectionInfo()
    }
    

    func sectionInfo(){
        infoContainer = UIView()
        self.addSubview(infoContainer)
        
        let colorIcon = UIColor.gray.withAlphaComponent(0.4)
        
        imagenSelectView = UIImageView()
        imagenSelectView.image = UIImage(named: "diagonal-icon")
        imagenSelectView.image = imagenSelectView.image?.withRenderingMode(.alwaysTemplate)
        imagenSelectView.tintColor = colorIcon
        infoContainer.addSubview(imagenSelectView)
        
        imagenView = UIImageView()
        imagenView.image = UIImage(named: "time-icon")
        imagenView.image = imagenView.image?.withRenderingMode(.alwaysTemplate)
        imagenView.tintColor = colorIcon
        imagenView.contentMode = .scaleAspectFill
        infoContainer.addSubview(imagenView)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        infoContainer.addSubview(titleLabel)
        
        let widthIamge = 16
        let heightImage = widthIamge

       
        
        
        infoContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
    
        
        imagenView.snp.makeConstraints { make in
            make.top.equalTo(infoContainer.snp.top)
            make.leading.equalTo(infoContainer.snp.leading)
            make.bottom.equalTo(infoContainer.snp.bottom)
            make.height.equalTo(heightImage)
            make.width.equalTo(widthIamge)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(infoContainer.snp.top)
            make.leading.equalTo(imagenView.snp.trailing).offset(10)
            make.trailing.equalTo(imagenSelectView.snp.leading).offset(-10)
            make.bottom.equalTo(infoContainer.snp.bottom)
        }
        
        
        imagenSelectView.snp.makeConstraints { make in
            make.top.equalTo(infoContainer.snp.top)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
    }
    
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
