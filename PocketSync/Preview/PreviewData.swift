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
            category: .food,
            paymentMethod: .card,
            note: "On the Namaste cafe",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .pending
        ),
        Expense(
            id: UUID(),
            amount: 10230,
            category: .shopping,
            paymentMethod: .cash,
            note: "Had to buy some socks",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .synced
        ),
        Expense(
            id: UUID(),
            amount: 1000,
            category: .transport,
            paymentMethod: .card,
            note: "Bus bill",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 1230,
            category: .entertainment,
            paymentMethod: .card,
            note: "Netflix sibscription",
            createdAt: .now,
            updatedAt: .now,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 800,
            category: .food,
            paymentMethod: .mobileWallet,
            note: "Pizza",
            createdAt: .now - 2,
            updatedAt: .now - 1,
            syncStatus: .failed("Network unavailable")
        ),
        Expense(
            id: UUID(),
            amount: 800,
            category: .other,
            paymentMethod: .bankTransfer,
            note: "Some vedio games.",
            createdAt: .now - 2,
            updatedAt: .now - 1,
            syncStatus: .failed("Network unavailable")
        )
    ]

}
