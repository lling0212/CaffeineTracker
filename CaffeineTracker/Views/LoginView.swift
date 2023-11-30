//
//  LoginView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 350)
                        
                HeaderView(title: "Login",
                           subtitle: "Login to continue using the app")
                .offset(x:37)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 30)
                
                TextFieldView(
                    label: "Email",
                    sublabel: "Enter your email",
                    viewModField: $viewModel.email,
                    isSecure: false)
                
                TextFieldView(
                    label: "Password",
                    sublabel: "Enter your password",
                    viewModField: $viewModel.password,
                    isSecure: true)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 10)
                
                StyledButton(title: "Login", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    viewModel.login()
                }
                .offset(x: 37)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 30)
                
                HStack{
                    Spacer()
                    Text(viewModel.errormsg)
                        .foregroundColor(.red)
                        .padding()
                        .offset(y: -25)
                        .frame(height: 20)
                        .font(Font.custom("Montserrat-Regular", size: 12))
                    Spacer()
                }
                    
            }
        }
    }
    
}


#Preview {
    LoginView()
}
