//
//  SpendingCard.swift
//  PocketSync
//
//  Created by Bibek upreti on 23/07/2026.
//

import SwiftUI

import SwiftUI
import Charts

struct SpendingPoint: Identifiable {
    let id = UUID()
    let day: Int
    let value: Double
}

struct SpendingCard: View {
    let data: [SpendingPoint] = [
        .init(day: 0, value: 20), .init(day: 1, value: 18),
        .init(day: 2, value: 35), .init(day: 3, value: 40),
        .init(day: 4, value: 38), .init(day: 5, value: 42),
        .init(day: 6, value: 45), .init(day: 7, value: 43),
        .init(day: 8, value: 55), .init(day: 9, value: 70),
        .init(day: 10, value: 65), .init(day: 11, value: 80)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            Chart(data) { point in
                LineMark(
                    x: .value("Day", point.day),
                    y: .value("Value", point.value)
                )
                .interpolationMethod(.catmullRom) // smooths the line
                .foregroundStyle(AppColor.accent)
                .lineStyle(StrokeStyle(lineWidth: 2))

                AreaMark(
                    x: .value("Day", point.day),
                    y: .value("Value", point.value)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(
                    LinearGradient(
                        colors: [AppColor.accent.opacity(0.3), AppColor.accent.opacity(0)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .frame(height: 60)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(AppColor.card)
        )
    }
}
#Preview {
    SpendingCard()
}
