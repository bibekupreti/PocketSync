//
//  ExpenseCategory.swift
//  PocketSync
//
//  Created by Bibek upreti on 11/07/2026.
//

import Foundation
import SwiftUI

enum ExpenseCategory: String, CaseIterable, Codable, Sendable, Identifiable, Hashable {
    var id: UUID {
        UUID()
    }
    
    case food = "Food and drinks"
    case transport = "Transport"
    case shopping = "Shopping"
    case bills = "Bills"
    case entertainment = "Entertainment"
    case other = "Other"
//    case income = "Income"
    
    var systemImage: String {
        switch self {
        case .food: return "takeoutbag.and.cup.and.straw"
        case .transport: return "car.fill"
        case .shopping: return "bag.fill"
        case .bills: return "doc.text.fill"
        case .entertainment: return "film.fill"
        case .other: return "ellipsis.circle.fill"
//        case .income: return "dollarsign"
        }
    }
    
    var tint: Color {
        switch self {
        case .food: return .orange
        case .transport: return .blue
        case .shopping: return .pink
        case .bills: return .red
        case .entertainment: return .purple
        case .other: return .gray
//        case .income: return AppColor.accent
        }
    }
    
}
