
import SwiftUI
struct PDFFIleIcon: View {
    var body: some View {
        Image(systemName: "doc.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 38)
            .fontWeight(.light)
            .foregroundStyle(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

