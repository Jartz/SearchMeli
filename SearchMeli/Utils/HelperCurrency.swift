//
//  HelperCurrency.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation

class HelperCurrency {
    
    
    static func convertCurrency(price: Int) -> String{
        let myDouble = Double(price)
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.groupingSeparator = ","
        currencyFormatter.maximumFractionDigits = 0
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current

        // We'll force unwrap with the !, if you've got defined data you may need more error checking

        let priceString = currencyFormatter.string(from: NSNumber(value: myDouble))!
        return priceString // Displays $9,999.99 in the US locale
    }
}
