//
//  ExpenseCategory.swift
//  PocketSync
//
//  Created by Bibek upreti on 11/07/2026.
//

import Foundation

enum ExpenseCategory: String, CaseIterable, Codable, Sendable {
    case food
    case transport
    case shopping
    case billing
    case entertainment
    case health
    case travel
    case other
}
