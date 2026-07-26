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
    
    @State private var selection: String = "Home"
    @State private var searchText: String = ""
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            Tab("Home", systemImage: "house", value: "house") {
                NavigationStack {
                    HomeView(viewModel: homeViewModel)
                }
            }
            
            Tab("Expense", systemImage: "creditcard", value: "expense") {
                NavigationStack {
                    AddExpenseView(viewModel: addExpenseViewModel)
                }
            }
            
            Tab("Sync Status", systemImage: "cloud", value: "status") {
                NavigationStack {
                    SyncStatusView()
                }
            }
            
        }
        .tint(AppColor.accent)
        
    }
}

struct ExpenseView: View {
    var body: some View {
        Text("Welcome to home")
    }
}

struct SyncStatusView: View {
    var body: some View {
        Text("Welcome to home")
    }
}


