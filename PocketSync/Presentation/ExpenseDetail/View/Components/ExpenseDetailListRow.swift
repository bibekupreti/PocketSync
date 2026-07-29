//
//  ExpenseDetailListRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

struct ExpenseDetailListRow: View {
    
    let expense: Expense
    
    var body: some View {
        VStack {
            ExpenseDetailRowItem(title: "Date", value: expense.createdAtDisplayString)
                .padding(.top, 16)
            ExpenseDetailRowItem(title: "Payment Method", value: expense.paymentMethod.rawValue)
            ExpenseDetailRowItem(title: "Status", value: expense.syncStatusString, foregroundStyle: expense.syncStatusTextColor)
        }
    }
    
}
#Preview {
    ExpenseDetailListRow(
        expense:
            Expense(
                id: UUID(),
                amount: 100.2,
                category: .food,
                paymentMethod: .card,
                note: "Had some food with friends on Trishara",
                createdAt: Date.now,
                updatedAt: Date.now,
                syncStatus: .pending
            )
    )
}
