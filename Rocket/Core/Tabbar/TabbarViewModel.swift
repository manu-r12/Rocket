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
    
    init() {
            setUpSubscriber()
    }
    
    private func setUpSubscriber(){
        BackendManager.shared.$user.sink { user in
            print("======== TabbarViewModel Combine ========")
            self.user = user
        }.store(in: &cancellable)
    }
    
}
