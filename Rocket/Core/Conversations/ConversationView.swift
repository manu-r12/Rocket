//
//  ConversationView.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        VStack{
            //Header
            VStack{
                HStack{
                    Image(systemName: "chevron.left")
                    Spacer()
                    HStack{
                        ClassroomCirclePFP()
                        Text("History nerds 2023")
                            .font(.custom("Poppins-Regular", size: 17))
                    }
                    Spacer()
                    
                }
                .padding(.horizontal)
            }
            // Messages
            ScrollView{
                VStack {
                    ForEach(0..<1, id: \.self){msg in
                       
                        ChatBubbleItem()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
        }
        
        
    }
}

#Preview {
    ConversationView()
}
