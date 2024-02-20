//
//  Teacher_HomeScreenView().swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct Teacher_HomeScreenView: View {
    @State var searchTxtField: String = ""
    @ObservedObject var viewModel = HomeScreenViewModel()
    var body: some View {
        VStack(spacing: 1){
            
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    UserCirclePFP(imageURL: viewModel.userData?.profile_picture)
                    
                    VStack(alignment: .leading, spacing: -6){
                        Text("Welcome")
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .foregroundStyle(.customBlue1)
                        if let name = viewModel.userData?.name{
                            Text(name)
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundStyle(.uniBlack)
                                .onTapGesture {
                                    SocialAuthentication.shared.signOut()
                                }
                        }else{
                            Text("Loading..")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundStyle(.uniBlack)
                                .onTapGesture {
                                    SocialAuthentication.shared.signOut()
                                }
                        }
                        
                        
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            //Scroll List View of recent files
            VStack{
                ScrollView(){
                    //Search bar
                    VStack{
                        HStack(alignment: .center, spacing: 10){
                            
                            TextField("Search", text: $searchTxtField)
                                .font(.custom("Poppins-Medium", size: 16))
                            
                            Image(systemName: "magnifyingglass")
                                .imageScale(.medium)
                                .frame(width: 35, height: 35)
                                .foregroundStyle(.white)
                                .background(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .leading, endPoint: .trailing))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .fontWeight(.medium)
                            
                            
                        }.padding()
                            .frame(width: 320, height: 65)
                            .background(Color(.uniWhite))
                            .clipShape(RoundedRectangle(cornerRadius: 22))
                            .shadow(color: Color(.systemGray4), radius: 5, x: 0, y: 0)
                    }
                    .padding(.top, 8)
                    
                    if !viewModel.isLoading {
                        VStack{
                            
                            VStack(alignment: .leading){
                                
                                Text("Recieved Files >")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .padding(.horizontal)
                                
                                
                                ScrollView(.horizontal){
                                    
                                    HStack(spacing: 20){
                                        ForEach(0...10, id: \.self){file in
                                            
                                            RecievedPDFFilesBox()
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                }
                                
                                .scrollIndicators(.hidden)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            
                            
                            Text("Your Classrooms >")
                                .font(.custom("Poppins-Regular", size: 17))
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(spacing: 16){
                                ForEach(0...10, id:\.self){file in
                                    ClassroomsListView()
                                }
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        ProgressView()
                    }
                }
            }
            .padding(.top, 15)
            
            Spacer()
        }
        .onAppear{
            if viewModel.userData == nil {
                viewModel.load()
            }
            
            
        }
    }
}

#Preview {
    Teacher_HomeScreenView()
}
