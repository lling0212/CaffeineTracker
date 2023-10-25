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
                
                TextFieldView(
                    label: "FIRST NAME",
                    sublabel: "Enter your given name",
                    viewModField: $viewModel.firstName,
                    isSecure: false)
                
                TextFieldView(
                    label: "LAST NAME",
                    sublabel: "Enter your family name",
                    viewModField: $viewModel.lastName,
                    isSecure: false)
                
                TextFieldView(
                    label: "EMAIL",
                    sublabel: "Enter your email address",
                    viewModField: $viewModel.email,
                    isSecure: false)
                
                TextFieldView(
                    label: "CREATE PASSWORD",
                    sublabel: "Enter your password",
                    viewModField: $viewModel.password,
                    isSecure: true)
                
                TextFieldView(
                    label: "CONFIRM PASSWORD",
                    sublabel: "Re-enter your password",
                    viewModField: $viewModel.password,
                    isSecure: true)
                
                Spacer()
                    .listRowSeparator(.hidden)
                
                StyledButton(title: "Register", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    
                }
                
                
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
