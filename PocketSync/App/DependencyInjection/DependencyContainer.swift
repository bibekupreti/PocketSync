//
//  AppDependencyContainer.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import Foundation
import SwiftData

final class DependencyContainer {
    
    // MARK: - Persistence
    let modelContainer: ModelContainer
    let modelContext: ModelContext
    
    // MARK: - Properties
    lazy var expenseRepository: ExpenseRepository = {
        SwiftDataExpenseRepository(modelContext: modelContext)
    }()
    
    lazy var syncMetadataRepository: SyncMetadataRepository = {
        SwiftDataSyncMetadataRepository(
            modelContext: modelContext
        )
    }()
    
    lazy var viewModelFactory: ViewModelFactory = {
        DefaultViewModelFactory(container: self)
    }()
    
    lazy var networkMonitor: NetworkMonitoring = {
        NetworkMonitor()
    }()
    
    lazy var remoteExpenseRepository: RemoteExpenseRepository = {
        FakeRemoteExpenseRepository()
    }()
    
    lazy var syncService: SyncService = {
        DefaultSyncService(
            repository: expenseRepository,
            remoteRepository: remoteExpenseRepository,
            syncMetadataRepository: syncMetadataRepository,
            networkMonitor: networkMonitor
        )
    }()
    
    // MARK: - Initialization
    init() throws {
        modelContainer = try ModelContainer(
            for:
                ExpenseEntity.self,
                SyncMetadataEntity.self
        )
        modelContext = modelContainer.mainContext
    }
    
}
