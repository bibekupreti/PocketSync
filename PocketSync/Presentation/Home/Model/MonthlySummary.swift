//
//  MonthlySummary.swift
//  PocketSync
//
//  Created by Bibek upreti on 28/07/2026.
//

import Foundation

struct MonthlySummary {
    let balance: Decimal
    let income: Decimal
    let expense: Decimal
    let transactionCount: Int
    let title: String
    let message: String
    let isPositive: Bool

    static let empty = MonthlySummary(
        balance: .zero,
        income: .zero,
        expense: .zero,
        transactionCount: 0,
        title: "No Transactions Yet",
        message: "Start tracking your expenses to see your monthly summary.",
        isPositive: true
    )
}
