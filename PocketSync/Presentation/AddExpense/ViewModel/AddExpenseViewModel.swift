//
//  AddExpenseViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

@MainActor
@Observable
final class AddExpenseViewModel {
    
    // MARK: - Properties
    private(set) var isLoading: Bool = false
    private(set) var error: RepositoryError?
    
    // MARK: - Dependencies
    private let repository: ExpenseRepository
    
    // MARK: - Init
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
    func saveExpense(_ expense: Expense) async throws(RepositoryError) {
        isLoading = true
        error = nil
        defer {
            isLoading = false
        }
        do {
            try await repository.addExpense(expense)
        } catch let error {
            self.error = error
        }
    }
    
}
