//
//  TabbarView.swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct TabbarView: View {
    @ObservedObject var viewModel = TabbarViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView  {
            VStack(spacing: -12.0){
                
                Group{
               
                        TabbarView_Teacher()
                   
                }
            }
            .ignoresSafeArea(.keyboard)
        }
        
    }
}

#Preview {
    TabbarView()
}
