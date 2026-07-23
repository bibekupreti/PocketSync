//
//  AppFont.swift
//  PocketSync
//
//  Created by Bibek upreti on 19/07/2026.
//

import SwiftUI

extension Text {
    
    func screenTitleStyle(fontWeight: Font.Weight = .regular, lineLimit: Int = .max) -> some View {
        self
            .font(AppTypography.screenTitle)
            .foregroundStyle(.primary)
            .fontWeight(fontWeight)
            .lineLimit(lineLimit)
    }
    
    func sectionTitleStyle(fontWeight: Font.Weight = .regular, lineLimit: Int = .max) -> some View {
        self
            .font(AppTypography.sectionTitle)
            .foregroundStyle(.primary)
            .fontWeight(fontWeight)
            .lineLimit(lineLimit)
    }
    
    func bodyStyle(fontWeight: Font.Weight = .regular, lineLimit: Int = .max) -> some View {
        self
            .font(AppTypography.body)
            .foregroundStyle(.primary)
            .fontWeight(fontWeight)
            .lineLimit(lineLimit)
    }
    
    func captionStyle(fontWeight: Font.Weight = .regular, lineLimit: Int = .max) -> some View {
        self
            .font(AppTypography.caption)
            .foregroundStyle(.secondary)
            .fontWeight(fontWeight)
            .lineLimit(lineLimit)
    }
    
    func buttonStyle() -> some View {
        self
            .font(AppTypography.body)
            .foregroundStyle(.white)
    }
    
}
