import SwiftUI

extension Text {
    func foregroundGradient(colors: [Color]) -> some View {
        let gradient = LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .bottomTrailing)
        return self.overlay(
            Rectangle()
                .fill(gradient)
                .mask(self)
        )
    }
}
