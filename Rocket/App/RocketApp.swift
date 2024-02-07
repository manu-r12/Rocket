//
//  RocketApp.swift
//  Rocket
//
//  Created by Manu on 2024-01-25.
//

import SwiftUI
import GoogleSignIn

@main
 struct RocketApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var userAuth: GoogleAuthentication =  GoogleAuthentication()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userAuth)
                
        }
    }
}
