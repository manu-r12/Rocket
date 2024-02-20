

import Foundation
import GoogleSignIn
import Combine
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var selectedRole : RoleSelection = .nothingSelected
    @Published var currentUser  : GIDGoogleUser?
    @Published var userData     : User?
    @Published var error        : ReqError?
    
    
    
    var cancellable    =  Set<AnyCancellable>()
    static let shared  =  SignUpViewModel()
    
    init(){
        googelUserSubscriber()
        userDataSubscriber()
    }
    
    
    func userDataSubscriber(){
        
        BackendManager.shared.$user.sink { user in
            self.userData = user
            print(" Debug:: Found the change in User Data from Backend")
            print(self.userData)
        }.store(in: &cancellable)
        
    }
    
    
    
    func googelUserSubscriber(){
        
        SocialAuthentication.shared.$currentUser.sink { user in
            self.currentUser = user
        }.store(in: &cancellable)
        
    }
    
    
    
    //MARK: Sign up req to backend
    @MainActor
    func signUp() async {
        guard let tokenString = currentUser?.idToken?.tokenString else {
            print("Debug: No Token")
            return }
        
        do{
            
            let data = SignUpReq(idToken: tokenString, role: selectedRole == .teacher ? "Teacher" : "Student")
            try await BackendManager.shared.createUser(withSignUpReq: data)
            
        }catch {
            
            print(error.localizedDescription)
            
        }
        
        
    }
    
    
}
