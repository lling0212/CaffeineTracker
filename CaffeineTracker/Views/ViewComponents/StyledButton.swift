//
//  Button.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/23.
//

import SwiftUI

struct StyledButton: View {
    let title: String
    let bg: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(bg)
                Text(title)
                    .foregroundStyle(.white)
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    
            }
            
        }
        .frame(width: 325, height: 40)
    }
}

#Preview {
    StyledButton(title: "Register", bg: .blue) {
        
    }
}
