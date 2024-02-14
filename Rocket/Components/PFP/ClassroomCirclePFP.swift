//
//  ClassrommPFPIcon.swift
//  Rocket
//
//  Created by Manu on 2024-01-30.
//

import SwiftUI

struct ClassroomCirclePFP: View {
    var body: some View {
        Image("history")
            .resizable()
            .scaledToFill()
            .frame(width: 62, height: 62)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          
    }
}

#Preview {
    ClassroomCirclePFP()
}
