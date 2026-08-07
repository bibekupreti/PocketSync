//
//  FakeRemoteExpenseRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 07/08/2026.
//

import Foundation

final class FakeRemoteExpenseRepository: RemoteExpenseRepository {
    
    func upload(_ expense: Expense) async throws {
        
        // Simulate network delay
        try await Task.sleep(for: .seconds(1))
        
        // 80% success rate
        if Int.random(in: 1...10) <= 8 {
            return
        }
        
        throw URLError(.badServerResponse)
    }
    
}
