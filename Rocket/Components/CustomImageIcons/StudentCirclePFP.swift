//
//  StudentCirclePFP.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct StudentCirclePFP: View {
    var body: some View {
        Image("student2")
            .resizable()
            .scaledToFill()
            .frame(width: 62, height: 62)
            .clipShape(Circle())
    }
}

#Preview {
    StudentCirclePFP()
}
