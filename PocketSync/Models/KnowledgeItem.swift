//
//  KnowledgeItem.swift
//  PocketSync
//
//  Created by Bibek upreti on 09/07/2026.
//

import Foundation
import SwiftData

@Model
final class KnowledgeItem {
    var id: Int
    var title: String
    var note: String
    var url: String
    var createdAt: String
    var updateAt: String
    var syncStatus: Bool
    
    init(id: Int, title: String, description: String, url: String, createdAt: String, updateAt: String, syncStatus: Bool) {
        self.id = id
        self.title = title
        self.note = description
        self.url = url
        self.createdAt = createdAt
        self.updateAt = updateAt
        self.syncStatus = syncStatus
    }
}
