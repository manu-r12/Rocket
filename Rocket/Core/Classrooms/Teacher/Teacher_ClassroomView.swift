//
//  Teacher_ClassroomView.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct Teacher_ClassroomView: View {
    var body: some View {
        VStack{
            //Header
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                    Spacer()
                    HStack{
                        ClassroomCirclePFP()
                        Text("History nerds 2023..")
                            .font(.custom("Poppins-Regular", size: 17))
                    }
                    Spacer()
                    Image(systemName: "bubble.fill")
                        .font(.system(size: 25))
                }
                .padding()
            }
            
            VStack{
                HStack {
                    Text("Teaacher")
                    Image(systemName: "person")
                }
           
            }
            .padding(.trailing)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            
            //Joined Students List (Horizontal)
            
            ScrollView {
                VStack(alignment: .leading){
                    Text("Joined Students >")
                        .font(.custom("Poppins-Regular", size: 17))
                        .padding()
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(0...10, id: \.self){studentPFP in
                                StudentCirclePFP()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .scrollIndicators(.hidden)
                }.padding(.bottom)
                
                
                //Assigned Works
                
                VStack(alignment: .leading, spacing: 30){
                    Text("Assigned Works")
                        .font(.custom("Poppins-Regular", size: 17))
                    
                    ForEach(0...10, id: \.self){work in
                        
                        AssignedWorkBoxItem()
                        
                        
                        
                    }
                    
                    
                    
                }
          
            }
          
        }
    }
}

#Preview {
    Teacher_ClassroomView()
}
