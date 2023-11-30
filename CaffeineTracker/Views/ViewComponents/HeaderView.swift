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
//        ZStack{
//            Rectangle()
//                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
//                .ignoresSafeArea(.all)
            
//            VStack(alignment: .leading, spacing: 15) {
                Text(title)
                    .font(Font.custom("Montserrat-SemiBold", size: 36))
                    
                //                .foregroundColor(.black)
        
        Text("")
            .font(Font.custom("Montserrat-Regular", size: 12))
            .foregroundColor(.gray)
        
                Text(subtitle)
                    .font(Font.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(.gray)
                    
                
//            }
//        }
//            .frame(width: 300)
//            .background(.red)
    }
    
}

#Preview {
    HeaderView(title: "Login",
               subtitle: "Login to continue using the app")
}
