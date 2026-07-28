//
//  HomeViewModel.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import Foundation

@MainActor
@Observable
final class HomeViewModel {
    
    // MARK: - Properties
    private(set) var expenses: [Expense] = []
    private(set) var isLoading: Bool = false
    private(set) var error: RepositoryError?
    
    private(set) var monthlySummary: MonthlySummary = .empty
    
    var isEmpty: Bool {
        expenses.isEmpty ? true : false
    }
    
    // MARK: - Dependencies
    private let repository: ExpenseRepository
    
    // MARK: - Initialization
    init(repository: ExpenseRepository) {
        self.repository = repository
    }
    
    // MARK: - Methods
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
    
    // MARK: - Private
    private func fetchExpenses() async throws(RepositoryError) {
        expenses = try await repository.fetchExpenses()
        calculateMonthlySummary()
    }
    
    private func calculateMonthlySummary() {
        let monthlyTransactions = currentMonthExpenses()

        guard !monthlyTransactions.isEmpty else {
            monthlySummary = .empty
            return
        }

        let income = monthlyIncome(from: monthlyTransactions)
        let expense = monthlyExpenses(from: monthlyTransactions)
        let balance = income - expense

        monthlySummary = MonthlySummary(
            balance: abs(balance),
            income: income,
            expense: expense,
            transactionCount: monthlyTransactions.count,
            title: balance >= 0 ? "Net Savings" : "Net Spending",
            message: makeInsight(
                income: income,
                expense: expense,
                balance: balance
            ),
            isPositive: balance >= 0
        )
    }
    
    private func makeInsight(
        income: Decimal,
        expense: Decimal,
        balance: Decimal
    ) -> String {

        if income == 0 {
            return "Add an income source to track your monthly balance."
        }

        if balance >= income * 0.5 {
            return "Excellent! You're saving over half of your income."
        }

        if balance > 0 {
            return "Great job! You're spending within your income."
        }

        return "You've spent more than you earned this month."
    }
    
    private func currentMonthExpenses() -> [Expense] {
        let calendar = Calendar.current
        let now = Date()

        return expenses.filter {
            calendar.isDate($0.createdAt, equalTo: now, toGranularity: .month)
        }
    }
    
    private func monthlyIncome(from expenses: [Expense]) -> Decimal {
        expenses
            .filter { $0.category == .income }
            .reduce(.zero) { $0 + $1.amount }
    }
    
    private func monthlyExpenses(from expenses: [Expense]) -> Decimal {
        expenses
            .filter { $0.category != .income }
            .reduce(.zero) { $0 + $1.amount }
    }
    
}
