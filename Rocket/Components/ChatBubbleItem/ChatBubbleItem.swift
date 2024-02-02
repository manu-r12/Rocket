//
//  ChatBubbleItem.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct ChatBubbleItem: View {
    @State var bubblePostion = "left"
    var body: some View {
        VStack {
            if bubblePostion == "right" {
                VStack{
                HStack(alignment: .top){
                    VStack {StudentCirclePFP()}
                    VStack {
                        Text("").padding(.bottom, 1)
                        VStack(alignment: .leading){
                            Text("Hello everyone, emma  a her ldslk sdmlkd sdm kdse ")
                                .frame(width: 210, alignment: .leading)
                                .font(.custom("Poppins-Regular", size: 17))
                            
                        }
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, bottomTrailing: 30, topTrailing: 30)))
                    }
         
                }
               
                }
            } else {
                VStack{
                HStack(alignment: .top){
                    VStack {
                        Text("").padding(.bottom, 1)
                        VStack(alignment: .leading){
                            Text("Hello everyone, emma  a her ldslk sdmlkd sdm kdse ")
                                .frame(width: 210, alignment: .leading)
                                .font(.custom("Poppins-Regular", size: 17))
                            
                        }
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 30, bottomTrailing: 30)))
                    }
                    VStack {StudentCirclePFP()}
                    
         
                }
               
                }
            }
        }
    }
}

#Preview {
    ChatBubbleItem()
}
