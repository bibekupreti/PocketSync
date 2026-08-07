//
//  NetworkMonitoring.swift
//  PocketSync
//
//  Created by Bibek upreti on 07/08/2026.
//

import Foundation

protocol NetworkMonitoring: AnyObject {
    
    var isConnected: Bool { get }
    var statusUpdates: AsyncStream<Bool> { get }
    
    func startMonitoring()
    func stopMonitoring()
    
}
