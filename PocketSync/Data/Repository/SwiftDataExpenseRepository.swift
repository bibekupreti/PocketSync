//
//  SwiftDataExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 13/07/2026.
//

import SwiftData
import Foundation

final class SwiftDataExpenseRepository: ExpenseRepository {
    
    // MARK: - Properties
    private let modelContext: ModelContext
    
    // MARK: - Initialization
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - ExpenseRepository
    func addExpense(_ expense: Expense) async throws {
        let entity = ExpenseMapper.toEntity(from: expense)
        modelContext.insert(entity)
        try modelContext.saveChanges()
    }
    
    func updateExpense(_ expense: Expense) async throws {
        let entity = try modelContext.fetchExpenseEntity(with: expense.id)
        ExpenseMapper.updateEntity(entity, with: expense)
        try modelContext.saveChanges()
    }
    
    func fetchExpenses() async throws -> [Expense] {
        let descriptor = FetchDescriptor<ExpenseEntity>()
        let entities: [ExpenseEntity]
        do {
            entities = try modelContext.fetch(descriptor)
        } catch {
            throw RepositoryError.fetchFailed
        }
        return entities.map {
            ExpenseMapper.toDomain(from: $0)
        }
    }
    
    func deleteExpense(id: UUID) async throws {
        let entity = try modelContext.fetchExpenseEntity(with: id)
        modelContext.delete(entity)
        try modelContext.saveChanges()
    }
    
}
