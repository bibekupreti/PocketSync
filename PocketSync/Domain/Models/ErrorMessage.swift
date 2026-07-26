//
//  ErrorMessage.swift
//  PocketSync
//
//  Created by Bibek upreti on 26/07/2026.
//

import Foundation

struct ErrorMessage: Error {
    let status: Bool
    var title: String?
    let description: String
}
