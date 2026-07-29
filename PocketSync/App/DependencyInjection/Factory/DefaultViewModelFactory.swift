//
//  DefaultViewModelFactory.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import Foundation

final class DefaultViewModelFactory: ViewModelFactory {
    
    // MARK: - Properties
    private let container: DependencyContainer
    
    // MARK: - Initialization
    init(container: DependencyContainer) {
        self.container = container
    }
    
    // MARK: - Protocol Methods
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(repository: container.expenseRepository)
    }
    
    func makeExpenseListViewModel() -> ExpenseListViewModel {
        ExpenseListViewModel(repository: container.expenseRepository)
    }
    
    func makeAddExpenseViewModel() -> AddExpenseViewModel {
        AddExpenseViewModel(repository: container.expenseRepository)
    }
    
    func makeExpenseDetailViewModel() -> ExpenseDetailViewModel {
        ExpenseDetailViewModel(repository: container.expenseRepository)
    }
    
    func makeSyncStatusViewModel() -> SyncStatusViewModel {
        SyncStatusViewModel(repository: container.expenseRepository)
    }
    
}
