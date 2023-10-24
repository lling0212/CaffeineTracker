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
                HeaderView(title: "Register",
                           subtitle: "Enter your information")
                
                Section(header: Text("First Name")
                    .font(Font.custom("Nexa-Trial-Regular", size: 12))
//                    .padding(.top, -20)
                ) {
                        TextField("Enter your first name", text: $viewModel.firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    }
                    .padding(.top, -5)
                Section(header: Text("Last Name")
                    .font(Font.custom("Nexa-Trial-Regular", size: 12))) {
                        TextField("Enter your last name", text: $viewModel.lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    }
                    .padding(.top, -5)
                Section(header: Text("Email")
                    .font(Font.custom("Nexa-Trial-Regular", size: 12))) {
                        TextField("Enter your email", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    }
                    .padding(.top, -5)
                Section(header: Text("Create a Password")
                    .font(Font.custom("Nexa-Trial-Regular", size: 12))) {
                        TextField("Enter your password", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    }
                    .padding(.top, -5)
                Section(header: Text("Confirm your Password")
                    .font(Font.custom("Nexa-Trial-Regular", size: 12))) {
                        TextField("Re-enter your password", text: $viewModel.confirmPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocorrectionDisabled()
                            .font(Font.custom("Nexa-Trial-Regular", size: 12))
                    }
                    .padding(.top, -5)
            }
            .foregroundColor(.gray)
            .scrollContentBackground(.hidden)
            .padding(.bottom, 100)
            
        }
    }
    
}


#Preview {
    RegisterView()
}
