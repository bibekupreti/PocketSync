//
//  ExpenseDetailView.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

struct ExpenseDetailView: View {
    
    // MARK: - Properties
    @State private var expense: Expense
    
    @State private var viewModel: ExpenseDetailViewModel
    @State private var isShowingDeleteConfirmation = false
    @State private var isShowingEditExpense = false
    @Environment(\.dismiss) private var dismiss
    
    let addExpenseViewModel: AddExpenseViewModel
    
    // MARK: - Initialization
    init(expense: Expense, viewModel: ExpenseDetailViewModel, addExpenseViewModel: AddExpenseViewModel) {
        _expense = State(initialValue: expense)
        _viewModel = State(initialValue: viewModel)
        self.addExpenseViewModel = addExpenseViewModel
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            VStack(spacing: 16) {
                Spacer()
                IconContainer(systemImage: expense.category.systemImage, size: 80)
                Text(expense.category.rawValue)
                    .titleStyle()
                Text(expense.amount.currencyString)
                    .titleStyle(fontWeight: .bold)
                Text(expense.note)
                    .captionStyle()
                
                ExpenseDetailListRow(expense: expense)
                    .background(AppColor.card)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)
                Spacer()
                Button {
                    isShowingDeleteConfirmation = true
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("Delete Expense")
                            .bodyStyle()
                            .foregroundStyle(.red)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(AppColor.card)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(16)
            }
        }
        .navigationTitle("Expense Detail")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingEditExpense) {
            NavigationStack {
                AddExpenseView(
                    viewModel: addExpenseViewModel,
                    expenseToEdit: expense,
                    onSave: { updated in
                        self.expense = updated
                    }
                )
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isShowingEditExpense = true
                } label: {
                    Text("Edit")
                        .bodyStyle()
                        .foregroundStyle(.accentGreen)
                }
            }
        }
        .alert("Delete Expense?", isPresented: $isShowingDeleteConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                Task {
                    await viewModel.deleteExpense(id: expense.id)
                    if viewModel.error == nil {
                        dismiss()
                    }
                }
            }
        } message: {
            Text("This action cannot be undone.")
        }
        .alert(
            "Something went wrong",
            isPresented: Binding(
                get: { viewModel.error != nil },
                set: { if !$0 { viewModel.clearError() } }
            )
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.error?.localizedDescription ?? "Please try again.")
        }
    }
    
}

#Preview {
    NavigationStack {
        ExpenseDetailView(
            expense:
                Expense(
                    id: UUID(),
                    amount: 100.2,
                    category: .food,
                    paymentMethod: .card,
                    note: "Had some food with friends on Trishara",
                    createdAt: Date.now,
                    updatedAt: Date.now,
                    syncStatus: .pending
                ),
            viewModel: MockViewModelFactory.makeExpenseDetailViewModel(),
            addExpenseViewModel: MockViewModelFactory.makeAddExpenseViewModel()
        )
    }
}
