//
//  ExpenseDetailRowItem.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

struct ExpenseDetailRowItem: View {
    
    let title: String
    let value: String
    var foregroundStyle: Color = .primary
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .bodyStyle(fontWeight: .bold)
                Spacer()
                Text(value)
                    .bodyStyle()
                    .foregroundStyle(foregroundStyle)
            }
            Divider()
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
    }
    
}

#Preview {
    ExpenseDetailRowItem(title: "Date", value: "1 April, 2026")
}
