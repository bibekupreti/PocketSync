//
//  RemoteExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 07/08/2026.
//

import Foundation

protocol RemoteExpenseRepository {
    func upload(_ expense: Expense) async throws
}
