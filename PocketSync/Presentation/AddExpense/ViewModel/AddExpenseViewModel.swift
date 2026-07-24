//
//  AddExpenseViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

@MainActor
@Observable
final class AddExpenseViewModel {
    
    // MARK: - Properties
    private let repository: ExpenseRepository
    
    // MARK: - Init
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
    
}
