//
//  SyncSummaryCard.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

struct SyncSummaryCard: View {

    let pendingCount: Int
    let syncedCount: Int
    let failedCount: Int
    let lastSync: Date?

    var body: some View {

        VStack(spacing: 0) {
            
            SyncStatRow(
                title: "Synced Items",
                value: "\(syncedCount)",
                icon: "checkmark.circle",
                tint: .green
            )
            
            Divider()

            SyncStatRow(
                title: "Pending Items",
                value: "\(pendingCount)",
                icon: "icloud.and.arrow.up",
                tint: .orange
            )

            Divider()

            SyncStatRow(
                title: "Failed Items",
                value: "\(failedCount)",
                icon: "exclamationmark.triangle",
                tint: .red
            )

            Divider()

            HStack {

                Label {
                    Text(lastSyncText)
                        .captionStyle()
                } icon: {
                    Image(systemName: "clock")
                        .foregroundStyle(AppColor.accent)
                }

                Spacer()
            }
            .padding()
        }
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var lastSyncText: String {

        guard let lastSync else {
            return "Never synced"
        }

        return lastSync.formatted(
            date: .abbreviated,
            time: .shortened
        )
    }
}
