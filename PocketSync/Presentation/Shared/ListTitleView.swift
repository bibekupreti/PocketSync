//
//  ListTitleView.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct ListTitleView: View {
    
    // MARK: - Properties
    let title: String
    let buttonTitle: String
    let buttonTint: Color
    let hasButton: Bool
    var onTap: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .captionStyle(fontWeight: .semibold)
            Spacer()
            Button {
                onTap()
            } label: {
                Text(buttonTitle)
                    .captionStyle(fontWeight: .semibold)
                    .foregroundStyle(buttonTint)
            }
        }
    }
    
}
