//
//  DefaultSyncService.swift
//  PocketSync
//
//  Created by Bibek upreti on 07/08/2026.
//

import Foundation

final class DefaultSyncService: SyncService {
    
    // MARK: - Dependencies
    private let repository: ExpenseRepository
    private let remoteRepository: RemoteExpenseRepository
    private let networkMonitor: NetworkMonitoring
    
    // MARK: - Tasks
    private var monitoringTask: Task<Void, Never>?
    private var isSyncing = false
    
    // MARK: - Initialization
    init(
        repository: ExpenseRepository,
        remoteRepository: RemoteExpenseRepository,
        networkMonitor: NetworkMonitoring
    ) {
        self.repository = repository
        self.remoteRepository = remoteRepository
        self.networkMonitor = networkMonitor
    }
    
    // MARK: - Methods
    func start() {
        guard monitoringTask == nil else { return }
        monitoringTask = Task { [weak self] in
            guard let self else { return }
            for await connected in networkMonitor.statusUpdates {
                guard connected else { continue }
                await syncPendingExpenses()
            }
        }
    }
    
    func stop() {
        monitoringTask?.cancel()
        monitoringTask = nil
    }
    
    // MARK: - Private
    private func syncPendingExpenses() async {
        guard !isSyncing else {
            return
        }
        
        isSyncing = true
        
        defer {
            isSyncing = false
        }
        
        do {
            let expenses = try await repository.fetchPendingExpenses()
            
            for expense in expenses {
                do {
                    try await remoteRepository.upload(expense)
                    try await repository.markAsSynced(id: expense.id)
                } catch {
                    try? await repository.markAsFailed(
                        id: expense.id,
                        errorMessage: error.localizedDescription
                    )
                }
            }
        } catch {
            print("Sync failed:", error)
        }
    }
    
}
