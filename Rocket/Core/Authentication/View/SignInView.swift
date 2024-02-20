//
//  LoginView.swift
//  Rocket
//
//  Created by Manu on 2024-01-26.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn
struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            VStack{
                //header , titles
                VStack(alignment: .leading, spacing: 20){
                    Text("Sign In")
                        .font(.custom("Poppins-Medium", size: 51))
                        .onTapGesture {
                           
                        }
                    
                    HStack(spacing: 7){
                        Text("Dont have an account?")
                            .font(.custom("Poppins-Regular", size: 16))
                            .foregroundStyle(Color(.systemGray))
                        
                        
                        
                        NavigationLink("Sign Up") {
                                SignUpView()
                                .navigationBarBackButtonHidden(true)
                        }
                        .foregroundStyle(LinearGradient(colors: ButtonGradients.gradients_colors, startPoint: .leading, endPoint: .trailing))
                        .font(.custom("Poppins-Regular", size: 17))
                        .underline()
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // input fields and login button
                VStack(spacing: 40){
                    Button(action: {
                        viewModel.signIn()
                    }, label: {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text("Sign in")
                        }
                        .frame(maxWidth: .infinity, minHeight: 68)
                        .foregroundStyle(.uniWhite)
                        .font(.custom("Poppins-Medium", size: 21))
                        .kerning(0.8)
                        .background(.uniBlack)
                        .clipShape(Capsule())
                    })
                }
                .padding()
                
                
            }
            
            
        }
        .background {
            BlobShape()
                .offset(x:  60, y: -430)
               
            Image("rocket")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .offset(x:  60, y: -330)
            
            
            BlobShape()
                .offset(x:  -0, y: 490)
               
                
        }
        
   
        
    }
    
    
    
    
}

#Preview {
    SignInView()
}

