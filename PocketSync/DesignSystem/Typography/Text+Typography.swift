//
//  AppFont.swift
//  PocketSync
//
//  Created by Bibek upreti on 19/07/2026.
//

import SwiftUI

extension Text {
    
    func screenTitleStyle(fontWeight: Font.Weight = .regular) -> some View {
        self
            .font(AppTypography.screenTitle)
            .foregroundStyle(.primary)
            .fontWeight(fontWeight)
    }
    
    func sectionTitleStyle(fontWeight: Font.Weight = .regular) -> some View {
        self
            .font(AppTypography.sectionTitle)
            .foregroundStyle(.primary)
            .fontWeight(fontWeight)
    }
    
    func bodyStyle(fontWeight: Font.Weight = .regular) -> some View {
        self
            .font(AppTypography.body)
            .foregroundStyle(.primary)
            .fontWeight(fontWeight)
    }
    
    func captionStyle(fontWeight: Font.Weight = .regular) -> some View {
        self
            .font(AppTypography.caption)
            .foregroundStyle(.secondary)
            .fontWeight(fontWeight)
    }
    
    func buttonStyle() -> some View {
        self
            .font(AppTypography.body)
            .foregroundStyle(.white)
    }
    
}
