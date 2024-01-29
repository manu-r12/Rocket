//
//  TextFieldCustomStyle.swift
//  Rocket
//
//  Created by Manu on 2024-01-26.
//

import Foundation
import SwiftUI

// custom style for text and secure fields
struct TextFieldCustomStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.custom("Poppins-Medium", size: 17))
            .overlay(Capsule().stroke(Color(.systemGray5), lineWidth: 2))
            
        
        
    }
}


