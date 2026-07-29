//
//  Expense.swift
//  PocketSync
//
//  Created by Bibek upreti on 11/07/2026.
//

import Foundation
import SwiftUI

struct Expense: Identifiable, Equatable, Sendable, Hashable {
    let id: UUID
    let amount: Decimal
    let category: ExpenseCategory
    let paymentMethod: PaymentMethod
    let note: String
    let createdAt: Date
    let updatedAt: Date
    let syncStatus: SyncStatus
    
    var createdAtDisplayString: String {
        DateFormatter.expenseRelativeFormatter.string(from: createdAt)
    }
    
    var syncStatusString: String {
        switch syncStatus {
        case .pending:
            "Pending"
        case .syncing:
            "Syncing"
        case .synced:
            "Synced"
        case .failed(let error):
            "Failed with \(error)"
        }
    }
    
    var syncStatusTextColor: Color {
        switch syncStatus {
        case .pending:
                .yellow
        case .syncing:
                .orange
        case .synced:
            AppColor.accent
        case .failed(_):
                .red
        }
    }
    
}


