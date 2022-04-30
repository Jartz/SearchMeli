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
    var meliServiceBaseUrl: String {
        switch self {
        case .development:
            return "https://api.mercadolibre.com"
        case .staging:
            return "https://api.mercadolibre.com"
        case .production:
            return ""
        }
    }
}
