//
//  SyncMetadataRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 08/08/2026.
//

import Foundation

protocol SyncMetadataRepository {

    func fetchLastSuccessfulSync() async throws(RepositoryError) -> Date?

    func saveLastSuccessfulSync(
        _ date: Date
    ) async throws(RepositoryError)
}
