//
//  InitialAcountView.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit

class InitialCell: UITableViewCell {
    var vc: UIViewController!
    var stackContainer: UIStackView!
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupView()
    }
    func setupView() {
        let title = UILabel()
        title.text = "!Crea una cuenta y mejora tu experiencia!"
        let button = UIButton()
        button.setTitle("Crear cuenta", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "colorBlueMeli")
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(activeAlert), for: .touchUpInside)
        button.layer.cornerRadius = 6
        let buttonIn = UIButton()
        buttonIn.setTitle("Ingresar a mi cuenta", for: .normal)
        buttonIn.translatesAutoresizingMaskIntoConstraints = false
        buttonIn.setTitleColor( UIColor(named: "colorBlueMeli"), for: .normal)
        buttonIn.isUserInteractionEnabled = true
        buttonIn.addTarget(self, action: #selector(activeAlert), for: .touchUpInside)
        buttonIn.layer.cornerRadius = 6
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 13
        container.clipsToBounds = true
        self.addSubview(container)
        container.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.height.equalTo(160)
        }
        stackContainer = UIStackView(arrangedSubviews: [title, button, buttonIn])
        container.addSubview(stackContainer)
        stackContainer.axis = .vertical
        stackContainer.distribution = .fillEqually
        stackContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
    }
    @objc func activeAlert() {
        HelperUI.showAlert(vc: self.vc)
    }
}
