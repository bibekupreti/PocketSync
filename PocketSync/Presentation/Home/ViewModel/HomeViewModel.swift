//
//  HomeViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import Foundation

@MainActor
@Observable
final class HomeViewModel {
    
    // MARK: - Properties
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
    func loadExpenses() async throws {
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
    
    // MARK: - Private
    private func fetchExpenses() async throws(RepositoryError) {
        expenses = try await repository.fetchExpenses()
    }
    
}
