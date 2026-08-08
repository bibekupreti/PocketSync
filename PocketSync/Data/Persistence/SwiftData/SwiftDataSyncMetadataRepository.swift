//
//  SwiftDataSyncMetadataRepository.swift
//  PocketSync
//
//  Created by Bibek upreti on 08/08/2026.
//

import Foundation
import SwiftData

final class SwiftDataSyncMetadataRepository: SyncMetadataRepository {

    // MARK: - Properties

    private let modelContext: ModelContext

    // MARK: - Initialization

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // MARK: - SyncMetadataRepository

    func fetchLastSuccessfulSync()
        async throws(RepositoryError) -> Date?
    {
        do {

            let descriptor = FetchDescriptor<SyncMetadataEntity>(
                predicate: #Predicate {
                    $0.id == "global"
                }
            )

            let entity = try modelContext.fetch(descriptor).first

            return entity?.lastSuccessfulSyncAt

        } catch {

            throw .fetchFailed
        }
    }

    func saveLastSuccessfulSync(
        _ date: Date
    ) async throws(RepositoryError) {

        do {

            let descriptor = FetchDescriptor<SyncMetadataEntity>(
                predicate: #Predicate {
                    $0.id == "global"
                }
            )

            let entity: SyncMetadataEntity

            if let existing = try modelContext.fetch(descriptor).first {

                entity = existing

            } else {

                entity = SyncMetadataEntity(
                    lastSuccessfulSyncAt: date
                )

                modelContext.insert(entity)
            }

            entity.lastSuccessfulSyncAt = date

            try modelContext.save()

        } catch {

            throw .saveFailed
        }
    }
}
