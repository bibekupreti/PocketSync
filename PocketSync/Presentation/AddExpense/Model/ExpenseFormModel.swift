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

extension ExpenseFormModel {
    init(from expense: Expense) {
        self.init()
        self.category = expense.category
        self.paymentMethod = expense.paymentMethod
        self.amount = expense.amount
        self.date = expense.createdAt
        self.note = expense.note
    }
}
