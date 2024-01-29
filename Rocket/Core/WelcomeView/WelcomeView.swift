//
//  WelcomeView.swift
//  Rocket
//
//  Created by Manu on 2024-01-26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack{
                VStack{
                    VStack(alignment: .leading){
                        Text("Hey,")
                        Text("Welcome")
                        HStack(spacing: 15){
                            Text("to")
                            Text("Rocket")
                                .font(.custom("Poppins-SemiBold", size: 59))
                                .foregroundGradient(colors: ButtonGradients.gradients_colors)
                        }
                        
                    }
                    .font(.custom("Poppins-Medium", size: 59))
                    
                    Image("rocket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                }
                .padding(50)
                
                NavigationLink("Get Started") {
                    SignInView()
                        .navigationBarBackButtonHidden(true)
                }
                .frame(width: 280, height: 65)
                .font(.custom("Poppins-SemiBold", size: 19))
                .foregroundStyle(.white)
                .background(LinearGradient(gradient: ButtonGradients.buttonGradient_1, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .trailing))
                .clipShape(Capsule())
                
                
                
                
            }
            
        }
        
        
        
    }
}

#Preview {
    WelcomeView()
}
