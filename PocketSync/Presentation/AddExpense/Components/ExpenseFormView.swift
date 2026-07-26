//
//  ExpenseFormView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import Foundation
import SwiftUI

struct ExpenseFormView: View {
    
    // MARK: - Properties
    @Binding var formModel: ExpenseFormModel
    let expenseType: AddExpenseSegment
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack {
                InlineRow(title: "Category") {
                    if expenseType == .expense {
                        EnumPicker(
                            selection: $formModel.category,
                            options: availableCategories,
                            placeholder: "Choose")
                    } else {
                        Text("Income")
                            .captionStyle(fontWeight: .bold)
                    }
                }
                Divider()
                
                InlineRow(title: "Amount") {
                    TextField(
                        "AmountTextField",
                        value: $formModel.amount,
                        format: .number.precision(.fractionLength(2))
                    )
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .font(AppTypography.footNote)
                    .fontWeight(.semibold)
                }
                Divider()
                
                
                InlineRow(title: "Date") {
                    DatePickerRow(date: $formModel.date)
                }
                Divider()
                
                NoteRow(
                    title: "Note",
                    placeholder: "Add note.",
                    text: $formModel.note
                )
                Divider()
                
                InlineRow(title: "Payment Method") {
                    EnumPicker(
                        selection: $formModel.paymentMethod,
                        options: availablePaymentMethod,
                        placeholder: "Choose"
                    )
                }
            }
            
        }
        .padding()
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
    
    private var availableCategories: [ExpenseCategory] {
        return ExpenseCategory.allCases.filter { $0 != .income }
    }
    
    private var availablePaymentMethod: [PaymentMethod] {
        return PaymentMethod.allCases
    }

}

// MARK: - Preview
#Preview {
    NavigationStack {
        ExpenseFormView(
            formModel: .constant(ExpenseFormModel()),
            expenseType: .expense
        )
        .navigationTitle("New Expense")
    }
}
