//
//  HomeView.swift
//  PocketSync
//
//  Created by Bibek upreti on 18/07/2026.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    // MARK: - Properties
    @State
    private var viewModel: HomeViewModel
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Home Content")
        }
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
    }
    
}

