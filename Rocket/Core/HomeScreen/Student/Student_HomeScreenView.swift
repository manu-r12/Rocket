//
//  Student_HomeScreenView.swift
//  Rocket
//
//  Created by Manu on 2024-01-29.
//

import SwiftUI

struct Student_HomeScreenView: View {
    @State var searchTxtField: String = ""
    var body: some View {
        VStack(spacing: 1){
            
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Image("teacher2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: -6){
                        Text("Welcome")
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .foregroundStyle(.customBlue1)
                        
                        Text("Manu R")
                            .font(.custom("Poppins-Medium", size: 18))
                            .foregroundStyle(.uniBlack)
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            
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
                    
                    VStack{
                        
                        VStack{
                            
                            Text("Recent Files >")
                                .font(.custom("Poppins-Regular", size: 17))
                        }
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top, 10)
                        
                        VStack(spacing: 20){
                            ForEach(0...10, id:\.self){file in
                                
                                Student_PDFListView()
                                
                            }
                        }
                           
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                }
            }
            .padding(.top, 15)
            
            Spacer()
        }
        
    }
}

#Preview {
    Student_HomeScreenView()
}
