//
//  Date+Extension.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

extension DateFormatter {
    
    static let expenseRelativeFormatter: DateFormatter =  {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.doesRelativeDateFormatting = true
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter
    }()
    
}
