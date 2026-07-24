//
//  IconContainer.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import SwiftUI

struct IconContainer: View {
    
    // MARK: - Properties
    let systemImage: String
    var tintColor: Color = AppColor.accent
    var size: CGFloat = 44
    
    // MARK: - Body
    var body: some View {
        Image(systemName: systemImage)
            .font(.headline)
            .foregroundStyle(tintColor)
            .frame(width: size, height: size)
            .background(tintColor.opacity(0.1))
            .clipShape(Circle())
    }
    
}
