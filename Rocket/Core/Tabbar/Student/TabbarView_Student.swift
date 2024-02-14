//
//  TabbarView_Student.swift
//  Rocket
//
//  Created by Manu on 2024-02-10.
//

import SwiftUI

struct TabbarView_Student: View {
    @State var currentTab: Tab_Student = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack{
            TabView(selection: $currentTab){
                Student_HomeScreenView()
                    .tag(Tab_Student.home)
                
                Student_ClassroomsView()
                    .tag(Tab_Student.classrooms)
                
                
                Text("Conversations View")
                    .tag(Tab_Student.conversations)
            }
            
            CustomTabbarView_Student(currentTab: $currentTab)
        }
        
        
    }
}


