//
//  RegisterView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI
import PhotosUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var showingAlert : Bool = false
    
    // need to fix strip of white space above keyboard
    // binding var understanding: should it always be a
    // string or be based on type of that field of the
    // data model?
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 0.0) {
                HStack(spacing: 0.0) {
                    Spacer()
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            if let selectedImageData,
                               let uiImage = UIImage(data: selectedImageData) {
                                ProfilePicView(image: Image(uiImage: uiImage))
                                    .onAppear {
                                        viewModel.profilepic = uiImage
                                    }
                            } else {
                                ProfilePicView()
                            }
                        }
                        .onChange(of: selectedItem) { oldItem, newItem in
                            Task {
                                // Retrieve selected asset in the form of Data
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                    showingAlert = true
                                }
                            }
                        }
                    
                    Spacer()
                }
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 20)
                
                HeaderView(title: "Register",
                           subtitle: "Enter your information")
                .offset(x:39)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 30)
                
                TextFieldView(
                    label: "FIRST NAME",
                    sublabel: "Enter your given name",
                    viewModField: $viewModel.firstName,
                    isSecure: false)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 5)
                
                TextFieldView(
                    label: "LAST NAME",
                    sublabel: "Enter your family name",
                    viewModField: $viewModel.lastName,
                    isSecure: false)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 5)
                
                TextFieldView(
                    label: "EMAIL",
                    sublabel: "Enter your email address",
                    viewModField: $viewModel.email,
                    isSecure: false)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 5)
                
                TextFieldView(
                    label: "CREATE PASSWORD",
                    sublabel: "Enter your password",
                    viewModField: $viewModel.password,
                    isSecure: true)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 5)
                
                TextFieldView(
                    label: "CONFIRM PASSWORD",
                    sublabel: "Re-enter your password",
                    viewModField: $viewModel.confirmPassword,
                    isSecure: true)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 15)
                
                StyledButton(title: "Register", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    viewModel.register()
                }
                .offset(x:53)
                .frame(width: 300, height: 40)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height: 15)
                
                HStack(){
                    Spacer()
                    Text(viewModel.userMsg)
                        .foregroundColor(.red)
                        .padding()
                        .frame(height: 20)
                        .font(Font.custom("Montserrat-Regular", size: 12))
                    Spacer()
                }
                
            }
            
            .scrollContentBackground(.hidden)
            .alert("Do you want to use selected image as your profile?", isPresented: ($showingAlert)) {
                Button("Yes") {
                    showingAlert = false
                }
                Button("No") {
                    selectedItem = nil
                    selectedImageData = nil
                    showingAlert = false
                }
            }
        }
    }
}


#Preview {
    RegisterView()
}
