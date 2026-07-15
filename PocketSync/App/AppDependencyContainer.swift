//
//  AppDependencyContainer.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import Foundation
import SwiftData

final class AppDependencyContainer {
    
    let modelContext: ModelContext
    
    lazy var expenseRepository: ExpenseRepository = {
        SwiftDataExpenseRepository(modelContext: modelContext)
    }()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func makeExpenseViewModel() -> ExpenseViewModel {
        return ExpenseViewModel(repository: expenseRepository)
    }
    
}
