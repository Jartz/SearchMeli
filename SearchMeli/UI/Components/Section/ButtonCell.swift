//
//  ButtonCell.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit

class ButtonCell: UITableViewCell {
    weak var vc: UIViewController?
    var product: ProductModel? {
        didSet {
        }
    }
    var quiantitySection: UIView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buttonBuy()
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    func buttonBuy() {
        let button = UIButton()
        self.addSubview(button)
        button.setTitle("Comprar Ahora", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "colorBlueMeli")
        button.addTarget(self, action: #selector(activeAlert), for: .touchUpInside)
        button.layer.cornerRadius = 6
        button.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
    }
    @objc func activeAlert(sender: UIButton) {
        guard let vc = self.vc else {return }
        HelperUI.showAlert(vc: vc)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
