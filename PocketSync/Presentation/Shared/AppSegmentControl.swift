//
//  AppSegmentControl.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

struct AppSegmentControl<T: Hashable, Content: View>: View {
    let segments: [T]
    @Binding var selection: T
    let content: (T, Bool) -> Content // (segment, isSelected) -> label view

    @Namespace private var animation

    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments, id: \.self) { segment in
                let isSelected = segment == selection

                content(segment, isSelected)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack {
                            if isSelected {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(AppColor.background)
                                    .shadow(color: .black.opacity(0.1), radius: 2, y: 1)
                                    .matchedGeometryEffect(id: "segment_bg", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            selection = segment
                        }
                    }
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(AppColor.card)
        )
    }
}

// MARK: - Convenience initializer for simple text labels

extension AppSegmentControl where Content == Text {
    init(
        segments: [T],
        selection: Binding<T>,
        label: @escaping (T) -> String
    ) {
        self.segments = segments
        self._selection = selection
        self.content = { segment, isSelected in
            Text(label(segment))
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? AppColor.accent : .primary)
        }
    }
}
