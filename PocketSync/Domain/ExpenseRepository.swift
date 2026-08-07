//
//  ExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 13/07/2026.
//

import Foundation

protocol ExpenseRepository {
    func addExpense(_ expense: Expense) async throws(RepositoryError)
    func updateExpense(_ expense: Expense) async throws(RepositoryError)
    func fetchExpenses() async throws(RepositoryError) -> [Expense]
    func deleteExpense(id: UUID) async throws(RepositoryError)
    func fetchPendingExpenses() async throws(RepositoryError) -> [Expense]
    func markAsSynced(id: UUID) async throws(RepositoryError)
    func markAsFailed(id: UUID, errorMessage: String?) async throws(RepositoryError)
}
