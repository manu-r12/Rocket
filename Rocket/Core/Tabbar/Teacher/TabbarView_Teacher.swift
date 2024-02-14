

import SwiftUI

struct TabbarView_Teacher: View {
    @State var currentTab: Tab_Teacher = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab){
                        Teacher_HomeScreenView()
                            .tag(Tab_Teacher.home)
                        
                        DispatchWorkView()
                            .tag(Tab_Teacher.dispatch)
                        
                        
                        Text("Conversations View")
                            .tag(Tab_Teacher.conversations)
            }
            CustomTabbarView_Teacher(currentTab: $currentTab)
        }  
    }
}

#Preview {
    TabbarView_Teacher()
}
