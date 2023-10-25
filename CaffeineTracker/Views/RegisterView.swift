//
//  RegisterView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading) {
            
            Form {
                
                // Tap to add profile photo
                // centered circle image
                
                // fix font
                
                HeaderView(title: "Register",
                           subtitle: "Enter your information")
                .listRowSeparator(.hidden)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("FIRST NAME")
                        .foregroundColor(.black)
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    TextField("Enter your first name", text: $viewModel.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                }
                .listRowSeparator(.hidden)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("LAST NAME")
                        .foregroundColor(.black)
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    TextField("Enter your last name", text: $viewModel.lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                }
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
                    Text("CREATE PASSWORD")
                        .foregroundColor(.black)
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    SecureField("Enter your password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                }
                .listRowSeparator(.hidden)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("CONFIRM PASSWORD")
                        .foregroundColor(.black)
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    SecureField("Confirm your password", text: $viewModel.confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .font(Font.custom("Nexa-Trial-Regular", size: 12))
                }
                .listRowSeparator(.hidden)
                
                Spacer()
                    .listRowSeparator(.hidden)
                
                // Placeholder for button
                StyledButton(title: "Register", bg: .blue) {
                    
                }
                
                // Fix spacing
                
                
            }
            .foregroundColor(.gray)
            .scrollContentBackground(.hidden)
            .padding(.bottom, 20)
            
            
        }
    }
    
}


#Preview {
    RegisterView()
}
