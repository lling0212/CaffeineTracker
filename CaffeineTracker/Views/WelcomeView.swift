//
//  WelcomeView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
                // add header graphics
                
                HeaderView(title: "Caffeine Tracker",
                           subtitle: "Track your daily caffeine intake!")
                .padding()
                .listRowSeparator(.hidden)
                
                StyledButton(title: "Login", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    
                }
                .padding()
                
                StyledButton(title: "Register", bg: Color(.gray)) {
                    
                }
                .padding()
                
            
            
            
        }
    }
    
}

#Preview {
    WelcomeView()
}
