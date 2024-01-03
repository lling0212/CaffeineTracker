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
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    
                    HStack{
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(width:10)
                        Image("Square")
                            .resizable()
                            .frame(width: 350, height: 350)
                    }
                    
                    HeaderView(title: "Caffeine Tracker",
                               subtitle: "Track your daily caffeine intake!")
                    .offset(x:20)
                    
                    
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
                    .offset(y:10)
                    
                    NavigationLink(destination: RegisterView()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.gray)
                            Text("Register")
                                .foregroundStyle(.white)
                                .font(Font.custom("Montserrat-SemiBold", size: 14))
                        }
                    }
                    .frame(height:45)
                    .padding()
                    .offset(y:-10)
                    
                    Rectangle()
                        .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                        .frame(height:15)
                }
            }
        }
    }
    
}

#Preview {
    WelcomeView()
}
