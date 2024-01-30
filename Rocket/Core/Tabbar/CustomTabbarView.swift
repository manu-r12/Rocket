//
//  CustomTabbarView.swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct CustomTabbarView: View {
    @Binding var currentTab: Tab
    
    
    
    var body: some View {
        VStack {
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue) {tab in
                    
                    Button(action: {
                        withAnimation(.smooth) {
                            currentTab = tab
                        }
                    }, label: {
                        Image(systemName: tab.rawValue)
                            .imageScale(.large)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                            .padding(10)
                        
                            .offset(y: currentTab == tab ? -7 : 0)
                           
                    })
                    
                }
            }
            .frame(maxWidth: .infinity)
       
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(.ultraThinMaterial.opacity(0.3))
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea(.all)
        )
        
        

   
      
    }
}

#Preview {
    TabbarView()
}
