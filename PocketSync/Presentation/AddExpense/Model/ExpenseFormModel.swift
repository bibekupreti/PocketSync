//
//  AddExpenseModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

struct ExpenseFormModel {
    var category: ExpenseCategory?
    var paymentMethod: PaymentMethod?
    var amount: Decimal = 0.00
    var date: Date = .now
    var note: String = ""
}
