//
//  ProfileView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    // Insert design image
                    Text("Loading profile...")
                }
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        VStack(alignment: .leading) {
            Text("My Profile")
                .font(Font.custom("Montserrat-SemiBold", size: 36))
                .foregroundColor(.black)
        }
        
        VStack{
            
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

            
            Text(user.firstName + " " + user.lastName)
                .font(Font.custom("Montserrat-Regular", size: 16))
                .foregroundColor(.black)
                .padding()
            
            
            Text("Tracking caffeine intake since: ")
                .font(Font.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.gray)
            
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                .font(Font.custom("Montserrat-Regular", size: 10))
                .foregroundColor(.black)
                .offset(y:-20)
            
            .padding()
            
            StyledButton(title: "Log Out", bg: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) {
                viewModel.logout()
            }
            .frame(width: 100)
        }
    }
    
}

#Preview {
    ProfileView()
}
