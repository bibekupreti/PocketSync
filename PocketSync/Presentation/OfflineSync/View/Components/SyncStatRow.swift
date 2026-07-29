//
//  SyncStatRow.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

struct SyncStatRow: View {

    let title: String
    let value: String
    let icon: String
    let tint: Color

    var body: some View {

        HStack {

            Label {
                Text(title)
                    .bodyStyle()
            } icon: {
                Image(systemName: icon)
                    .foregroundStyle(tint)
            }

            Spacer()

            Text(value)
                .bodyStyle(fontWeight: .semibold)
        }
        .padding()
    }
}
