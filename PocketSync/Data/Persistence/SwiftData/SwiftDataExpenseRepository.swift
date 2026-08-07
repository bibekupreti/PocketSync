//
//  SwiftDataExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 13/07/2026.
//

import Foundation
import SwiftData

final class SwiftDataExpenseRepository: ExpenseRepository {
    
    // MARK: - Properties
    
    private let modelContext: ModelContext
    
    // MARK: - Initialization
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - CRUD
    
    func addExpense(_ expense: Expense) async throws(RepositoryError) {
        let entity = ExpenseMapper.toEntity(from: expense)
        
        modelContext.insert(entity)
        
        try modelContext.saveChanges()
    }
    
    func fetchExpenses() async throws(RepositoryError) -> [Expense] {
        let descriptor = FetchDescriptor<ExpenseEntity>(
            sortBy: [
                SortDescriptor(\.createdAt, order: .reverse)
            ]
        )
        
        do {
            let entities = try modelContext.fetch(descriptor)
            return entities.map(ExpenseMapper.toDomain)
        } catch {
            throw .fetchFailed
        }
    }
    
    func updateExpense(_ expense: Expense) async throws(RepositoryError) {
        let entity = try modelContext.fetchExpenseEntity(with: expense.id)
        
        ExpenseMapper.updateEntity(entity, with: expense)
        
        try modelContext.saveChanges()
    }
    
    func deleteExpense(id: UUID) async throws(RepositoryError) {
        let entity = try modelContext.fetchExpenseEntity(with: id)
        
        modelContext.delete(entity)
        
        try modelContext.saveChanges()
    }
    
    // MARK: - Sync
    
    func fetchPendingExpenses() async throws(RepositoryError) -> [Expense] {

        do {
            let descriptor = FetchDescriptor<ExpenseEntity>(
                sortBy: [
                    SortDescriptor(\.createdAt)
                ]
            )

            let entities = try modelContext.fetch(descriptor)

            return entities
                .filter {
                    $0.syncState == .pending ||
                    $0.syncState == .failed
                }
                .map(ExpenseMapper.toDomain)

        } catch {
            throw .fetchFailed
        }
    }
    
    func markAsSynced(id: UUID) async throws(RepositoryError) {
        try updateSyncState(
            id: id,
            state: .synced,
            errorMessage: nil
        )
    }
    
    func markAsFailed(
        id: UUID,
        errorMessage: String?
    ) async throws(RepositoryError) {
        try updateSyncState(
            id: id,
            state: .failed,
            errorMessage: errorMessage
        )
    }
    
    // MARK: - Private
    private func updateSyncState(
        id: UUID,
        state: SyncState,
        errorMessage: String?
    ) throws(RepositoryError) {
        
        let entity = try modelContext.fetchExpenseEntity(with: id)
        
        entity.syncState = state
        entity.syncErrorMessage = errorMessage
        
        try modelContext.saveChanges()
    }
    
}
