import Foundation
import SwiftUI

struct ButtonGradients{
    
   // custom colors
   static let gradients_colors = [Color(.customPink), Color(.customPurple), Color(.customBlue)]
   static let gradient_color_purpleToblue = [Color(.customPurple), Color(.customBlue)]
    
    
   //Gradients
   static let buttonGradient_1 = Gradient(colors: gradients_colors)
   static let Linear_Gradient_1 = LinearGradient(gradient: buttonGradient_1, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
   
     
}


