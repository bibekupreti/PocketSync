//
//  Decimal+Extension.swift
//  PocketSync
//
//  Created by Bibek upreti on 28/07/2026.
//

import Foundation

extension Decimal {

    var currencyString: String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"

        return formatter.string(
            from: self as NSDecimalNumber
        ) ?? "$0.00"
    }
    
}
