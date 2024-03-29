

import Foundation

import GoogleSignIn

enum LoginErrors: Codable {
    case SignInError
    case SignOutError
}



class SocialAuthentication : ObservableObject {
    
    @Published var currentUser  :  GIDGoogleUser?
    @Published var userIdToken  :  GIDToken?
    @Published var errorMessage :  String = ""
    @Published var isLoggedIn   :  Bool =  false {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "UserStatus")
            UserDefaults.standard.synchronize()
        
        }
    }
    static let shared = SocialAuthentication()
    
    
    init(){
            // Load isLoggedIn value from UserDefaults during initialization
        isLoggedIn = UserDefaults.standard.bool(forKey: "UserStatus")
        self.validate()
    }
    
    

    func checkUserStatus() {
        
        if let currentUser = GIDSignIn.sharedInstance.currentUser {
              DispatchQueue.main.async {
                  self.currentUser = currentUser
                  self.userIdToken = currentUser.idToken
              }
            print("User is signed in by his google account")
          } else {
              DispatchQueue.main.async {
                  self.currentUser = nil
                  self.isLoggedIn = false
                  print("User is not signed in by his google account")
              }
          }
    }
    
    
    func validate(){
        
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            
            if let error = error {
                print("Error in validating... user if logged in or not")
                self.isLoggedIn = false
                print(error.localizedDescription)
                
                self.errorMessage = error.localizedDescription
                
            }
            
            self.checkUserStatus()
        }
    }
    
    @MainActor
    func signIn(){
        
        // getting the rootview controller
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as?
                                              UIWindowScene)?.windows.first?.rootViewController
                                              else {return}
        
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
