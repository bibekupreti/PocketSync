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

extension ExpenseFactory {
    static func make(
        from formModel: ExpenseFormModel,
        type: AddExpenseSegment,
        id: UUID,
        createdAt: Date
    ) -> Expense {
        Expense(
            id: id,
            amount: formModel.amount,
            category: formModel.category ?? .other,
            paymentMethod: formModel.paymentMethod ?? .cash,
            note: formModel.note,
            createdAt: createdAt,
            updatedAt: .now,
            syncStatus: .pending
        )
    }
}
