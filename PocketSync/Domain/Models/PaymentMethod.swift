//
//  PaymentMethod.swift
//  PocketSync
//
//  Created by Bibek upreti on 24/07/2026.
//

import Foundation

enum PaymentMethod: String, CaseIterable {
    case cash = "Cash"
    case card = "Card"
    case bankTransfer = "Bank Transfer"
    case mobileWallet = "Mobile Wallet"
}
