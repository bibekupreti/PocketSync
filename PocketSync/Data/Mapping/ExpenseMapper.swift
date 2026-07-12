//
//  ExpenseMapper.swift
//  PocketSync
//
//  Created by Bibek upreti on 12/07/2026.
//

import Foundation

enum ExpenseMapper {
    
    static func toEntity(from expense: Expense) -> ExpenseEntity {
        let syncState: SyncState
        let syncErrorMessage: String?
        
        switch expense.syncStatus {
        case .pending:
            syncState = .pending
            syncErrorMessage = nil
        case .syncing:
            syncState = .syncing
            syncErrorMessage = nil
        case .synced:
            syncState = .synced
            syncErrorMessage = nil
        case .failed(let message):
            syncState = .failed
            syncErrorMessage = message
        }
        
        return(
            ExpenseEntity(id: expense.id,
                          amount: expense.amount,
                          currency: expense.currency.rawValue,
                          category: expense.category.rawValue,
                          note: expense.note,
                          syncState: syncState,
                          syncErrorMessage: syncErrorMessage)
        )
    }
    
    static func toDomain(from entity: ExpenseEntity) -> Expense {
        
        guard let currency = Currency(rawValue: entity.currency) else {
            assertionFailure("Invalid currency: \(entity.currency)")
            fatalError("Currency mapping failed")
        }
        
        guard let category = ExpenseCategory(rawValue: entity.category) else {
            assertionFailure("Invalid category: \(entity.category)")
            fatalError("Category mapping failed")
        }
        
        let syncStatus: SyncStatus
        
        switch entity.syncState {
            
        case .pending:
            syncStatus = .pending
            
        case .syncing:
            syncStatus = .syncing
            
        case .synced:
            syncStatus = .synced
            
        case .failed:
            syncStatus = .failed(entity.syncErrorMessage ?? "Unknown error")
            
        }
        
        return (
            Expense(id: entity.id,
                    amount: entity.amount,
                    currency: currency,
                    category: category,
                    note: entity.note,
                    createAt: entity.createdAt,
                    updatedAt: entity.updatedAt,
                    syncStatus: syncStatus)
        )
    }
    
}
