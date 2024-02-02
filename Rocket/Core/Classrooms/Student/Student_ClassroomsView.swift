//
//  Student_ClassroomsView.swift
//  Rocket
//
//  Created by Manu on 2024-01-31.
//

import SwiftUI

struct Student_ClassroomsView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 1){
                
                HStack(spacing: 0){
                    ProfileHeader(name: "Ella Allen", profile_avatar: "teacher1")
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(ButtonGradients.Linear_Gradient_1)
                        .padding(.trailing, 40)
                        .onTapGesture {
                            withAnimation(.spring) {
                                isPresented.toggle()
                            }
                        }
                  
                }
                
                //Scroll List View of recent files
                VStack{
                    ScrollView(){
                        
                        //Search bar
                        Search_Bar()
                        
                        VStack(spacing: 20){
                            Text("Joined Classrooms >")
                                .font(.custom("Poppins-Regular", size: 17))
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(spacing: 16){
                                ForEach(0...2, id:\.self){file in
                                    NavigationLink(value: file) {
                                        ClassroomsListView()
                                            .tint(.uniBlack)
                                    }
                                   
                                }
                            }
                               
                        }
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .padding(.top, 15)
                
                Spacer()
            }
            .navigationDestination(for: Int.self, destination: { classroom in
                Student_JoinedClassrormView()
                    .navigationBarBackButtonHidden(true)
            })
            .fullScreenCover(isPresented: $isPresented, content: {
                DispatchWorkView()
                    .presentationBackground(.ultraThinMaterial)
        })
        }
    }
}

#Preview {
    Student_ClassroomsView()
}
