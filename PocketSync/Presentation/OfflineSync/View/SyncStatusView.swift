//
//  OfflineSyncView.swift
//  PocketSync
//
//  Created by Bibek upreti on 28/07/2026.
//

import SwiftUI

struct SyncStatusView: View {
    
    // MARK: - Properties
    
    @State
    private var viewModel: SyncStatusViewModel
    
    // MARK: - Initialization
    
    init(viewModel: SyncStatusViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 28) {
                
                statusSection
                
                SyncSummaryCard(
                    pendingCount: viewModel.pendingCount,
                    failedCount: viewModel.failedCount,
                    lastSync: viewModel.lastSync
                )
                
                informationCard
            }
            .padding()
        }
        .background(AppColor.background)
        .navigationTitle("Sync")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadSyncStatus()
        }
    }
}

// MARK: - Components

private extension SyncStatusView {
    
    var statusSection: some View {
        
        VStack(spacing: 18) {
            
            ZStack {
                
                Circle()
                    .fill(statusColor.opacity(0.15))
                    .frame(width: 90, height: 90)
                
                Image(systemName: statusIcon)
                    .font(.system(size: 36))
                    .foregroundStyle(statusColor)
            }
            
            VStack(spacing: 8) {
                
                Text(statusTitle)
                    .screenTitleStyle()
                
                Text(statusDescription)
                    .captionStyle()
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    var informationCard: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Label("Automatic Sync", systemImage: "arrow.triangle.2.circlepath")
            
            Divider()
            
            Text("""
PocketSync automatically syncs your expenses whenever an internet connection becomes available.

You never need to manually start synchronization.
""")
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
    
    var statusColor: Color {
        
        if viewModel.isSyncing {
            return .orange
        }
        
        return viewModel.isConnected
        ? .green
        : .orange
    }
    
    var statusIcon: String {
        
        if viewModel.isSyncing {
            return "arrow.triangle.2.circlepath.circle.fill"
        }
        
        return viewModel.isConnected
        ? "checkmark.icloud.fill"
        : "icloud.slash.fill"
    }
    
    var statusTitle: String {
        
        if viewModel.isSyncing {
            return "Syncing..."
        }
        
        return viewModel.isConnected
        ? "You're Online"
        : "You're Offline"
    }
    
    var statusDescription: String {
        
        if viewModel.isSyncing {
            return "Uploading your pending expenses."
        }
        
        return viewModel.isConnected
        ? "Your expenses are automatically syncing in the background."
        : "Your expenses are safely stored on your device and will automatically sync once you're back online."
    }
}

#Preview {
    
    let repository = MockExpenseRepository()
    
    let monitor = NetworkMonitor()
    
    NavigationStack {
        
        SyncStatusView(
            viewModel: SyncStatusViewModel(
                repository: repository,
                networkMonitor: monitor
            )
        )
    }
}
