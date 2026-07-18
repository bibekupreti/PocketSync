//
//  PocketSyncApp.swift
//  PocketSync
//
//  Created by Bibek upreti on 09/07/2026.
//

import SwiftUI
import SwiftData

@main
struct PocketSyncApp: App {
    
    private let container: DependencyContainer
    
    init() {
        do {
            container = try DependencyContainer()
        } catch {
            fatalError("Failed to initialize dependency container \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            AppTabBarView(
                homeViewModel: container.viewModelFactory.makeHomeViewModel()
            )
        }
//        .modelContainer(sharedModelContainer)
    }
}
