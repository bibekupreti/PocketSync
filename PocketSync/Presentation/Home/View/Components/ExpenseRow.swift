//
//  ExpenseRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 19/07/2026.
//

import SwiftUI

struct ExpenseRow: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            IconContainer(systemImage: "takeoutbag.and.cup.and.straw")
            VStack(alignment: .leading) {
                Text("Coffee")
                    .sectionTitleStyle()
                    .fontWeight(.bold)
                Text("Food and drinks")
                    .bodyStyle()
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("$4.50")
                    .sectionTitleStyle()
                    .fontWeight(.bold)
                Text("Today")
                    .bodyStyle()
            }
        }
        .padding(16)
        .background(AppColor.card)
    }
    
}

struct IconContainer: View {

    let systemImage: String
    var size: CGFloat = 44

    var body: some View {
        Image(systemName: systemImage)
            .font(.headline)
            .foregroundStyle(AppColor.accent)
            .frame(width: size, height: size)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(Circle())
    }
    
}

#Preview {
    ExpenseRow()
}
