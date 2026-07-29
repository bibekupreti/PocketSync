//
//  StatusHeader.swift
//  PocketSync
//
//  Created by Bibek upreti on 29/07/2026.
//

import SwiftUI

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
