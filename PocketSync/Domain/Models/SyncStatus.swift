//
//  SyncStatus.swift
//  PocketSync
//
//  Created by Bibek upreti on 11/07/2026.
//

import Foundation

enum SyncStatus: Equatable {
    case pending
    case syncing
    case synced
    case failed(String)
}

enum SyncState: String, Codable {
    case pending
    case syncing
    case synced
    case failed
}
