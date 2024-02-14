//
//  UserIconPlaceholder.swift
//  Rocket
//
//  Created by Manu on 2024-02-10.
//

import SwiftUI

struct UserIconPlaceholder: View {
    var body: some View {
        Image(systemName: "person")
            .font(.system(size: 32))
            .frame(width: 70, height: 70)
            .background(Color(.systemGray6))
            .clipShape(Circle())
    }
}

#Preview {
    UserIconPlaceholder()
}
