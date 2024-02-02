

import SwiftUI

struct ProfileHeader: View {
    let name: String
    let profile_avatar: String
    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 20){
                Image(profile_avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: -6){
                    Text("Welcome")
                        .font(.custom("Poppins-SemiBold", size: 24))
                        .foregroundStyle(.customBlue1)
                    
                    Text(name)
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundStyle(.uniBlack)
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

#Preview {
    ProfileHeader(name: "Ella Allen", profile_avatar: "teacher1")
}
