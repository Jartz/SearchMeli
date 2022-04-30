//
//  SearchMeliTests.swift
//  SearchMeliTests
//
//  Created by Julian Ramos on 4/25/22.
//

import XCTest
import Combine
@testable import SearchMeli

class SearchMeliTests: XCTestCase {
    
     var subscriptions: Set<AnyCancellable> = []
     var cancelable: Set<AnyCancellable> = []
    
     let text = "cama"
     let idProduct = "MCO830877599"
    
     let viewmodel = SearchVM()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        print("==FINISHED==")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    ///
    /// check the service /sites/MCO/search?q={text}
    ///
    /// - Parameters:
    ///     - text: it must be any string.
    func testGetProduct() throws {
      
        var products: [Result] = []
        XCTAssert(products.count == 0, "Initial Empty product list")
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        let expectation = XCTestExpectation(description: "Call Service")
        service.getProductList(text: text)
            .sink { (completion) in
                switch completion {
                case .failure:
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { (reponse) in
                if let results = reponse.results {
                    products = results
                    XCTAssert(products.count > 0, "Products loaded")
                    if let id = results[0].id{
                        print(id)
                        XCTAssert(!id.isEmpty,"Product with ID")
                    }
                }else{
                    XCTFail()
                }
                
            }.store(in: &subscriptions)
        
       wait(for: [expectation], timeout: 3.5)

    }
    ///
    /// check the service /items/{productId}
    ///
    /// - Parameters:
    ///     - id: The *id*  must be of a real product.
    func testGetProductById() throws {
      
        var products: ProductModel!
        XCTAssert(products == nil, "Initial Empty product")
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        let expectation = XCTestExpectation(description: "Call Service")
        service.getProduct(productId: idProduct)
            .sink { (completion) in
                switch completion {
                case .failure:
                    XCTFail()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { (reponse) in
                    products = reponse
                    if let id = products.id {
                        print(id)
                        XCTAssert(!id.isEmpty,"Product with title")
                    }
            }.store(in: &subscriptions)
        
       wait(for: [expectation], timeout: 3.5)

    }
    /// PROVOCATE ERROR
    ///
    ///check the service /items/{productId}
    ///
    /// - Parameters:
    ///     - text: it must be empty string.
    func testGetProducstError() throws {
        let text = ""
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        let expectation = XCTestExpectation(description: "Call Service")
        service.getProductList(text: text)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (SearchMeli.NetworkError error 2.)")
                    expectation.fulfill()
                case .finished:
                    break
                }
            } receiveValue: { (reponse) in
                XCTFail()
            }.store(in: &subscriptions)
        
        wait(for: [expectation], timeout: 6.5)
        
    }
    
    /// PROVOCATE ERROR
    ///
    /// check the service /sites/MCO/search?q={text}
    ///
    /// - Parameters:
    ///     - text: it must be empty string.
    func testGetProductByIdError() throws {
        let id = ""
        let service = MeliService(networkRequest: NativeRequestable(), environment: .development)
        let expectation = XCTestExpectation(description: "Call Service")
        service.getProduct(productId: id)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (SearchMeli.NetworkError error 2.)")
                    expectation.fulfill()
                case .finished:
                    break
                }
            } receiveValue: { (reponse) in
                XCTFail()
            }.store(in: &subscriptions)
        wait(for: [expectation], timeout: 6.5)
    }
    /// viewmodel
    ///
    ///
    func testProductListReceived() {
        let expectation = XCTestExpectation(description: "Call Service")
        viewmodel.getProductList(text: text)
        viewmodel.$dataSource.sink { response in
            if let result =  response?.results {
                XCTAssert(!(result[0].id?.isEmpty ?? false), "Product with ID")
                expectation.fulfill()
            }
           
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 3.5)
        
    }
    func testProductReceived() {
        let expectation = XCTestExpectation(description: "Call Service")
        viewmodel.getProduct(id: idProduct)
        viewmodel.$product.sink { product in
            if let id = product?.id {
                print(id)
                XCTAssert(!id.isEmpty,"Product with title")
            }
        expectation.fulfill()
        }.store(in: &cancelable)
        wait(for: [expectation], timeout: 3.5)
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
