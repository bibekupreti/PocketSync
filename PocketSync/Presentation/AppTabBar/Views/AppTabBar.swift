//
//  AppTabBar.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import SwiftUI

struct AppTabBar: View {
    
    @State private var selection: String = "contacts"
        @State private var searchText: String = ""
    
    var body: some View {
        
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house.fill", value: "house") {
                HomeView()
            }
            Tab("Expense", systemImage: "creditcard", value: "expense") {
                ExpenseView()
            }
            Tab("Category", systemImage: "square.grid.2x2", value: "category") {
                CategoryView()
            }
            Tab("Add", systemImage: "plus.circle", value: "add", role: .search) {
                AddExpenseView()
            }
        }
        
    }
}

struct HomeView: View {
    var body: some View {
        Text("Welcome to home")
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

struct AddExpenseView: View {
    var body: some View {
        Text("Welcome to home")
    }
}

#Preview {
    AppTabBar()
}
