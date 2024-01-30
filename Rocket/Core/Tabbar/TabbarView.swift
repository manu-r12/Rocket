//
//  TabbarView.swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct TabbarView: View {
    @State var currentTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: -12.0){
            TabView(selection: $currentTab){
                Student_HomeScreenView()
                    .tag(Tab.home)
                
                Teacher_HomeScreenView()
                    .tag(Tab.classrooms)
                
                
                Text("Conversations View")
                    .tag(Tab.conversations)
            }
            
            CustomTabbarView(currentTab: $currentTab)
        }
        
    }
}

#Preview {
    TabbarView()
}
