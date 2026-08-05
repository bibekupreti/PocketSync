//
//  OfflineSyncView.swift
//  PocketSync
//
//  Created by Bibek upreti on 28/07/2026.
//

import SwiftUI

struct OfflineSyncView: View {
    
    // MARK: - Properties
    @State private var viewModel: SyncStatusViewModel
    
    // MARK: - Initialization
    init(viewModel: SyncStatusViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            StatusHeader()
            
            SyncSummaryCard(
                pendingCount: viewModel.pendingCount,
                failedCount: viewModel.failedCount,
                lastSync: viewModel.lastSync
            )
            
            Button {
                Task {
                    await viewModel.sync()
                }
            } label: {
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
        .task {
            await viewModel.loadSyncStatus()
        }
    }
    // Clean
    
}
