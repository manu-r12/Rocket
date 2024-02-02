//
//  Student_JoinedClassrormView.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct Student_JoinedClassrormView: View {
    @State var isPDF_Info_Shee_tPresented: Bool = false
    init(){
        
    }
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
                    NavigationLink {
                        ConversationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Image(systemName: "bubble.fill")
                             .font(.system(size: 21))
                             .foregroundStyle(.uniBlack)
                    }

                }
                .padding()
            }
            
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
                            .onTapGesture {
                                withAnimation(.spring) {
                                    isPDF_Info_Shee_tPresented.toggle()
                                }
                            }
                            
                    }
                }
                
            }
            
        }
        .fullScreenCover(isPresented: $isPDF_Info_Shee_tPresented, content: {
            AssignmentInfoView()
                .presentationBackground(.ultraThinMaterial)
             
                
        })
        
    }
}

#Preview {
    Student_JoinedClassrormView()
}
