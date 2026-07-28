//
//  OfflineSyncView.swift
//  PocketSync
//
//  Created by Bibek upreti on 28/07/2026.
//

import SwiftUI

struct OfflineSyncView: View {

    let pendingCount: Int
    let failedCount: Int
    let lastSync: Date?
    let syncAction: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            StatusHeader()

            SyncSummaryCard(
                pendingCount: pendingCount,
                failedCount: failedCount,
                lastSync: lastSync
            )

            Button(action: syncAction) {
                Text("Sync Now")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
            .padding()
            .foregroundStyle(.white)
            .background(AppColor.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            Spacer()
        }
        .padding()
        .background(AppColor.background)
    }
    
}

struct StatusHeader: View {

    var body: some View {
        VStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(AppColor.accent.opacity(0.15))
                    .frame(width: 90, height: 90)

                Image(systemName: "icloud.slash")
                    .font(.system(size: 36))
                    .foregroundStyle(AppColor.accent)
            }

            VStack(spacing: 8) {

                Text("You're Offline")
                    .screenTitleStyle()

                Text("Your expenses are saved locally\nand will sync when you're online.")
                    .captionStyle()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct SyncSummaryCard: View {

    let pendingCount: Int
    let failedCount: Int
    let lastSync: Date?

    var body: some View {

        VStack(spacing: 0) {

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
