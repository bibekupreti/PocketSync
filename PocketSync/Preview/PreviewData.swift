//
//  PreviewData.swift
//  PocketSync
//
//  Created by Bibek upreti on 22/07/2026.
//

import Foundation

enum PreviewData {

    static let expenses: [Expense] = [
        Expense(
            id: UUID(),
            amount: 100,
            currency: .npr,
            category: .food,
            note: "Food and drinks",
            createAt: .now,
            updatedAt: .now,
            syncStatus: .pending
        ),
        Expense(
            id: UUID(),
            amount: 10230,
            currency: .npr,
            category: .shopping,
            note: "Home Shopping",
            createAt: .now,
            updatedAt: .now,
            syncStatus: .synced
        ),
        Expense(
            id: UUID(),
            amount: 1000,
            currency: .npr,
            category: .travel,
            note: "Utility Bill",
            createAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 1230,
            currency: .npr,
            category: .entertainment,
            note: "Utility Bill",
            createAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 800,
            currency: .npr,
            category: .food,
            note: "Utility Bill",
            createAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        )
    ]

}
