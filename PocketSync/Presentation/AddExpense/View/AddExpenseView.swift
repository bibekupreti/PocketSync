//
//  AddExpenseView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

enum AddExpenseSegment: String, CaseIterable {
    case expense = "Expense"
    case income = "Income"
}

struct AddExpenseView: View {
    
    // MARK: - Properties
    @State private var selectedSegment: AddExpenseSegment = .expense
    @State private var selectedAmount: String = "0.00"
    
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
                Text(selectedAmount)
                    .screenTitleStyle()
            }
            .padding(32)
            ExpenseFormView()
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
                    //                    save()
                    //                    dismiss()
                }
                // Disable until the form is actually valid, e.g.:
                // .disabled(category == nil || amount == 0)
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        AddExpenseView()
    }
}
