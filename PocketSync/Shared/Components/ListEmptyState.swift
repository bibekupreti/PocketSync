//
//  ListEmptyState.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct ListEmptyState: View {
    
    // MARK: - Properties
    let systemImage: String
    let title: String
    let description: String
    var buttonTitle: String? = nil
    var action: (() -> Void)? = nil
    
    // MARK: - Body
    var body: some View {
        VStack() {
            Image(systemName: systemImage)
                .font(.system(size: 36))
                .foregroundStyle(AppColor.accent)
                .padding(.vertical, 8)
            
            Text(title)
                .bodyStyle()
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            Text(description)
                .captionStyle()
                .multilineTextAlignment(.center)
            
            if let buttonTitle, let action {
                Button(action: action) {
                    Text(buttonTitle)
                        .bodyStyle(fontWeight: .semibold)
                }
                .buttonStyle(.borderedProminent)
                .tint(AppColor.accent)
                .frame(height: 44)
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(32)
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
    
}

#Preview {
    ListEmptyState(
        systemImage: "tray",
        title: "No Expenses Yet",
        description: "Expenses you add will show up here.",
        buttonTitle: "Add Expense",
        action: { /* navigate */ }
    )
}
