//
//  CustomAlert.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/5.
//

import SwiftUI

struct CustomAlert: View {
    
    @Binding var show : Bool
    @Binding var navigate: Bool
    
    var body: some View {
            if show {
                ZStack{
                    Rectangle()
                        .fill(.gray.opacity(0.3))
                        .ignoresSafeArea(.all)
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(hue: 1.0, saturation: 0.61, brightness: 0.856))
                        
                        VStack(alignment:.center){
                            
                            Rectangle()
                                .fill(.gray.opacity(0.0))
                                .frame(height: 3)
                            
                            Image(systemName: "mug.fill")
                                .resizable()
                                .frame(width: 50, height:50)
                                .foregroundColor(.white)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.0))
                                .frame(height: 3)
                            
                            Text("Drink saved!")
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                            
                            Rectangle()
                                .fill(.gray.opacity(0.0))
                                .frame(height: 3)
                            
                            Button {
                                navigate = true
                                show = false
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.018, brightness: 0.916))
                                    Text("Back to home")
                                        .foregroundStyle(.gray)
                                        .font(Font.custom("Montserrat-SemiBold", size: 16))
                                }
                            }
                            .frame(width: 140, height: 25)
                        }
                    }
                    .frame(width: 170, height: 180)
            }
        }
    }
}

#Preview {
    CustomAlert(show: .constant(true), navigate: .constant(false))
}
