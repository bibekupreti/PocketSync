//
//  MockExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 22/07/2026.
//

import Foundation

final class MockExpenseRepository: ExpenseRepository {
    
    private var expenses: [Expense] = PreviewData.expenses
    
    func addExpense(_ expense: Expense) async throws(RepositoryError) {
        expenses.append(expense)
    }
    
    func updateExpense(_ expense: Expense) async throws(RepositoryError) {
        guard let index = expenses.firstIndex(where: { $0.id == expense.id }) else {
            throw RepositoryError.expenseNotFound
        }
        expenses[index] = expense
    }
    
    func fetchExpenses() async throws(RepositoryError) -> [Expense] {
        expenses
    }
    
    func deleteExpense(id: UUID) async throws(RepositoryError) {
        expenses.removeAll(where: { $0.id == id })
    }
    
}
