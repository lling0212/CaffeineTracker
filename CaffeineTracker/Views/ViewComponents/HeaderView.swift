//
//  HeaderView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(Font.custom("Montserrat-SemiBold", size: 36))
//                .foregroundColor(.black)

            Text(subtitle)
                .font(Font.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.gray)
            
        }
        
    }
    
}

#Preview {
    HeaderView(title: "Login",
               subtitle: "Login to continue using the app")
}
