import SwiftUI
import Foundation
import GoogleSignIn
import Combine

//
//do {
//    let result =  try await signUpReq(withToken: userIdToken?.tokenString ?? "no token")
//    switch result {
//    case .success(let data):
//        print(data)
//    case .failure(let failure):
//        print(failure.localizedDescription)
//    }
//}catch {
//    print("Debug: Error In :  'func signUp()' function", error.localizedDescription)
//}


struct User: Codable {
    let id: String
    let idToken: String
    let name: String
    let profilePic: String
    let role: String
    
}

// enum for selection buttons
enum RoleSelection {
    case student
    case teacher
    case nothingSelected
}




class SignUpViewModel: ObservableObject {
    
    @Published var selectedRole: RoleSelection = .nothingSelected
    @Published var currentUser: GIDGoogleUser?
    
    var userIdToken: GIDToken?
    var cancellable = Set<AnyCancellable>()
    
    static let shared = SignUpViewModel()
    
    init(){
        setUpCombine()
    }

    
    func setUpCombine(){
        GoogleAuthentication.shared.$currentUser.sink { user in
            self.currentUser = user

        }.store(in: &cancellable)
    }
    
    @MainActor
    func signUp() async {
        guard let tokenString = currentUser?.idToken?.tokenString else { 
            print("Debug: No Token")
            return }
        do{
            let result = try await signUpReq(withToken: tokenString)
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }catch {
            print(error.localizedDescription)
        }
    }
    
    
    @MainActor
    func signUpReq(withToken token: String) async throws -> Result<Data, Error> {
        let url = URL(string: "http://localhost:8000/signUp")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encodedData = try? JSONEncoder().encode(["idToken" : token])
        request.httpBody = encodedData
        
        do {
            let (responseData, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                throw URLError(.badServerResponse)
            }
            print("GOt the data,", responseData)
            return .success(responseData)
        }catch{
            return .failure(error)
        }
        
    }
    
}




