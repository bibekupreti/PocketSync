//
//  Expense.swift
//  PocketSync
//
//  Created by Bibek upreti on 11/07/2026.
//

import Foundation

struct Expense: Identifiable, Equatable, Sendable {
    let id: UUID
    let amount: Decimal
    let currency: Currency
    let category: ExpenseCategory
    let note: String
    let createAt: Date
    let updatedAt: Date
    let syncStatus: SyncStatus
}
