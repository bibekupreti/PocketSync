//
//  AddExpenseModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

struct AddExpenseModel {
    let category: ExpenseCategory
    let amount: Double
    let note: String
    let paymentMethod: PaymentMethod
}
