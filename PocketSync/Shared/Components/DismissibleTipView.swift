//
//  DismissibleTipView.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct DismissibleTipView: View {
    
    // MARK: - Properties
    let systemName: String
    let title: String
    let message: String
    let onDissmiss: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center) {
            IconContainer(systemImage: systemName)
            Spacer()
            VStack(alignment: .leading) {
                Text(title)
                    .bodyStyle()
                Text(message)
                    .captionStyle()
            }
            Spacer()
            Button {
                onDissmiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(AppColor.accent)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

#Preview {
    DismissibleTipView(
        systemName: "checkmark.icloud",
        title: "All data is saved locally",
        message: "Expenses will sync when you are online",
        onDissmiss: {}
    )
}
