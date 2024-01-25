//
//  RocketApp.swift
//  Rocket
//
//  Created by Manu on 2024-01-25.
//

import SwiftUI

@main
struct RocketApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
