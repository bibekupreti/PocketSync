//
//  SyncMetadataEntity.swift
//  PocketSync
//
//  Created by Bibek upreti on 08/08/2026.
//

import Foundation
import SwiftData

@Model
final class SyncMetadataEntity {

    @Attribute(.unique)
    var id: String

    var lastSuccessfulSyncAt: Date?

    init(
        id: String = "global",
        lastSuccessfulSyncAt: Date? = nil
    ) {
        self.id = id
        self.lastSuccessfulSyncAt = lastSuccessfulSyncAt
    }
}
