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
        
//        guard let url2 = URL(string: "https://api.mercadolibre.com/sites/MCO/search?q=Camas") else { return }
//
//        let task = URLSession.shared.dataTask(with: url2, completionHandler: { (data, response, error) in
//            guard let data = data else { return }
//            //  print(String(data: data, encoding: .utf8)!)
//            do{
//            let data = try JSONDecoder().decode(ProductResponse.self, from: data)
//                self.dataSource = data
//            } catch(let error){
//                print(error)
//            }
//
//
//        })
//        task.resume()
        

        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        service.getProductList(text: text)
            .sink { (completion) in
                print("sdfsdfsdf")
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
