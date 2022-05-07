//
//  SearchViewModel.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import Combine

class ProductVM: ObservableObject {
    @Published  var dataSource: ProductResponse?
    @Published  var product: ProductModel?
    @Published  var error: Bool? = false
    var subscriptions = Set<AnyCancellable>()
    func getProductList(text: String) {
        if text.count < 3 {
            return
        }
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProductList(text: text)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("[Search] error \(error.localizedDescription)")
                    self.error = true
                case .finished:
                    break
                }
            } receiveValue: { (response) in
                self.dataSource = response
            }
            .store(in: &subscriptions)
    }
    func getProduct(id: String) {
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProduct(productId: id)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                    self.error = true
                case .finished:
                    break
                }
            } receiveValue: { (response) in
                self.product = response
            }
            .store(in: &subscriptions)
    }
}
