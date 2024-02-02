//
//  AssignedWorkBoxItem.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct AssignedWorkBoxItem: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Due on: 9th july")
                        .font(.custom("Poppins-Regular", size: 12))
                    Spacer()
                    Text("2hr ago")
                        .font(.custom("Poppins-Regular", size: 12))
                }
                .foregroundStyle(.gray)
                .padding(.horizontal, 9)
            }
            .padding(7)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray5))
            
            VStack{
                
                HStack(alignment: .top, spacing: 20){
                    VStack(alignment: .leading){
                        Text("Note:")
                            .font(.custom("Poppins-Medium", size: 13))
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim")
                            .font(.custom("Poppins-Regular", size: 12))
                        
                        Text("Tap to view")
                            .font(.custom("Poppins-Medium", size: 13))
                            .padding(.top, 5)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        PDFFIleIcon()
                        Text("History Assignment 2021.pdf")
                            .font(.custom("Poppins-Regular", size: 11))
                            .frame(width: 50)
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal, 30)
                
            }
//            }.frame(maxHeight: .infinity)
            Spacer()
        }
        .frame(width: 360, height: 180)
        .background(.uniWhite)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color(.systemGray5), radius: 5, x: 0, y: 0)
    }
}

#Preview {
    AssignedWorkBoxItem()
}
