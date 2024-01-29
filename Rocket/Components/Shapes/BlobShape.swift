import SwiftUI


struct Blob: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width, y: 0.50817*height))
        path.addCurve(to: CGPoint(x: 0.52222*width, y: height), control1: CGPoint(x: width, y: 0.7798*height), control2: CGPoint(x: 0.78609*width, y: height))
        path.addCurve(to: CGPoint(x: 0.01746*width, y: 0.48856*height), control1: CGPoint(x: 0.25835*width, y: height), control2: CGPoint(x: 0.01746*width, y: 0.76019*height))
        path.addCurve(to: CGPoint(x: 0.52222*width, y: 0.01634*height), control1: CGPoint(x: -0.07936*width, y: 0.31209*height), control2: CGPoint(x: 0.26349*width, y: 0.10131*height))
        path.addCurve(to: CGPoint(x: width, y: 0.50817*height), control1: CGPoint(x: 0.78095*width, y: -0.06863*height), control2: CGPoint(x: width, y: 0.23654*height))
        path.closeSubpath()
        return path
    }
}


struct BlobShape: View {
    var body: some View {
        Blob()
            .frame(width: 400, height: 400)
            .foregroundStyle(LinearGradient(colors: ButtonGradients.gradients_colors, startPoint: .bottomTrailing, endPoint: .topLeading))
    }
}

#Preview {
    BlobShape()
}
