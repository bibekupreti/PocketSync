//
//  AddExpenseValidation.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

enum ValidationResult {
    case valid
    case invalid(String)
}

enum AddExpenseValidator {

    static func validate(_ model: ExpenseFormModel) -> ValidationResult {

        var missingFields: [String] = []

        if model.amount <= 0 {
            missingFields.append("amount")
        }

        if model.category == nil {
            missingFields.append("category")
        }

        if model.note.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            missingFields.append("note")
        }

        if model.paymentMethod == nil {
            missingFields.append("payment method")
        }

        guard !missingFields.isEmpty else {
            return .valid
        }

        let message: String

        switch missingFields.count {
        case 1:
            message = "Please enter \(missingFields[0])."

        case 2:
            message = "Please enter \(missingFields[0]) and \(missingFields[1])."

        default:
            let last = missingFields.removeLast()
            message = "Please enter \(missingFields.joined(separator: ", ")) and \(last)."
        }

        return .invalid(message)
    }
    
}

