//
//  SignInViewModel.swift
//  Rocket
//
//  Created by Manu on 2024-02-17.
//

import Foundation
import GoogleSignIn
import Combine

class SignInViewModel: ObservableObject {
    @Published var error : ReqError?
    
    
    var cancellable    =  Set<AnyCancellable>()
    static let shared  =  SignInViewModel()
    
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
                
                guard let user = user else {return}
                
                guard let tokenString = user.idToken?.tokenString else {return}
                
                BackendManager.shared.singInReq(withToken: tokenString)
                
                
            })
            
        }
        
    }
    
    
}
