//
//  ExpenseDetailViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import Foundation

@MainActor
@Observable
final class ExpenseDetailViewModel {
    
    // MARK: - Properties
    private let repository: ExpenseRepository
    
    private(set) var isLoading: Bool = false
    private(set) var error: RepositoryError?
    
    // MARK: - Initialization
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
    func deleteExpense(id: UUID) async {
        isLoading = true
        error = nil
        defer {
            isLoading = false
        }
        do {
            try await repository.deleteExpense(id: id)
        } catch let error {
            self.error = error
        }
    }
    
    func clearError() {
        error = nil
    }
    
}
