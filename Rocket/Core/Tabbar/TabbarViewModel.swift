import SwiftUI
import Combine

enum Tab_Student: String, CaseIterable {
    case home = "house.fill"
    case classrooms = "rectangle.badge.person.crop"
    case conversations  = "bubble.fill"
    case notifications = "bell.fill"
}


enum Tab_Teacher: String, CaseIterable {
    case home = "house.fill"
    case dispatch = "plus"
    case conversations  = "bubble.fill"
    case notifications = "bell.fill"
}


class TabbarViewModel: ObservableObject {
    @Published var user: User?
    private var cancellable = Set<AnyCancellable>()
    
    private func setUpSubscriber(){
        UserAuthenticationModel.shared.$userData.sink { user in
            self.user = user
        }.store(in: &cancellable)
    }
    
}
