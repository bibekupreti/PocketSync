//
//  EnumPicker.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct EnumPicker<T: RawRepresentable & Hashable>: View where T.RawValue == String {
    
    // MARK: - Properties
    @Binding var selection: T?
    let options: [T]
    var placeholder: String = "Select an option"
    
    // MARK: - Body
    var body: some View {
        Picker(placeholder, selection: $selection) {
            Text(placeholder)
                .tag(T?.none)
            ForEach(options, id: \.self) { option in
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
