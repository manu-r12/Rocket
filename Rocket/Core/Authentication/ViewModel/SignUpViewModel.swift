import SwiftUI
import Foundation
import GoogleSignIn
import Combine


struct User: Codable {
    let id: String
    let idToken: String
    let name: String
    let profilePic: String
    let role: String
    let email : String
    
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
        // as soon as the current user variable changes this function will also trigger itself
        setUpSubscriber()
    }

    
    func setUpSubscriber(){
        GoogleAuthentication.shared.$currentUser.sink { user in
            self.currentUser = user

        }.store(in: &cancellable)
    }
    
    @MainActor
    func signUp() async {
        guard let tokenString = currentUser?.idToken?.tokenString else { 
            print("Debug: No Token")
            return }
        
        if let name = currentUser?.profile?.name, let profilePic =  currentUser?.profile?.imageURL(withDimension: 100)?.absoluteString, let email = currentUser?.profile?.email {
            do{
                let user = User(id: UUID().uuidString, idToken: tokenString, name: name, profilePic: profilePic, role: selectedRole == .teacher ? "teacher": "student", email: email)
                let result = try await signUpReq(withUser: user)
                switch result {
                case .success(let success):
                    print(success)
                    print("Hello")
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }catch {
                print(error.localizedDescription)
            }
        }
      
    }
    
    
    @MainActor
    func signUpReq(withUser user: User) async throws -> Result<Data, Error> {
        let url = URL(string: "http://localhost:8000/signUp")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        let encodedData =  try encoder.encode(user)
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




