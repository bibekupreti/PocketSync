//
//  ExpenseViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import Foundation
import Observation

@Observable
@MainActor
final class ExpenseListViewModel {
    
    // MARK: - State
    private(set) var expenses: [Expense] = []
    private(set) var isLoading: Bool = false
    private(set) var error: RepositoryError?
    
    var searchText = ""
    
    // MARK: - Dependencies
    private let repository: ExpenseRepository
    
    // MARK: - Initialization
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
    func addExpense(_ expense: Expense) async {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            try await repository.addExpense(expense)
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    func loadExpenses() async {
        isLoading = true
        error = nil
        defer {
            isLoading = false
        }
        do {
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    func updateExpense(_ expense: Expense) async {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            try await repository.updateExpense(expense)
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    func deleteExpense(id: UUID) async {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            try await repository.deleteExpense(id: id)
            try await fetchExpenses()
        } catch {
            self.error = error
        }
    }
    
    // MARK: - Private
    private func fetchExpenses() async throws(RepositoryError) {
        expenses = try await repository.fetchExpenses()
    }
    
    private var filteredExpenses: [Expense] {
        guard !searchText.isEmpty else {
            return expenses
        }

        return expenses.filter {
            $0.category.rawValue.localizedStandardContains(searchText)
        }
    }
    
    var sections: [ExpenseSection] {
        let calendar = Calendar.current

        let groupedExpenses = Dictionary(
            grouping: filteredExpenses,
            by: { expense in
                calendar.startOfDay(for: expense.createdAt)
            }
        )

        let sections = groupedExpenses.map { date, expenses in
            ExpenseSection(
                date: date,
                expenses: expenses.sorted { $0.createdAt > $1.createdAt }
            )
        }

        return sections.sorted { $0.date > $1.date }
    }
    
}

struct ExpenseSection: Identifiable {
    let date: Date
    let expenses: [Expense]

    var id: Date { date }

    var title: String {
        let calendar = Calendar.current

        if calendar.isDateInToday(date) {
            return "Today"
        }

        if calendar.isDateInYesterday(date) {
            return "Yesterday"
        }

        return date.formatted(
            .dateTime.day().month().year()
        )
    }
}
