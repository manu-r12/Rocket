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
                    
                    Text("Home")
                        .font(.custom("Poppins-SemiBold", size: 24))
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        


            
            //Scroll List View of recent files
            VStack{
                ScrollView(){
                    //Search bar
                    VStack{
                        HStack(alignment: .center, spacing: 15){
                            Image(systemName: "magnifyingglass")
                                .imageScale(.large)
                                .foregroundStyle(ButtonGradients.Linear_Gradient_1)
                            TextField("Search", text: $searchTxtField)
                                .font(.custom("Poppins-Medium", size: 16))
                                .padding()
                                .frame(width: 310, height: 48)
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    
                    VStack{
                        
                        VStack{
                            
                            Text("Recent Files >")
                                .font(.custom("Poppins-Regular", size: 17))
                        }
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top, 10)
                        
                       
                        ForEach(0...10, id:\.self){file in
                            
                            Student_PDFListView()
                            
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
