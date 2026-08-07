//
//  ExpenseError.swift
//  PocketSync
//
//  Created by Bibek upreti on 14/07/2026.
//

import Foundation

enum RepositoryError: Error {
    case saveFailed
    case fetchFailed
    case deleteFailed
    case expenseNotFound
}
