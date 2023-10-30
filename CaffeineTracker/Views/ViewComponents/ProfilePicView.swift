//
//  ProfileView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/29.
//

import SwiftUI

struct ProfilePicView: View {
    let image: Image
    
    init(image: Image = Image("coffeeinamug")) {
        self.image = image
    }
    
    var body: some View {
        ZStack{
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .frame(width: 125, height: 125)
            
            Image(systemName: "pencil.circle.fill")
                .frame(width:40, height:40)
                .foregroundColor(.gray)
                .offset(x: 35, y:30)
        }
    }
}

#Preview {
    ProfilePicView()
}
