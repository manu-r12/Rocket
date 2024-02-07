

import Foundation

import GoogleSignIn

enum LoginErrors: Codable {
    case SignInError
    case SignOutError
}


class GoogleAuthentication : ObservableObject {
    
    @Published var currentUser: GIDGoogleUser?
    @Published var userIdToken:GIDToken?
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
 
    
    static let shared = GoogleAuthentication()
    
    
    init(){
        self.validate()
        if let profile = currentUser?.profile {
            print("The Profile Info", profile)
        }
    }
    
    
    
    func checkUserStatus() {
        
        if(GIDSignIn.sharedInstance.currentUser != nil ){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user  = user else {return}
            userIdToken = user.idToken
            currentUser = user
            
            
        }else{
           
            print("Error in signing in")
        }
    }
    
    
    func validate(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                print(error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
            
            
            
            self.checkUserStatus()
        }
    }
    
    @MainActor
    func signIn(){
        // getting the rootview controller
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
       
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            if let error = error{
                print(error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
            result?.user.refreshTokensIfNeeded(completion: { user, error in
                if let error = error {
                    print("Error in GIDSign In", error.localizedDescription)
                }
            
            
            })
            
            self.checkUserStatus()
        }
    }
    
    
    func signOut(){
           GIDSignIn.sharedInstance.signOut()
           self.checkUserStatus()
       }
    
    
    
}
