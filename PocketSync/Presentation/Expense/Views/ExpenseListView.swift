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
    
    // MARK: - Initialization
    init(viewModel: ExpenseListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
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
        .padding(.horizontal, 16)
        .background(AppColor.background)
        .navigationTitle("Expense List")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search by category"
        )
        .task {
            await viewModel.loadExpenses()
        }
    }
    
}

#Preview {
    ExpenseListView(
        viewModel: MockViewModelFactory.makeExpenseListViewModel()
    )
}
