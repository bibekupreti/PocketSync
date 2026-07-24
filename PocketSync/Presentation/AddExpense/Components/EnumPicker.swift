//
//  EnumPicker.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct EnumPicker<T: CaseIterable & RawRepresentable & Hashable>: View where T.RawValue == String, T.AllCases: RandomAccessCollection {
    
    // MARK: - Properties
    @Binding var selection: T?
    var placeholder: String = "Select an option"
    
    // MARK: - Body
    var body: some View {
        Picker(placeholder, selection: $selection) {
            Text(placeholder)
                .tag(T?.none)
            ForEach(T.allCases, id: \.self) { option in
                Text(option.rawValue)
                    .tag(T?.some(option))
            }
        }
        .pickerStyle(.menu)
        .labelsHidden()
        .tint(.primary)
        .font(selection == nil ? .caption : .caption.weight(.semibold))
        .foregroundStyle(selection == nil ? .secondary : .primary)
    }
    
}
