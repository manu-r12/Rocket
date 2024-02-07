//
//  SelectRoleForRegisterationView.swift
//  Rocket
//
//  Created by Manu on 2024-01-27.
//

import SwiftUI

struct SelectRoleForSignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack {
            
            VStack{
                Text("Select Role")
                    .font(.custom("Poppins-Medium", size: 31))
                
                // buttons
                VStack(spacing: 20){
                    Button(action: {
                        withAnimation(.smooth) {
                            viewModel.selectedRole = .student
                            
                        }
                    }, label: {
                        if  viewModel.selectedRole == .student {
                            Text("A Student")
                                .modifier(SelectedButton())
                        }else{
                            Text("A Student")
                                .modifier(NotSelectedButton())
                        }
                    })
                    
                    Button(action: {
                        withAnimation(.smooth) { 
                            viewModel.selectedRole = .teacher
                           
                        }
                    }, label: {
                        if viewModel.selectedRole == .teacher {
                            Text("A Teacher")
                                .modifier(SelectedButton())
                        }else{
                            Text("A Teacher")
                                .modifier(NotSelectedButton())
                        }
                    })
                }
                .padding(.horizontal, 35)
                
                //link to go to next view
                
                if viewModel.selectedRole != .nothingSelected {
                    Button {
                        Task {
                           await viewModel.signUp()
                        }
                        
                    } label: {
                        Text("Complete Sign Up")
                            .font(.custom("Poppins-Medium", size: 22))
                            .frame(width: 250, height: 55)
                            .background(.uniBlack)
                            .foregroundStyle(.uniWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.top, 90)
                    }

                }
         
            
            }
            
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .padding(7)
                    .foregroundStyle(.uniWhite)
                    .background(.uniBlack)
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
            }
        })
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
    SelectRoleForSignUpView(viewModel: SignUpViewModel())
}
