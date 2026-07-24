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
            note: "On the Namaste cafe",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .pending
        ),
        Expense(
            id: UUID(),
            amount: 10230,
            currency: .usd,
            category: .shopping,
            note: "Had to buy some socks",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .synced
        ),
        Expense(
            id: UUID(),
            amount: 1000,
            currency: .npr,
            category: .transport,
            note: "Bus bill",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 1230,
            currency: .usd,
            category: .entertainment,
            note: "Netflix sibscription",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 800,
            currency: .usd,
            category: .food,
            note: "Pizza",
            createdAt: .now - 2,
            updatedAt: .now - 1,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 800,
            currency: .usd,
            category: .other,
            note: "Some vedio games.",
            createdAt: .now - 2,
            updatedAt: .now - 1,
            syncStatus: .failed("Network unavailable")
        )
    ]

}
