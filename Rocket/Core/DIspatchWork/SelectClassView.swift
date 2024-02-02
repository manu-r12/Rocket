//
//  SelectClassView.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct SelectClassView: View {
    @State var selectedClass: Int = 0
    var body: some View {
        ScrollView {
            VStack{
                HStack {
                    Spacer()
                    Text("Select the Class")
                        .font(.custom("Poppins-Medium", size: 19))
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 26))
                            .foregroundStyle(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .bottomLeading, endPoint: .topTrailing))
                    })
                }
                .padding()
                
                VStack{
                        
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { class_ in
                        HStack{
                            ClassroomCirclePFP()
                            Spacer()
                            Text("History class 2023")
                                .font(.custom("Poppins-Medium", size: 16))
                            Spacer()
                            if selectedClass != class_ {
                                Image(systemName: "circle")
                            }else{
                                Image(systemName: "checkmark.circle.fill")
                            }
                           
                        }
                        .onTapGesture {
                            withAnimation(.spring) {
                                selectedClass  = class_
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SelectClassView()
}
