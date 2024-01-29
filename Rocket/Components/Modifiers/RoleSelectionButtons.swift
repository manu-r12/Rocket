import SwiftUI


struct NotSelectedButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 58)
            .foregroundStyle(.uniBlack)
            .font(.custom("Poppins-Regular", size: 21))
            .kerning(0.8)
            .background(Capsule().stroke(.uniBlack, lineWidth: 1.5))
    }
}

struct SelectedButton: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 58)
            .foregroundStyle(.uniWhite)
            .font(.custom("Poppins-Regular", size: 21))
            .kerning(0.8)
            .background(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, 
                                       startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule())
    }
}
