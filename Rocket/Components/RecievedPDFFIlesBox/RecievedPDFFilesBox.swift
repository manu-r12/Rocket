//
//  RecievedPDFFilesBox.swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct RecievedPDFFilesBox: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("from Manu R")
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
                    VStack(){
                        Text("History_Assginment1.pdf")
                            .font(.custom("Poppins-Regular", size: 12))
                    }.frame(width: 130, alignment: .leading)
                    
                    VStack{
                        PDFFIleIcon()
                    }
                }
                
                
            }.frame(maxHeight: .infinity)
        }
        .frame(width: 230, height: 140)
        .background(.uniWhite)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color(.systemGray5), radius: 5, x: 0, y: 0)
    }
}

#Preview {
    RecievedPDFFilesBox()
}
