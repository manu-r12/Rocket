
import SwiftUI

struct SelectRoleForSignUpView: View {
    @ObservedObject var viewModel = UserAuthenticationModel.shared
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack {
            
            VStack{
                Text("Select a role")
                    .font(.custom("Poppins-Medium", size: 31))
                
                // buttons
                VStack(spacing: 20){
                    Button(action: {
                        withAnimation(.smooth) {
                            DispatchQueue.main.async {
                                viewModel.selectedRole = .student
                            }
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
                            DispatchQueue.main.async {
                                viewModel.selectedRole = .teacher
                            }
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
                        Task
                        {
                           await viewModel.signUp()
                        }
                       
                        
                    } label: {
                        Text("Complete Sign Up")
                            .font(.custom("Poppins-Medium", size: 19))
                            .frame(width: 250, height: 55)
                            .background(.uniBlack)
                            .foregroundStyle(.uniWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.top, 90)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
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
        .overlay(alignment: .topTrailing, content: {
            VStack{
                HStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text("Welcome")
                            .font(.custom("Poppins-SemiBold", size: 22))
                            .foregroundStyle(.white)
                        Text(viewModel.currentUser?.profile?.name ?? "Loading..")
                            .font(.custom("Poppins-Medium", size: 17))
                            .foregroundStyle(.white)
                    }
                    TeacherCirclePFP(imageURL: viewModel.currentUser?.profile?.imageURL(withDimension: 200)?.absoluteString)
                        .onTapGesture {
                            SocialAuthentication.shared.signOut()
                        }
                }
            }
            .padding(.top, -21)
            .padding(.trailing, 20)
        })
        .background {
            BlobShape()
                .offset(x:  60, y: -430)
            BlobShape()
                .offset(x:  -0, y: 490)
        }
    }
}

#Preview {
    SelectRoleForSignUpView(viewModel: UserAuthenticationModel())
}
