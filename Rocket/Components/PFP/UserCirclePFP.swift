//
//  StudentCirclePFP.swift
//  Rocket
//
//  Created by Manu on 2024-02-02.
//

import SwiftUI

struct StudentCirclePFP: View {
    var body: some View {
        Image("student2")
            .resizable()
            .scaledToFill()
            .frame(width: 62, height: 62)
            .clipShape(Circle())
    }
}

struct TeacherCirclePFP: View {
    let imageURL: String?
    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
        } placeholder: {
            UserIconPlaceholder()
        }
           
    }
}

#Preview {
    TeacherCirclePFP(imageURL:  "https://c4.wallpaperflare.com/wallpaper/787/88/904/raiden-shogun-genshin-impact-genshin-impact-baal-hd-wallpaper-preview.jpg")
}
