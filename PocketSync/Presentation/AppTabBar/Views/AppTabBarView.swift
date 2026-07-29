//
//  AppTabBar.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import SwiftUI
import SwiftData

struct AppTabBarView: View {
    
    let homeViewModel: HomeViewModel
    let addExpenseViewModel: AddExpenseViewModel
    let expenseListViewModel: ExpenseListViewModel
    let expenseDetailViewModel: ExpenseDetailViewModel
    let syncStatusViewModel: SyncStatusViewModel
    
    @State private var selection: String = "Home"
    @State private var searchText: String = ""
    
    @State private var expenseRouter = ExpenseRouter()
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            Tab("Home", systemImage: "house", value: "house") {
                NavigationStack(path: $expenseRouter.path) {
                    HomeView(viewModel: homeViewModel, addExpenseViewModel: addExpenseViewModel)
                        .navigationDestination(for: Expense.self) { expense in
                            ExpenseDetailView(expense: expense, viewModel: expenseDetailViewModel, addExpenseViewModel: addExpenseViewModel)
                        }
                }
                .environment(expenseRouter)
            }
            
            Tab("Expense", systemImage: "creditcard", value: "expense") {
                NavigationStack(path: $expenseRouter.path) {
                    ExpenseListView(viewModel: expenseListViewModel, addExpenseViewModel: addExpenseViewModel)
                        .navigationDestination(for: Expense.self) { expense in
                            ExpenseDetailView(expense: expense, viewModel: expenseDetailViewModel, addExpenseViewModel: addExpenseViewModel)
                        }
                }
                .environment(expenseRouter)
            }
            
            Tab("Sync Status", systemImage: "cloud", value: "status") {
                NavigationStack {
                    OfflineSyncView(viewModel: syncStatusViewModel)
                }
            }
            
        }
        .tint(AppColor.accent)
        
    }
}


