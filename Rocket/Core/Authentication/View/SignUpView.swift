//
//  SignUpView.swift
//  Rocket
//
//  Created by Manu on 2024-01-27.
//

import SwiftUI

struct SignUpView: View {
    let selectedRole: RoleSelection
    @State var name: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @Environment (\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            VStack{
                //header , titles
                VStack(alignment: .leading, spacing: 10){
                    Text("Sign Up")
                        .font(.custom("Poppins-Medium", size: 51))
                    
                    HStack(spacing: 7){
                        Text("Dont have an account?")
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
                    VStack(spacing: 15){
                        TextField("Name", text: $name)
                            .modifier(TextFieldCustomStyle())
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .modifier(TextFieldCustomStyle())
                        TextField("Username", text: $username)
                            .modifier(TextFieldCustomStyle())
                        SecureField("Password", text: $password)
                            .modifier(TextFieldCustomStyle())
                            .textInputAutocapitalization(.never)
                    }
                    
                    Button(action: {}, label: {
                        Text("Sign Up")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 58)
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
    SignUpView(selectedRole: .student)
}
