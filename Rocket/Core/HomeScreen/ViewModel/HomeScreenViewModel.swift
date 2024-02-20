import Combine
import SwiftUI
import Foundation
import GoogleSignIn


class HomeScreenViewModel: ObservableObject {
    
    
    @Published var isLoading : Bool = false
    @Published var userData: User?
    @Published var error: ReqError?
    
    
    
    func load(){
        fetchData()
    }
    
   
    
    func fetchData()  {
        print("Getting the data....")
        isLoading = true
        print(isLoading)
        BackendManager.shared.fetchDataFromBackend(for: User.self, withUrl: .getUserData) { (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.userData = data
                    print("Got The Data", data)
                    self.isLoading = false
                    print(self.isLoading)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
    
}

