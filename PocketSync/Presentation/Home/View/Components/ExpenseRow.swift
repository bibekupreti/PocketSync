//
//  ExpenseRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 19/07/2026.
//

import SwiftUI

struct ExpenseRow: View {
    
    let expense: Expense
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 16) {
                
                IconContainer(systemImage: expense.category.systemImage, tintColor: expense.category.tint)
                VStack(alignment: .leading, spacing: 4) {
                    Text(expense.category.rawValue)
                        .bodyStyle(lineLimit: 1)
                    Text(expense.note)
                        .captionStyle(lineLimit: 2)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    Text(verbatim: "\(expense.currency.rawValue) \(expense.amount)")
                        .bodyStyle(lineLimit: 1)
                    Text(expense.createdAtDisplayString)
                        .captionStyle(lineLimit: 1)
                }
            }
            .padding(16)
            .background(AppColor.card)
         Divider()
                .padding(.horizontal, 16)
        }
    }
    
}

#Preview {
    ExpenseRow(expense:
                Expense(
                    id: UUID(),
                    amount: 4.05,
                    currency: .usd,
                    category: .food,
                    paymentMethod: .cash,
                    note: "No latest note",
                    createdAt: Date.distantFuture,
                    updatedAt: Date.now,
                    syncStatus: .pending
                )
    )
}
