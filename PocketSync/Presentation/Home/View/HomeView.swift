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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    HomeView(viewModel: HomeViewModel(repository: SwiftDataExpenseRepository(modelContext: ModelContext(ModelContainer(for: ExpenseEntity.self)))))
}
