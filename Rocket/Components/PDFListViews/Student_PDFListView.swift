//
//  Student_PDFListView.swift
//  Rocket
//
//  Created by Manu on 2024-01-29.
//

import SwiftUI

struct Student_PDFListView: View {
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 0){
                Image("pdf_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                
                VStack(alignment: .leading,spacing: 9){
                    HStack {
                        Text("Science_Assignment 2.pdf")
                            .font(.custom("Poppins-Regular", size: 16))
                        Text("17")
                            .font(.custom("Poppins-Medium", size: 13))
                            .frame(width: 20, height: 20)
                            .foregroundColor(.uniBlack)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                            .padding(.leading, 12)
                        
                    }
                    HStack{
                        Text("Checked")
                            .font(.custom("Poppins-Regular", size: 12))
                            .frame(width: 70)
                            .padding(3)
                            .background(Color(.customGreen))
                            .foregroundStyle(.uniWhite)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                        Text("Submitted 2hr ago")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundStyle(.gray)
                    }
                         
                }
                .frame(maxWidth: .infinity)
               
            }
//            .background(.gray)
         
            
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
        
      
    }
}

#Preview {
    Student_PDFListView()
}
