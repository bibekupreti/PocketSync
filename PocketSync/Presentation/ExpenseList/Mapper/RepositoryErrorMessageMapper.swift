//
//  RepositoryErrorMessageMapper.swift
//  PocketSync
//
//  Created by Bibek upreti on 15/07/2026.
//

import Foundation

enum RepositoryErrorMessageMapper {
    
    static func message(for error: RepositoryError) -> String {
        switch error {
        case .fetchFailed:
            return L10n.RepositoryError.fetchFailed
        case .saveFailed:
            return L10n.RepositoryError.saveFailed
        case .deleteFailed:
            return L10n.RepositoryError.deleteFailed
        case .expenseNotFound:
            return L10n.RepositoryError.expenseNotFound
            
        }
    }
    
}
