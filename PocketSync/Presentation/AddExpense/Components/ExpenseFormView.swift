//
//  ExpenseFormView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import Foundation
import SwiftUI

// MARK: - Expense Entry Form
//
// Recreates the list in the screenshot:
//   Category         >          (label on top, gray subtitle below, chevron)
//   Amount      0.00             (label left, value right, single line)
//   Date        20 May 2025      (label left, value right, single line)
//   Note                        (label on top, gray placeholder below)
//   Payment Method   >          (label on top, gray subtitle below, chevron)
//
// Two reusable row styles cover every row here:
//   1. `StackedRow`  — bold label, gray value underneath, optional chevron.
//   2. `InlineRow`   — bold label left, value right, same line.

struct ExpenseFormView: View {
    @State private var category: String? = nil
    @State private var amount: Double = 0
    @State private var date: Date = .now
    @State private var note: String = ""
    @State private var paymentMethod: String = "Cash"

    var body: some View {
        List {
            NavigationLink {
                CategoryPickerView(selection: $category)
            } label: {
                StackedRow(
                    title: "Category",
                    value: category ?? "Select Category",
                    isPlaceholder: category == nil
                )
            }

            InlineRow(title: "Amount") {
                TextField("0.00", value: $amount, format: .number.precision(.fractionLength(2)))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(amount == 0 ? .secondary : .primary)
            }

            InlineRow(title: "Date") {
                // DatePicker collapses to just its formatted text when
                // labelsHidden + compact style is used inline like this.
                DatePicker("", selection: $date, displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(.compact)
            }

            StackedRow(
                title: "Note",
                value: note.isEmpty ? "" : note,
                placeholder: "Add note (optional)",
                isPlaceholder: note.isEmpty,
                isEditable: true,
                text: $note
            )

            NavigationLink {
                PaymentMethodPickerView(selection: $paymentMethod)
            } label: {
                StackedRow(
                    title: "Payment Method",
                    value: paymentMethod,
                    isPlaceholder: false
                )
            }
        }
        .listStyle(.plain)
    }
}

// MARK: - Row: bold title, gray value/subtitle underneath

private struct StackedRow: View {
    let title: String
    var value: String
    var placeholder: String? = nil
    var isPlaceholder: Bool = false
    var isEditable: Bool = false
    var text: Binding<String>? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.body.weight(.semibold))
                .foregroundColor(.primary)

            if isEditable, let text {
                TextField(placeholder ?? "", text: text)
                    .foregroundColor(.primary)
            } else {
                Text(value.isEmpty ? (placeholder ?? "") : value)
                    .foregroundColor(isPlaceholder ? .secondary : .primary)
            }
        }
        .padding(.vertical, 6)
    }
}

// MARK: - Row: bold title left, arbitrary trailing content right

private struct InlineRow<TrailingContent: View>: View {
    let title: String
    @ViewBuilder var trailing: () -> TrailingContent

    var body: some View {
        HStack {
            Text(title)
                .font(.body.weight(.semibold))
                .foregroundColor(.primary)
            Spacer()
            trailing()
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 6)
    }
}

// MARK: - Destination stubs (replace with your real pickers)

private struct CategoryPickerView: View {
    @Binding var selection: String?
    let categories = ["Food", "Transport", "Shopping", "Bills", "Entertainment"]

    var body: some View {
        List(categories, id: \.self) { category in
            Button {
                selection = category
            } label: {
                HStack {
                    Text(category).foregroundColor(.primary)
                    Spacer()
                    if selection == category {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .navigationTitle("Category")
    }
}

private struct PaymentMethodPickerView: View {
    @Binding var selection: String
    let methods = ["Cash", "Card", "Bank Transfer", "Mobile Wallet"]

    var body: some View {
        List(methods, id: \.self) { method in
            Button {
                selection = method
            } label: {
                HStack {
                    Text(method).foregroundColor(.primary)
                    Spacer()
                    if selection == method {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .navigationTitle("Payment Method")
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ExpenseFormView()
            .navigationTitle("New Expense")
    }
}
