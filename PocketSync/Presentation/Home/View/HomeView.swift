//
//  HomeView.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    // MARK: - Properties
    @State
    private var viewModel: HomeViewModel
    
    @State private var staticExpenses: [Expense] = [
        Expense(id: UUID(),
                amount: 100,
                currency: .npr,
                category: .food,
                note: "Food and drinks",
                createAt: Date.now,
                updatedAt: Date.now,
                syncStatus: .pending),
        Expense(id: UUID(),
                amount: 10230,
                currency: .npr,
                category: .food,
                note: "Home Shopping",
                createAt: Date.now,
                updatedAt: Date.now,
                syncStatus: .pending),
        Expense(id: UUID(),
                amount: 1000,
                currency: .npr,
                category: .food,
                note: "utility",
                createAt: Date.now,
                updatedAt: Date.now,
                syncStatus: .pending),
        Expense(id: UUID(),
                amount: 1002,
                currency: .npr,
                category: .food,
                note: "Bills",
                createAt: Date.now,
                updatedAt: Date.now,
                syncStatus: .pending),
        Expense(id: UUID(),
                amount: 500,
                currency: .npr,
                category: .food,
                note: "Credit",
                createAt: Date.now,
                updatedAt: Date.now,
                syncStatus: .pending)
    ]
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            List {
                ForEach(staticExpenses) { item in
                    ExpenseRow()
                }
            }
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Filter action
                    print("Filter tapped")
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title3)
                }
            }
        }
    }
    
}

