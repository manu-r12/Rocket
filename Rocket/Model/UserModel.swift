
struct User: Codable {
    let _id: String
    let uid: String
    let name: String
    let profile_picture: String
    let email : String
    let role: String
}

struct SignUpReq: Codable {
    let idToken: String
    let role: String
}


enum RoleSelection {
    case student
    case teacher
    case nothingSelected
}


