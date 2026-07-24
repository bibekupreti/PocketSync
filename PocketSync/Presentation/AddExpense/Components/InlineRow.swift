//
//  InlineRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct InlineRow<TrailingContent: View>: View {
    
    // MARK: - Properties
    let title: String
    @ViewBuilder var trailing: () -> TrailingContent
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .bodyStyle(fontWeight: .semibold)
            Spacer()
            trailing()
        }
        .padding()
    }
    
}
