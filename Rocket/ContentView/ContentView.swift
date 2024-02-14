//
//  ContentView.swift
//  Rocket
//
//  Created by Manu on 2024-01-25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var googelAuthModel = SocialAuthentication.shared
    
    var body: some View{
        Group {
            if googelAuthModel.isLoggedIn {
                TabbarView()
            }else{
                WelcomeView()
            }
        }
    }
}


#Preview {
    ContentView()
}
