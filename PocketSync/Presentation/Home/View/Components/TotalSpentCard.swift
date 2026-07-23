//
//  TotalSpentCard.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct TotalSpentCard: View {
    
    // MARK: - Propertie
    var totalSpent: Decimal
    
    // MARK: - Body
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("This Month")
                    .bodyStyle()
                Text(verbatim: "$ \(totalSpent)")
                    .screenTitleStyle(fontWeight: .bold, lineLimit: 2)
                Text("Total Spent")
                    .captionStyle()
            }
            SpendingCard()
        }
        .padding()
        .background(AppColor.card, ignoresSafeAreaEdges: [])
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

#Preview {
    TotalSpentCard(totalSpent: 1243.50)
}
