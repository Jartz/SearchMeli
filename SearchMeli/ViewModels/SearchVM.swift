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
                    print("nothing much to do here")
                }
            } receiveValue: { (response) in
                print("got my response here \(response)")
                self.dataSource = response
            }
            .store(in: &subscriptions)
    }
    
    func getProduct(id:Int){
        var subscriptions = Set<AnyCancellable>()
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProduct(productId: id)
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
