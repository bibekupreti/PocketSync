//
//  ExpenseListView.swift
//  PocketSync
//
//  Created by Bibek upreti on 28/07/2026.
//

import SwiftUI

struct ExpenseListView: View {
    
    // MARK: - Properties
    @State private var viewModel: ExpenseListViewModel
    
    var addExpenseViewModel: AddExpenseViewModel
    @State private var isShowingAddExpense = false
    
    // MARK: - Initialization
    init(viewModel: ExpenseListViewModel, addExpenseViewModel: AddExpenseViewModel) {
        _viewModel = State(wrappedValue: viewModel)
        self.addExpenseViewModel = addExpenseViewModel
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            if viewModel.expenses.isEmpty {
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
                    ForEach(viewModel.sections) { section in
                        Section {
                            ForEach(section.expenses) { expense in
                                ExpenseRow(expense: expense)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                            }
                        } header: {
                            Text(section.title)
                                .titleStyle()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 16)
                                .background(AppColor.background)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)
                .listSectionSpacing(0)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(AppColor.card)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .contentMargins(.top, 0, for: .scrollContent)
            }
        }
        .padding(.horizontal, 16)
        .background(AppColor.background)
        .navigationTitle("Expense List")
        .navigationBarTitleDisplayMode(.inline)
        .searchableIfNotEmpty(
            viewModel.expenses.isEmpty,
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search by category"
        )
        .sheet(isPresented: $isShowingAddExpense) {
            NavigationStack {
                AddExpenseView(
                    viewModel: addExpenseViewModel
                )
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
        .task {
            await viewModel.loadExpenses()
        }
    }
    
}

extension View {
    @ViewBuilder
    func searchableIfNotEmpty(
        _ isEmpty: Bool,
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: String = ""
    ) -> some View {
        if isEmpty {
            self
        } else {
            self.searchable(
                text: text,
                placement: placement,
                prompt: prompt
            )
        }
    }
}

#Preview {
    ExpenseListView(
        viewModel: MockViewModelFactory.makeExpenseListViewModel(),
        addExpenseViewModel: MockViewModelFactory.makeAddExpenseViewModel()
    )
}
