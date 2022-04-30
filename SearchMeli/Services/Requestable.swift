//
//  Requestable.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//
import Combine
import Foundation

public protocol Requestable {
    var requestTimeOut: Float { get }
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
