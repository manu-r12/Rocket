

import SwiftUI

struct CustomTabbarView_Teacher: View {
    @Binding var currentTab: Tab_Teacher
    var body: some View {
        VStack {
            HStack(spacing: 0){
                ForEach(Tab_Teacher.allCases, id: \.rawValue) {tab in
                    
                    Button(action: {
                        withAnimation(.smooth) {
                            currentTab = tab
                        }
                    }, label: {
                        Image(systemName: tab.rawValue)
                            .imageScale(.large)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .fontWeight(.medium)
                            .padding(10)
                            .offset(y: currentTab == tab ? -7 : 0)
                    })
                    
                }
            }
            .frame(maxWidth: .infinity)
       
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(.ultraThinMaterial)
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(LinearGradient(colors: ButtonGradients.gradients_colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea(.all)
              
        )
    }
}

#Preview {
    TabbarView()
}
