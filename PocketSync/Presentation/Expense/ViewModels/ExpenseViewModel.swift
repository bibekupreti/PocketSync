//
//  ExpenseViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import Foundation
import Observation

@Observable
@MainActor
final class ExpenseViewModel {
    
    // MARK: - State
    private(set) var expenses: [Expense] = []
    private(set) var isLoading: Bool = false
    private(set) var error: RepositoryError?
    
    // MARK: - Dependencies
    private let repository: ExpenseRepository
    
    // MARK: - Initialization
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
    func addExpense(_ expense: Expense) async {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            try await repository.addExpense(expense)
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    func loadExpenses() async {
        isLoading = true
        error = nil
        defer {
            isLoading = false
        }
        do {
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    func updateExpense(_ expense: Expense) async {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            try await repository.updateExpense(expense)
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    func deleteExpense(id: UUID) async {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            try await repository.deleteExpense(id: id)
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    // MARK: - Private
    private func fetchExpenses() async throws(RepositoryError) {
        expenses = try await repository.fetchExpenses()
    }
    
}
