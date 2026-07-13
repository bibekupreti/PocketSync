//
//  ExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 13/07/2026.
//

import Foundation

protocol ExpenseRepository {
    func addExpense(_ expense: Expense) async throws
    func updateExpense(_ expense: Expense) async throws
    func fetchExpense() async throws -> [Expense]
    func deleteExpense(id: UUID) async throws
}
