

import Foundation
import GoogleSignIn
import Combine
import SwiftUI

class UserAuthenticationModel: ObservableObject {
    
    @Published var selectedRole : RoleSelection = .nothingSelected
    @Published var currentUser  : GIDGoogleUser?
    @Published var userData     : User?
    @Published var error        : ReqError?
    
    
    
    var cancellable    =  Set<AnyCancellable>()
    static let shared  =  UserAuthenticationModel()
    
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
    
    
    
    @MainActor
    func signIn() {
        //MARK:  google sign in process
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as?
                                              UIWindowScene)?.windows.first?.rootViewController
        else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { (result, error) in
            
            if let error = error{
                print(error.localizedDescription)
            }
            
            result?.user.refreshTokensIfNeeded(completion: { user, error in
                
                if let error = error {
                    print("Error in GIDSign In", error.localizedDescription)
                }
                
                self.currentUser = user
                guard let tokenString = self.currentUser?.idToken?.tokenString else {return}
                
                BackendManager.shared.singInReq(withToken: tokenString)
                
            })
            
        }
        
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
