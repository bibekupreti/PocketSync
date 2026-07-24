//
//  TotalSpentCard.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct TotalSpentCard: View {
    
    // MARK: - Propertie
    var totalSpent: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("This Month")
                    .bodyStyle()
                Text(totalSpent)
                    .screenTitleStyle(fontWeight: .bold, lineLimit: 2)
                Text("Total Spent")
                    .captionStyle()
            }
            SpendingCard()
        }
        .padding()
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.vertical, 16)
    }
    
}

#Preview {
    TotalSpentCard(totalSpent: "$ 1243.50")
}
