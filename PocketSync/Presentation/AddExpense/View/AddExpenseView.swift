//
//  AddExpenseView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct AddExpenseView: View {
    
    // MARK: - Properties
    @State private var selectedSegment: AddExpenseSegment = .expense
    @State private var formModel = ExpenseFormModel()
    
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    @State private var viewModel: AddExpenseViewModel
    
    // MARK: - Initialization
    init(viewModel: AddExpenseViewModel) {
        _viewModel = State(initialValue: viewModel)
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
        .navigationTitle("Add Expense")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    //                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    Task {
                        await save()
                    }
                    //                    save()
                    //                    dismiss()
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
            let expense = ExpenseFactory.make(
                from: formModel,
                type: selectedSegment
            )
            try? await viewModel.saveExpense(expense)
            
        }
    }
    
}
// WORKING ON THE SYNC VIEW
#Preview {
    NavigationStack {
        AddExpenseView(viewModel: MockViewModelFactory.makeAddExpenseViewModel())
    }
}
