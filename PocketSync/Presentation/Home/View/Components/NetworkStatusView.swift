//
//  NetworkStatusView.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

enum NetworkStatus: String {
    case online = "Online"
    case offline = "Offline"
}

struct NetworkStatusView: View {
    
    var networkStatus: NetworkStatus
    
    var body: some View {
        HStack {
            Circle()
                .foregroundStyle(AppColor.accent)
            Text(networkStatus.rawValue)
                .captionStyle(fontWeight: .heavy)
            Image(systemName: "cloud")
                .foregroundStyle(AppColor.accent)
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
