//
//  WelcomeView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                
                // add header graphics
                // edit button height and spacing
                
//                Spacer()
                
                HeaderView(title: "Caffeine Tracker",
                           subtitle: "Track your daily caffeine intake!")
                .padding()
                .listRowSeparator(.hidden)
                
                
                NavigationLink(destination: LoginView()) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.61, brightness: 0.856))
                        Text("Login")
                            .foregroundStyle(.white)
                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                    }
                }
                .frame(height:45)
                .padding()
                
                NavigationLink(destination: RegisterView()) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.gray)
                        Text("Register")
                            .foregroundStyle(.white)
                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                    }
                }
                .frame(height:50)
                .padding()
                
                
            }
        }
    }
    
}

#Preview {
    WelcomeView()
}
