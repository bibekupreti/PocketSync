//
//  ExpenseMapper.swift
//  PocketSync
//
//  Created by Bibek upreti on 12/07/2026.
//

import Foundation

enum ExpenseMapper {
    
    static func toEntity(from expense: Expense) -> ExpenseEntity {

        let syncPersistenceValue = SyncStatusMapper.toEntity(from : expense.syncStatus)
        
        return(
            ExpenseEntity(id: expense.id,
                          amount: expense.amount,
                          category: expense.category.rawValue,
                          paymentMethod: expense.paymentMethod.rawValue,
                          note: expense.note,
                          createdAt: expense.createdAt,
                          updatedAt: expense.updatedAt,
                          syncState: syncPersistenceValue.state,
                          syncErrorMessage: syncPersistenceValue.errorMessage)
        )
    }
    
    static func toDomain(from entity: ExpenseEntity) -> Expense {
        
        guard let category = ExpenseCategory(rawValue: entity.category) else {
            assertionFailure("Invalid category: \(entity.category)")
            fatalError("Category mapping failed")
        }
        
        let syncStatus: SyncStatus = SyncStatusMapper.toDomain(state: entity.syncState, errorMessage: entity.syncErrorMessage)
        
        return (
            Expense(id: entity.id,
                    amount: entity.amount,
                    category: category,
                    paymentMethod: PaymentMethod(rawValue: entity.paymentMethod) ?? PaymentMethod.cash,
                    note: entity.note,
                    createdAt: entity.createdAt,
                    updatedAt: entity.updatedAt,
                    syncStatus: syncStatus)
        )
    }
    
    static func updateEntity(_ entity: ExpenseEntity, with expense: Expense) {
        let syncPersistenceValue = SyncStatusMapper.toEntity(from: expense.syncStatus)
        
        entity.amount = expense.amount
        entity.category = expense.category.rawValue
        entity.note = expense.note
        entity.updatedAt = expense.updatedAt
        entity.syncState = syncPersistenceValue.state
        entity.syncErrorMessage = syncPersistenceValue.errorMessage
    }
    
}
