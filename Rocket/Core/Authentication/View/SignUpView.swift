//
//  SignUpView.swift
//  Rocket
//
//  Created by Manu on 2024-01-27.
//

import SwiftUI
import GoogleSignIn

struct SignUpView: View {
    @ObservedObject var viewModel = SignUpViewModel()
    @State var name: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @Environment (\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Group {
            if viewModel.currentUser == nil {
                VStack {
                    VStack{
                        //header , titles
                        VStack(alignment: .leading, spacing: 10){
                            Text("Sign Up")
                                .onTapGesture {
                                    GoogleAuthentication.shared.signOut()
                                    
                                }
                                .font(.custom("Poppins-Medium", size: 51))
                            
                            HStack(spacing: 7){
                                Text("Already have an account?")
                                    .font(.custom("Poppins-Regular", size: 16))
                                    .foregroundStyle(Color(.systemGray))
                                
                                
                                
                                Button(action: { dismiss() }, label: {
                                    Text("Sign In")
                                        .foregroundStyle(LinearGradient(colors: ButtonGradients.gradients_colors, startPoint: .leading, endPoint: .trailing))
                                        .font(.custom("Poppins-Regular", size: 17))
                                        .underline()
                                })
                                
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // input fields and login button
                        VStack(spacing: 30){
                            
                            Button(action: {
                                Task {
                                    await viewModel.signUp()
                                }
                                
                            }, label: {
                                HStack {
                                    Image("google")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Text("Sign Up")
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
            }else{
                SelectRoleForSignUpView(viewModel: viewModel)
                   
            }
        }
    }
    
    
}

#Preview {
    SignUpView()
}
