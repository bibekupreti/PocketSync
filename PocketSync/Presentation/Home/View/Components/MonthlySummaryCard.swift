//
//  TotalSpentCard.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct MonthlySummaryCard: View {
    
    // MARK: - Propertie
    var summary: MonthlySummary
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("This Month")
                        .captionStyle()
                    
                    Text(summary.balance.currencyString)
                        .bodyStyle()
                        .foregroundStyle(summary.isPositive ? AppColor.accent : .red)
                    
                    Text(summary.title)
                        .captionStyle()
                }
                SpendingCard()
            }
            

            Divider()

            HStack {
                StatView(title: "Income",
                         value: summary.income.currencyString)

                Spacer()

                StatView(title: "Expenses",
                         value: summary.expense.currencyString)
            }

            Text(summary.message)
                .captionStyle()
                .padding(.top, 8)
        }
        .padding()
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

struct StatView: View {

    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .captionStyle()

            Text(value)
                .bodyStyle(fontWeight: .semibold)
        }
    }
}
