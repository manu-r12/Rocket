//
//  ClassroomsListView.swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct ClassroomsListView: View {
    
    var body: some View {
        VStack{
            HStack(spacing: 30){
               
                ClassrommPFPIcon()
                
                VStack(alignment: .leading,spacing: 3){
                    HStack {
                        Text("History 2023")
                            .font(.custom("Poppins-Regular", size: 18))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding(.trailing)
                    }
                }
                
            }
            .padding(.horizontal,20)
  
        }
        .frame(maxWidth: .infinity, alignment: .leading)
 
    }
}

#Preview {
    ClassroomsListView()
}
