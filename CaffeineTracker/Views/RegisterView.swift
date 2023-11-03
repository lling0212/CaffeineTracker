//
//  RegisterView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI
import PhotosUI

struct RegisterView: View {
    @State var viewModel = RegisterViewViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Form {
                
                // Tap to add profile photo
                
                // binding var understanding: should it always be a
                // string or be based on type of that field of the
                // data model?
                
                // fix font
                HStack {
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
 
                                }
                            }
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
                    viewModField: $viewModel.confirmPassword,
                    isSecure: true)
                
                StyledButton(title: "Register", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                    viewModel.register()
                }
                
                
            }
            .foregroundColor(.gray)
            .scrollContentBackground(.hidden)
//            .padding(.bottom, 20)
            HStack{
                Spacer()
                Text(viewModel.userMsg)
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
    RegisterView()
}
