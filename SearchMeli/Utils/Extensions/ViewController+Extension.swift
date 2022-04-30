//
//  ViewController+Extension.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/28/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIViewController {
     func internetConnection() {
        if InternetConnectionManager.isConnectedToNetwork() {
        } else {
            let view = UIView()
            self.view.addSubview(view)
            view.backgroundColor = UIColor(named: "colorBackgroundMeli")
            view.snp.makeConstraints { make in
                make.top.equalTo(self.view.snp.top).offset(98)
                make.leading.equalTo(self.view.snp.leading)
                make.trailing.equalTo(self.view.snp.trailing)
                make.bottom.equalTo(self.view.snp.bottom)
            }
            let image = UIImageView()
            image.image = UIImage(named: "internet")
            self.view.addSubview(image)
            image.contentMode = .scaleAspectFit
            image.snp.makeConstraints { make in
                make.width.equalTo(self.view.snp.width)
                make.height.equalTo(150)
                make.centerX.equalTo(self.view.snp.centerX)
                make.centerY.equalTo(self.view.snp.centerY)
            }
        }
    }
    func clearCache() {
        let cache = KingfisherManager.shared.cache
        cache.clearMemoryCache()
        cache.clearDiskCache(completion: nil)
        cache.cleanExpiredDiskCache()
    }
    func loadingSpinner() {
        DispatchQueue.main.async {
        let spinnerview = SpinnerView()
        self.view.addSubview(spinnerview)
        self.view.bringSubviewToFront(spinnerview)
        spinnerview.tag = 100
        spinnerview.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY)
        }
        }
    }
    func hideSpinner() {
        DispatchQueue.main.async {
            if let viewWithTag = self.view.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
            }
        }
    }
}
