//
//  AppFont.swift
//  PocketSync
//
//  Created by Bibek upreti on 19/07/2026.
//

import SwiftUI

extension Text {
    
    func screenTitleStyle() -> some View {
        self
            .font(AppTypography.screenTitle)
            .foregroundStyle(.primary)
    }
    
    func sectionTitleStyle() -> some View {
        self
            .font(AppTypography.sectionTitle)
            .foregroundStyle(.primary)
    }
    
    func bodyStyle() -> some View {
        self
            .font(AppTypography.body)
            .foregroundStyle(.primary)
    }
    
    func captionStyle() -> some View {
        self
            .font(AppTypography.caption)
            .foregroundStyle(.secondary)
    }
    
    func buttonStyle() -> some View {
        self
            .font(AppTypography.body)
            .foregroundStyle(.white)
    }
    
}
