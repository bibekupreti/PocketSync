//
//  ExpenseEntity.swift
//  PocketSync
//
//  Created by Bibek upreti on 12/07/2026.
//

import SwiftData
import Foundation

@Model
final class ExpenseEntity {
    @Attribute(.unique) var id: UUID
    var amount: Decimal
    var currency: String
    var category: String
    var paymentMethod: String
    var note: String
    var createdAt: Date
    var updatedAt: Date
    var syncState: SyncState
    var syncErrorMessage: String?
    
    init(id: UUID = UUID(),
         amount: Decimal,
         currency: String,
         category: String,
         paymentMethod: String,
         note: String,
         createdAt: Date = Date(),
         updatedAt: Date = Date(),
         syncState: SyncState,
         syncErrorMessage: String?) {
        self.id = id
        self.amount = amount
        self.currency = currency
        self.category = category
        self.paymentMethod = paymentMethod
        self.note = note
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.syncState = syncState
        self.syncErrorMessage = syncErrorMessage
    }
}
