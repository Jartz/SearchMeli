//
//  SearchViewModel.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import Combine

class SearchVM : ObservableObject {
    
    @Published var dataSource: ProductResponse? = nil
    @Published var product: ProductModel? = nil
    var subscriptions = Set<AnyCancellable>()
    
    func getProductList(text:String){
        if text.count < 3 {
            return
        }
        
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProductList(text: text)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    break
                }
            } receiveValue: { (response) in
                self.dataSource = response
            }
            .store(in: &subscriptions)
    }
    
    func getProduct(id:String){
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProduct(productId: id)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    break
                }
            } receiveValue: { (response) in
                self.product = response
            }
            .store(in: &subscriptions)
    }
    
}
