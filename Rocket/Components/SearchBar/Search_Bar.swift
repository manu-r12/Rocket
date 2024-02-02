
import SwiftUI

struct Search_Bar: View {
    @State var searchTxtField: String = ""
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 10){
                
                TextField("Search", text: $searchTxtField)
                    .font(.custom("Poppins-Medium", size: 16))
                
                Image(systemName: "magnifyingglass")
                    .imageScale(.medium)
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.white)
                    .background(LinearGradient(colors: ButtonGradients.gradient_color_purpleToblue, startPoint: .leading, endPoint: .trailing))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .fontWeight(.medium)
                
                
            }.padding()
                .frame(width: 320, height: 65)
                .background(Color(.uniWhite))
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .shadow(color: Color(.systemGray4), radius: 5, x: 0, y: 0)
        }
        .padding(.top, 8)
    }
}

#Preview {
    Search_Bar()
}
