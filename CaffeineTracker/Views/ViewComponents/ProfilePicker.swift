//
//  PhotoPickerDemo.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/29.
// Source: https://stackoverflow.com/questions/75041939/using-imagepicker-in-swiftui
//

import PhotosUI
import SwiftUI

struct ProfilePicker: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    ProfilePicView(image: Image(uiImage: uiImage))
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

        
    }
}

#Preview {
    ProfilePicker()
}
