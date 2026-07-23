//
//  AppTabBar.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import SwiftUI
import SwiftData

struct AppTabBarView: View {
    
    let viewModel: HomeViewModel
    
    @State private var selection: String = "contacts"
    @State private var searchText: String = ""
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            Tab("Home", systemImage: "house.fill", value: "house") {
                NavigationStack {
                    HomeView(viewModel: viewModel)
                }
            }
            
            Tab("Expense", systemImage: "creditcard", value: "expense") {
                NavigationStack {
                    ExpenseView()
                }
            }
            
            Tab("Category", systemImage: "square.grid.2x2", value: "category") {
                NavigationStack {
                    CategoryView()
                }
            }
            
            Tab("Add", systemImage: "plus.circle", value: "add", role: .search) {
                NavigationStack {
                    AddExpenseView()
                }
            }
        }
        
    }
}

struct ExpenseView: View {
    var body: some View {
        Text("Welcome to home")
    }
}

struct CategoryView: View {
    var body: some View {
        Text("Welcome to home")
    }
}


