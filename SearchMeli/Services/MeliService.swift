//
//  PurchaseService.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//

import Combine
import Foundation

protocol PurchaseServiceable {
    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponse, NetworkError>
    func getProduct(productId: Int) -> AnyPublisher<ProductModel, NetworkError>
  //Instead of using Void I use NoReply for requests that might give 200 with empty response
    func cancelOrder(_ orderId: Int) -> AnyPublisher<ProductModel, NetworkError>
}

class PurchaseService: PurchaseServiceable {
  
  
    
    private var networkRequest: Requestable
    private var environment: Environment = .development
    
  // inject this for testability
    init(networkRequest: Requestable, environment: Environment) {
        self.networkRequest = networkRequest
        self.environment = environment
    }

    func purchaseProduct(request: PurchaseRequest) -> AnyPublisher<PurchaseResponse, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.purchaseProduct(request: request)
        let request = endpoint.createRequest(token: "token",
                                             environment: self.environment)
        return self.networkRequest.request(request)
    }
    
    func getProduct(productId: Int) -> AnyPublisher<ProductModel, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.getProduct(productId: productId)
        let request = endpoint.createRequest(token: "token",
                                             environment: self.environment)
        return self.networkRequest.request(request)
    }
    
    func cancelOrder(_ orderId: Int) -> AnyPublisher<ProductModel, NetworkError> {
        let endpoint = PurchaseServiceEndpoints.cancelOrder(orderId: orderId)
        let request = endpoint.createRequest(token: "token",
                                             environment: self.environment)
        return self.networkRequest.request(request)
    }
    
  
}


public struct PurchaseRequest: Encodable {
    public let products: [String]
    public let cost: Int
}

public struct PurchaseResponse: Codable {
    public let id: Int
    public let productName: String
}

