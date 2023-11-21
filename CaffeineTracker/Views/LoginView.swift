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
        VStack(alignment: .leading) {
            
            Form {
                
                // fix font
                // add header graphics
                // 
                
                HeaderView(title: "Login",
                           subtitle: "Login to continue using the app")
                .listRowSeparator(.hidden)
                
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
                
                Spacer()
                    .listRowSeparator(.hidden)
                
                
                StyledButton(title: "Login", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    viewModel.login()
                }
                
                
                
            }
            .foregroundColor(.gray)
            .scrollContentBackground(.hidden)
            
            
            HStack{
                Spacer()
                Text(viewModel.errormsg)
                    .foregroundColor(.red)
//                    .background(Color(.blue))
                    .padding()
                    .offset(y: -25)
                    .frame(height: 20)
                    .font(Font.custom("Montserrat-Regular", size: 12))
                Spacer()
            }
            
        }
    }
    
}


#Preview {
    LoginView()
}
