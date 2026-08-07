//
//  NetworkMonitor.swift
//  PocketSync
//
//  Created by Bibek upreti on 07/08/2026.
//

import Foundation
import Network

final class NetworkMonitor: NetworkMonitoring {
    
    // MARK: - Properties
    private let monitor: NWPathMonitor
    private let queue: DispatchQueue
    
    private let stream: AsyncStream<Bool>
    private var continuation: AsyncStream<Bool>.Continuation
    
    private(set) var isConnected: Bool = false
    var statusUpdates: AsyncStream<Bool> {
        stream
    }
    
    private var isMonitoring: Bool = false
    
    // MARK: - Initialization
    init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue(label: "com.pocketsync.network-monitor")
        
        var continuation: AsyncStream<Bool>.Continuation!
        self.stream = AsyncStream { streamContinuation in
            continuation = streamContinuation
        }
        self.continuation = continuation
    }
    
    // MARK: - Methods
    func startMonitoring() {
        guard !isMonitoring else {return}
        isMonitoring = true
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            self.isConnected = ( path.status == .satisfied )
            self.continuation.yield(isConnected)
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        guard isMonitoring else {
            return
        }
        
        isMonitoring = false
        monitor.cancel()
        continuation.finish()
    }
    
}
