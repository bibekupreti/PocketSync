//
//  ModelContext+Expense.swift
//  PocketSync
//
//  Created by Bibek upreti on 14/07/2026.
//

import Foundation
import SwiftData

extension ModelContext {
    
    func fetchExpenseEntity(with id: UUID) throws(RepositoryError) -> ExpenseEntity {
        let descriptor = FetchDescriptor<ExpenseEntity>(
            predicate: #Predicate {
                $0.id == id
            }
        )
        let entities: [ExpenseEntity]
        
        do {
            entities = try fetch(descriptor)
        } catch {
            throw RepositoryError.fetchFailed
        }
        
        guard let entity = entities.first else {
            throw RepositoryError.expenseNotFound
        }
        
        return entity
    }
    
    func saveChanges() throws(RepositoryError) {
        do {
            try save()
        } catch {
            throw RepositoryError.saveFailed
        }
    }
    
}
