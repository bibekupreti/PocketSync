//
//  SyncStatusViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import Foundation

@MainActor
@Observable
final class SyncStatusViewModel {
    
    // MARK: - Properties
    private let repository: ExpenseRepository
    
    private(set) var pendingCount: Int = 0
    private(set) var failedCount: Int = 0
    private(set) var lastSync: Date?
    private(set) var isLoading: Bool = false
    private(set) var error: RepositoryError?
    
    // MARK: - Initialization
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
    func loadSyncStatus() async {
        isLoading = true
        error = nil
        defer { isLoading = false }
        
        do {
            let expenses = try await repository.fetchExpenses()
            pendingCount = expenses.filter { $0.syncStatus == .pending }.count
            failedCount = expenses.filter {
                if case .failed = $0.syncStatus { return true }
                return false
            }.count
            lastSync = expenses
                .filter { $0.syncStatus == .synced }
                .map(\.updatedAt)
                .max()
        } catch let error {
            self.error = error
        }
    }
    
    func sync() async {
        await loadSyncStatus()
    }
    
}
