//
//  MockViewModelFactory.swift
//  PocketSync
//
//  Created by Bibek upreti on 22/07/2026.
//

import Foundation

enum MockViewModelFactory {
    static func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(
            repository: MockExpenseRepository()
        )
    }
}
