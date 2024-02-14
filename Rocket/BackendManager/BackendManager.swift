import Foundation

enum ReqError: Error{
    case wrongURL
    case userNotFound
    case notAuthorized
}


class BackendManager: ObservableObject {
    
    @Published var user  : User?
    @Published var error : ReqError?
    
    static let shared = BackendManager()
    
    //MARK: Sign Req to backend to authenticate the user for resources
    func singInReq(withToken token: String)  {

        guard  let url = URL(string: "http://localhost:8000/signIn") else {return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let decoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: request) { data, res, error in
            
            if let error = error {
                self.error = ReqError.wrongURL
                print(error.localizedDescription)
            }
            
            if let data = data {
                do{
                    
                    self.user = try decoder.decode(User.self, from: data)
                    print("Got the data")
                    print(self.user ?? "No Data found")
                    SocialAuthentication.shared.isLoggedIn = true
                    
                }catch{
                    
                    print(error.localizedDescription)
                    
                }
            }
        }
        
        task.resume()
    }
    
    

    //MARK: Sign Up to backend to create a new user 
    
    @MainActor
    func createUser(withSignUpReq data: SignUpReq) async throws {
        
        let url = URL(string: "http://localhost:8000/signUp")
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        let encodedData =  try encoder.encode(data)
        
        request.httpBody = encodedData
        
        do {
            
            let (responseData, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                print("Response error")
                throw URLError(.badServerResponse)
             
            }
            
            let decodedData = try JSONDecoder().decode(User.self, from: responseData)
            self.user = decodedData
            SocialAuthentication.shared.isLoggedIn = true
            print("--------------- Got the data ---------------")
            print(self.user)
            
        }catch{
            
            print(error.localizedDescription)
        }
        
    }

    
}
