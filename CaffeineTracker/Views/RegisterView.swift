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
        VStack(alignment: .leading) {
            
            Form {
                
                // Tap to add profile photo
                // centered circle image
                
                // binding var understanding: should it always be a
                // string or be based on type of that field of the
                // data model?
                
                // fix font
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        ProfilePicView()
                    }
                    Spacer()
                }
                
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
                
                StyledButton(title: "Register", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    viewModel.register()
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
