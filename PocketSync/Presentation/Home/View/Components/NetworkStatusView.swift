//
//  NetworkStatusView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct NetworkStatusView: View {
        
    // MARK: - Properties
    let networkStatus: NetworkStatus
    
    // MARK: - Body
    var body: some View {
        HStack {
            Circle()
                .foregroundStyle(networkStatus == .online ? AppColor.accent : AppColor.warning)
            Text(networkStatus.rawValue)
                .bodyStyle()
            Image(systemName: networkStatus == .online ? "cloud" : "network.slash")
                .foregroundStyle(networkStatus == .online ? AppColor.accent : AppColor.warning)
        }
        .frame(height: 16)
        .padding(8)
        .background(AppColor.card)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

#Preview {
    NetworkStatusView(networkStatus: .online)
}
