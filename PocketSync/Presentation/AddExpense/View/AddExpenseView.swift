//
//  AddExpenseView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct AddExpenseView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSegment: AddExpenseSegment
    @State private var formModel: ExpenseFormModel
    
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    @State private var viewModel: AddExpenseViewModel
    
    private let expenseToEdit: Expense?
    private let onSave: ((Expense) -> Void)?
    private var isEditing: Bool {
        expenseToEdit != nil
    }
    
    // MARK: - Initialization
    init(
        viewModel: AddExpenseViewModel,
        expenseToEdit: Expense? = nil,
        onSave: ((Expense) -> Void)? = nil
    ) {
        _viewModel = State(initialValue: viewModel)
        self.expenseToEdit = expenseToEdit
        self.onSave = onSave
        
        if let expenseToEdit {
            _formModel = State(initialValue: ExpenseFormModel(from: expenseToEdit))
            _selectedSegment = State(initialValue: expenseToEdit.category == .income ? .income : .expense)
        } else {
            _formModel = State(initialValue: ExpenseFormModel())
            _selectedSegment = State(initialValue: .expense)
        }
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            AppSegmentControl(
                segments: AddExpenseSegment.allCases,
                selection: $selectedSegment,
                label: { $0.rawValue }
            )
            .padding()
            .disabled(isEditing)
            .opacity(isEditing ? 0.5 : 1)
            
            HStack {
                Text("$")
                    .screenTitleStyle()
                Text(verbatim: "\(formModel.amount)")
                    .screenTitleStyle()
            }
            .padding(32)
            ExpenseFormView(
                formModel: $formModel,
                expenseType: selectedSegment
            )
            .padding()
        }
        .background(AppColor.background)
        .navigationTitle(expenseToEdit == nil ? "Add Expense" : "Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    Task {
                        await save()
                    }
                }
            }
        }
        .alert("Validation Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
    
    // MARK: - Private Helpers
    private func save() async {
        if selectedSegment == .income {
            formModel.category = .income
        }
        switch AddExpenseValidator.validate(formModel) {
            
        case .invalid(let message):
            alertMessage = message
            showAlert = true
            
        case .valid:
            do {
                if let expenseToEdit {
                    let updated = ExpenseFactory.make(
                        from: formModel,
                        type: selectedSegment,
                        id: expenseToEdit.id,
                        createdAt: expenseToEdit.createdAt
                    )
                    try await viewModel.updateExpense(updated)
                    onSave?(updated)
                } else {
                    let expense = ExpenseFactory.make(
                        from: formModel,
                        type: selectedSegment
                    )
                    try await viewModel.saveExpense(expense)
                    onSave?(expense)
                }
                dismiss()
            } catch {
                alertMessage = "Couldn't save expense. Please try again."
                showAlert = true
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        AddExpenseView(viewModel: MockViewModelFactory.makeAddExpenseViewModel())
    }
}
