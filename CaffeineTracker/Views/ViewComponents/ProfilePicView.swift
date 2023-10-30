//
//  ProfileView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/29.
//

import SwiftUI

struct ProfilePicView: View {
//    let image
    
    var body: some View {
        Image("coffeeinamug")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .frame(width: 125, height: 125)
    }
}

#Preview {
    ProfilePicView()
}
