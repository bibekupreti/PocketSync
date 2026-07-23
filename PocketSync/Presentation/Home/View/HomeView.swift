//
//  HomeView.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import SwiftUI
import SwiftData
import TipKit

struct HomeView: View {
    
    // MARK: - Properties
    @State
    private var viewModel: HomeViewModel
    @AppStorage("hasSeenLocalDataTip") private var hasSeenLocalDataTip = false
    private let expenses = PreviewData.expenses
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            NetworkStatusView(networkStatus: .online)
                .padding(.leading, 16)
            TotalSpentCard(totalSpent: 12345.0)
                .padding()
            
            HStack {
                Text("Recent Expenses")
                    .bodyStyle(fontWeight: .semibold)
                Spacer()
                Button {
                    print("See All tapped")
                } label: {
                    Text("See All")
                        .bodyStyle(fontWeight: .semibold)
                        .foregroundStyle(AppColor.accent)
                }
            }
            .padding(.horizontal, 16)
            
            List {
                ForEach(expenses) { item in
                    ExpenseRow()
                }
                .listRowInsets(.init())
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding()

            if !hasSeenLocalDataTip {
                HStack(alignment: .top) {
                    IconContainer(systemImage: "checkmark.icloud")
                    VStack(alignment: .leading) {
                        Text("All data is saved locally")
                            .bodyStyle()
                        Text("Expenses will sync when you are online")
                            .captionStyle()
                    }
                    Spacer()
                    Button {
                        hasSeenLocalDataTip = true
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(AppColor.accent)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(AppColor.card)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
            }
            
            
            Spacer()
        }
        .background(AppColor.background)
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // Filter action
                    print("Filter tapped")
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.title3)
                }
            }
        }
        .toolbarBackground(AppColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
}

#Preview {
    NavigationStack {
        HomeView(viewModel: MockViewModelFactory.makeHomeViewModel())
    }
}

