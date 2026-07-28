//
//  HomeView.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import SwiftUI
import SwiftData
import TipKit

struct HomeView: View {
    
    // MARK: - Properties
    @State
    private var viewModel: HomeViewModel
    @AppStorage("hasSeenHomeToolTip") private var hasSeenHomeToolTip = false
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            NetworkStatusView(networkStatus: .online)
            
            MonthlySummaryCard(summary: viewModel.monthlySummary)
            
            ListTitleView(
                title: "Recent Expenses",
                buttonTitle: "See All",
                buttonTint: AppColor.accent,
                hasButton: true
            ) {
                print("Button Tapped")
            }
            .padding(.top, 8)
            
            if viewModel.isEmpty {
                ListEmptyState(
                    systemImage: "tray",
                    title: "No Expenses Yet",
                    description: "Expenses you add will show up here.",
                    buttonTitle: "Add Expense",
                ) {
                    print("Nothing")
                }
                .padding(.vertical, 8)
            } else {
                List {
                    ForEach(viewModel.expenses) { item in
                        ExpenseRow(expense: item)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(AppColor.card)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .padding(.vertical, 8)
            }
            
            if !hasSeenHomeToolTip {
                DismissibleTipView(
                    systemName: "checkmark.icloud",
                    title: "All data is saved locally",
                    message: "Expenses will sync when you are online") {
                        hasSeenHomeToolTip = true
                    }
            }
            
            Spacer()
        }
        .task {
            await viewModel.loadExpenses()
        }
        .padding(.horizontal, 16)
        .background(AppColor.background)
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Filter action
                    print("Filter tapped")
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(AppColor.accent)
                }
            }
        }
        .toolbarBackground(AppColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
}

#Preview {
    NavigationStack {
        HomeView(viewModel: MockViewModelFactory.makeHomeViewModel())
    }
}

