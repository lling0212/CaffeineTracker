//
//  TextFieldView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/25.
//

import SwiftUI

struct TextFieldView: View {
    let label: String
    let sublabel: String
    @Binding var viewModField: String
    let isSecure: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(label)
//                .foregroundColor(.black)
                .font(Font.custom("Montserrat-SemiBold", size: 12))
            
            if isSecure {
                SecureField(sublabel, text: $viewModField)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 30).fill(Color(hue: 1.0, saturation: 0.003, brightness: 0.968)).frame(height: 35))
                    .autocorrectionDisabled()
                    .font(Font.custom("Montserrat-SemiBold", size: 12))
            } else {
                TextField(sublabel, text: $viewModField)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 30).fill(Color(hue: 1.0, saturation: 0.003, brightness: 0.968)).frame(height: 35))
                    .autocorrectionDisabled()
                    .font(Font.custom("Montserrat-SemiBold", size: 12))
            }
            
        }
        .listRowSeparator(.hidden)
    }
}

struct TextFieldViewPreview: View {
    @State var viewModel = RegisterViewViewModel()
    
    var body: some View {
        TextFieldView(
            label: "FIRST NAME",
            sublabel: "Enter your first name",
            viewModField: $viewModel.firstName,
            isSecure: false
        )
    }
}

#Preview {
    TextFieldViewPreview()
}
