//
//  AdsCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import FSPagerView
import UIKit

class AdsCell: UITableViewCell {
    var stackView: UIStackView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    func carrousel(_ pagerView: FSPagerView?) {
        if let pagerView = pagerView {
            pagerView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(pagerView)
            pagerView.snp.makeConstraints { make in
                make.top.equalTo(self.snp.top)
                make.leading.equalTo(self.snp.leading)
                make.trailing.equalTo(self.snp.trailing)
                make.height.equalTo(180)
                make.bottom.equalTo(self.snp.bottom).offset(-20)
            }
        }
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
