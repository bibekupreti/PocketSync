//
//  PocketSyncApp.swift
//  PocketSync
//
//  Created by Bibek upreti on 09/07/2026.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct PocketSyncApp: App {
    
    // MARK: - Properties
    private let container: DependencyContainer
    
    // MARK: - Initialization
    init() {
        do {
            container = try DependencyContainer()
            container.networkMonitor.startMonitoring()
            container.syncService.start()
        } catch {
            fatalError("Failed to initialize dependency container \(error)")
        }
    }
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            AppTabBarView(
                homeViewModel: container.viewModelFactory.makeHomeViewModel(),
                addExpenseViewModel: container.viewModelFactory.makeAddExpenseViewModel(),
                expenseListViewModel: container.viewModelFactory.makeExpenseListViewModel(),
                expenseDetailViewModel: container.viewModelFactory.makeExpenseDetailViewModel(),
                syncStatusViewModel: container.viewModelFactory.makeSyncStatusViewModel()
            )
        }
    }
    
}
