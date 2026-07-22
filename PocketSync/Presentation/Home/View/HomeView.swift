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
    
    private let expenses = PreviewData.expenses
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Text("Recent Expenses")
                    .bodyStyle()
                    .fontWeight(.bold)
                Spacer()
                Button {
                    print("See All tapped")
                } label: {
                    Text("See All")
                        .bodyStyle()
                        .fontWeight(.bold)
                        .foregroundStyle(AppColor.accent)
                }
            }
            .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("This month")
                        .bodyStyle()
                    Text("$1243.50")
                        .sectionTitleStyle()
                        .fontWeight(.bold)
                    Text("Total Spent")
                        .captionStyle()
                        .fontWeight(.bold)
                }
                Spacer()
                SimpleAreaChartView(points: samplePoints)
                    .frame(width: 200, height: 100)
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .background(AppColor.card)
            .padding()
            
            List {
                ForEach(expenses) { item in
                    ExpenseRow()
                }
                .listRowInsets(.init())
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding(.horizontal, 16)
            
            HStack {
                IconContainer(systemImage: "takeoutbag.and.cup.and.straw")
                VStack(alignment: .leading) {
                    Text("All data is saved locally")
                    Text("Expenses will sync when you are online")
                }
            }
            .padding(16)
            .background(AppColor.card)
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
    }
    
}

#Preview {
    NavigationStack {
        HomeView(viewModel: MockViewModelFactory.makeHomeViewModel())
    }
}
