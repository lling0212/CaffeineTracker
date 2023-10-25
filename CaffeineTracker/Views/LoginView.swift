//
//  LoginView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading) {
            
            Form {
                
                // fix font
                // add header graphics
                // replace w defined textfield structs
                
                HeaderView(title: "Login",
                           subtitle: "Login to continue using the app")
                .listRowSeparator(.hidden)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("EMAIL")
                        .foregroundColor(.black)
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    TextField("Enter your email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                }
                .listRowSeparator(.hidden)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("PASSWORD")
                        .foregroundColor(.black)
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    SecureField("Enter your password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                }
                .listRowSeparator(.hidden)
                
                
                Spacer()
                    .listRowSeparator(.hidden)
                
                StyledButton(title: "Login", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    
                }
                
                
                
            }
            .foregroundColor(.gray)
            .scrollContentBackground(.hidden)
            .padding(.bottom, 20)
            
            
        }
    }
    
}


#Preview {
    LoginView()
}
