//
//  ServiceEndpoints.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//
public typealias Headers = [String: String]

// if you wish you can have multiple services like this in a project
enum PurchaseServiceEndpoints {
    
  // organise all the end points here for clarity
    case purchaseProduct(request: PurchaseRequest)
    case getProduct(productId: String)
    case getProductList(text: String)
    case cancelOrder(orderId: Int)
    
  // gave a default timeout but can be different for each.
    var requestTimeOut: Int {
        return 20
    }
    
  //specify the type of HTTP request
    var httpMethod: HTTPMethod {
        switch self {
        case .purchaseProduct,
             .cancelOrder:
            return .POST
        case .getProduct,.getProductList:
            return .GET
        }
    }
    
  // compose the NetworkRequest
    func createRequest(token: String, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        headers["Authorization"] = "Bearer \(token)"
        return NetworkRequest(url: getURL(from: environment), headers: headers, reqBody: requestBody, httpMethod: httpMethod)
    }
    
  // encodable request body for POST
    var requestBody: Encodable? {
        switch self {
        case .purchaseProduct(let request):
            return request
        default:
            return nil
        }
    }
    
  // compose urls for each request
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.meliServiceBaseUrl
        switch self {
        case .getProductList(let text):
            return "\(baseUrl)/sites/MCO/search?q=\(text)"
        case .purchaseProduct:
            return "\(baseUrl)/purchase"
        case .getProduct(let productId):
            return "\(baseUrl)/items/\(productId)"
        case .cancelOrder(let orderId):
            return "\(baseUrl)/products/\(orderId)/cancel"
        }
    }
}
