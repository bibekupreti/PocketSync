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
    @State private var category: ExpenseCategory?
    @State private var paymentMethod: PaymentMethod?
    @State private var amount: Double = 0
    @State private var date: Date = .now
    @State private var note: String = ""
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack {
                InlineRow(title: "Category") {
                    EnumPicker(selection: $category, placeholder: "Choose")
                    
                }
                Divider()
                    
                InlineRow(title: "Amount") {
                    TextField("AmountTextField", value: $amount, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .font(AppTypography.footNote)
                        .fontWeight(.semibold)
                        .foregroundColor(amount == 0 ? .secondary : .primary)
                }
                Divider()
                    
                
                InlineRow(title: "Date") {
                   DatePickerRow(date: $date)
                }
                Divider()
                    
                NoteRow(
                    title: "Note",
                    placeholder: "Add note.",
                    text: $note
                )
                Divider()
                    
                InlineRow(title: "Payment Method") {
                    EnumPicker(selection: $paymentMethod, placeholder: "Choose")
                }
            }
            
        }
        .padding()
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
    
}

// MARK: - Preview
#Preview {
    NavigationStack {
        ExpenseFormView()
            .navigationTitle("New Expense")
    }
}
