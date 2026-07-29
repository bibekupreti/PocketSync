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
    
    var addExpenseViewModel: AddExpenseViewModel
    @State private var isShowingAddExpense = false
    
    @Environment(ExpenseRouter.self) private var router
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel, addExpenseViewModel: AddExpenseViewModel) {
        _viewModel = State(initialValue: viewModel)
        self.addExpenseViewModel = addExpenseViewModel
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
                    isShowingAddExpense = true
                }
                .padding(.vertical, 8)
            } else {
                List {
                    ForEach(viewModel.expenses) { item in
                        ExpenseRow(expense: item)
                            .onTapGesture {
                                router.push(item)
                            }
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
        .sheet(isPresented: $isShowingAddExpense) {
            NavigationStack {
                AddExpenseView(
                    viewModel: addExpenseViewModel
                )
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isShowingAddExpense = true
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
        HomeView(viewModel: MockViewModelFactory.makeHomeViewModel(), addExpenseViewModel: MockViewModelFactory.makeAddExpenseViewModel())
    }
}

