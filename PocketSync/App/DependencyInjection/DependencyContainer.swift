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
    
    // MARK: - Repositories
    lazy var expenseRepository: ExpenseRepository = {
        SwiftDataExpenseRepository(modelContext: modelContext)
    }()
    
    // MARK: - Initialization
    init() throws {
        modelContainer = try ModelContainer(
            for: ExpenseEntity.self
        )
        modelContext = modelContainer.mainContext
    }
    
    // MARK: - Factories
    lazy var viewModelFactory: ViewModelFactory = {
        DefaultViewModelFactory(container: self)
    }()
    
}
