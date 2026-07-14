//
//  SyncStatusMapper.swift
//  PocketSync
//
//  Created by Bibek upreti on 14/07/2026.
//

import Foundation

enum SyncStatusMapper {
    
    static func toEntity(from syncStatus: SyncStatus) -> SyncPersistenceValue {
        let syncState: SyncState
        let syncErrorMessage: String?
        
        switch syncStatus {
        case .pending:
            syncState = .pending
            syncErrorMessage = nil
        case .syncing:
            syncState = .syncing
            syncErrorMessage = nil
        case .synced:
            syncState = .synced
            syncErrorMessage = nil
        case .failed(let message):
            syncState = .failed
            syncErrorMessage = message
        }
        
        return SyncPersistenceValue(state: syncState,
                                    errorMessage: syncErrorMessage)
    }
    
    static func toDomain( state: SyncState,
                          errorMessage: String?) -> SyncStatus {
        let syncStatus: SyncStatus
        
        switch state {
            
        case .pending:
            syncStatus = .pending
            
        case .syncing:
            syncStatus = .syncing
            
        case .synced:
            syncStatus = .synced
            
        case .failed:
            syncStatus = .failed(errorMessage ?? "Unknown error")
            
        }
        return syncStatus
    }
    
}
