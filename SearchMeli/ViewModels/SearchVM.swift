//
//  SearchViewModel.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Foundation
import Combine

class SearchVM {
    
    func getProduct(){
        var subscriptions = Set<AnyCancellable>()
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProduct(productId: 123)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { (response) in
                print("got my response here \(response)")
            }
            .store(in: &subscriptions)
    }
    
}
