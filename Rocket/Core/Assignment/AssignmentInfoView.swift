//
//  AssignmentInfoView.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct AssignmentInfoView: View {
    var body: some View {
        VStack {
            ScrollView{
                //Header
                VStack{
                    Text("Assignment no 2 2022")
                        .font(.custom("Poppins-Medium", size: 19))
                }
                
                //Assignment Name and Details box item
                
                VStack{
                    HStack(spacing: 40){
                        PDFFIleIcon()
                        VStack(alignment:.leading){
                            Text("Assignment no 2 dk22")
                                .font(.custom("Poppins-Medium", size: 14))
                            
                            Text("Download")
                                .font(.custom("Poppins-Medium", size: 14))
                                .underline()
                        }
                        .frame(width: 200)
                    }
                    .frame(width: 300)
                }
                .padding(.bottom, 30)
                
                //Images
                VStack(alignment: .leading){
                    Text("Related Images >")
                        .font(.custom("Poppins-Regular", size: 19))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal){
                        HStack(){
                            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                Image("bio")
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .scaledToFit()
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding()
                    }
                }
                
                //Note Information
                VStack{
                    Text("Note")
                        .font(.custom("Poppins-Regular", size: 19))
                    
                    VStack(){
                        Text("Hello guys this work must be done before  next week")
                            .padding()
                            .frame(width: 350, height: 250, alignment: .top)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .font(.custom("Poppins-Regular", size: 14))
                    }
                    
                    
                }
            }
            
            .scrollIndicators(.hidden)
        }
      
    }
}

#Preview {
    AssignmentInfoView()
}
