//
//  ExpenseFactory.swift
//  PocketSync
//
//  Created by Bibek upreti on 26/07/2026.
//

import Foundation

enum ExpenseFactory {

    static func make(from form: ExpenseFormModel,
                     type: AddExpenseSegment) -> Expense {
        return Expense(
            id: UUID(),
            amount: form.amount,
            category: type == .income ? .income : form.category!,
            paymentMethod: form.paymentMethod!,
            note: form.note,
            createdAt: form.date,
            updatedAt: form.date,
            syncStatus: .pending
        )
    }

}
