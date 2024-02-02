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
            HStack(spacing: 30){
               
                PDFFIleIcon()
                
                VStack(alignment: .leading,spacing: 3){
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
//                            .frame(width: 70)
//                            .padding(3)
//                            .background(ButtonGradients.Linear_Gradient_1)
                            .foregroundStyle(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                        Text("Submitted 2hr ago")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundStyle(.gray)
                    }
                }
            }
            .padding(20)
            .background(Color(.uniWhite))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: Color(.systemGray5), radius: 5, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    Student_PDFListView()
}
