//
//  SyncStatusViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import Foundation
import Observation

@Observable
@MainActor
final class SyncStatusViewModel {
    
    // MARK: - State
    
    private(set) var isConnected = false
    private(set) var isSyncing = false
    
    private(set) var pendingCount = 0
    private(set) var failedCount = 0
    
    private(set) var lastSync: Date?
    
    // MARK: - Dependencies
    
    private let repository: ExpenseRepository
    private let networkMonitor: NetworkMonitoring
    
    // MARK: - Initialization
    
    init(
        repository: ExpenseRepository,
        networkMonitor: NetworkMonitoring
    ) {
        self.repository = repository
        self.networkMonitor = networkMonitor
    }
    
    // MARK: - Public
    
    func loadSyncStatus() async {
        
        isConnected = networkMonitor.isConnected
        
        do {
            
            let expenses = try await repository.fetchExpenses()
            
            pendingCount = expenses.filter {
                if case .pending = $0.syncStatus {
                    return true
                }
                return false
            }.count
            
            failedCount = expenses.filter {
                if case .failed = $0.syncStatus {
                    return true
                }
                return false
            }.count
            
        } catch {
            print(error)
        }
        
        observeNetwork()
    }
    
    // MARK: - Private
    private func observeNetwork() {
        Task {
            for await connected in networkMonitor.statusUpdates {
                await MainActor.run {
                    self.isConnected = connected
                }
            }
        }
    }
    
}
