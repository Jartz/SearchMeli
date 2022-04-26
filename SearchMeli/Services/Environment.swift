//
//  Environment.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/26/22.
//


public enum Environment: String, CaseIterable {
    case development
    case staging
    case production
}

extension Environment {
    var purchaseServiceBaseUrl: String {
        switch self {
        case .development:
            return "https://dev-combine.com/purchaseService"
        case .staging:
            return "https://stg-combine.com/purchaseService"
        case .production:
            return "https://combine.com/purchaseService"
        }
    }
}
