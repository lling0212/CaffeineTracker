//
//  AddDrinkView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import SwiftUI

struct AddDrinkView: View {
    
    @State var selectedDrink: DefaultDrink
    @StateObject var viewModel: AddDrinkViewViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var navigateBack = false
    
    init(selectedDrink: DefaultDrink) {
            self._selectedDrink = State(initialValue: selectedDrink)
            self._viewModel = StateObject(wrappedValue: AddDrinkViewViewModel(selectedDrink: selectedDrink))
    }

    // add save confirmation pop up
    // add redirection to main view
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                
                VStack{
                    
                    Image(selectedDrink.drinkImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .frame(width: 280, height: 280)
                    
                    Rectangle()
                        .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                        .frame(height:20)
                    
                    VStack(alignment: .leading){
                        
                        Text("NAME")
                            .font(Font.custom("Montserrat-SemiBold", size: 15))
                        ZStack{
                            RoundedRectangle(cornerRadius: 30).fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916)).frame(width: 310, height: 35)
                                .offset(x:-6)
                            
                            TextField("", text: $viewModel.drinkName)
                                .textFieldStyle(PlainTextFieldStyle())
                                .frame(width: 300, height: 30)
                                .background(Rectangle().fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916)).frame(width: 280, height: 35))
                                .autocorrectionDisabled()
                                .font(Font.custom("Montserrat-Regular", size: 15))
                        }
                        
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(height:10)
                        
                        HStack{
                            Text("DATE")
                                .font(Font.custom("Montserrat-SemiBold", size: 15))
                            DatePicker("", selection: $viewModel.date, displayedComponents: [.date])
                                .datePickerStyle(.automatic)
                        }
                        .frame(width: 300)
                        
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(height:10)
                        
                        HStack{
                            Text("AMOUNT")
                                .font(Font.custom("Montserrat-SemiBold", size: 15))
                            Rectangle()
                                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                                .frame(height:20)
                            ZStack{
                                RoundedRectangle(cornerRadius: 30).fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916)).frame(width: 80, height: 35)
                                TextField("", value: $viewModel.drinkAmount, formatter: NumberFormatter())
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .frame(width: 50, height: 30)
                                    .background(Rectangle().fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916)).frame(width: 60, height: 35))
                                    .autocorrectionDisabled()
                                    .font(Font.custom("Montserrat-Regular", size: 15))
                                    .keyboardType(.numberPad)
                            }
                            Text("ml")
                                .font(Font.custom("Montserrat-Regular", size: 15))
                                .frame(width:30)
                        }
                        .frame(width: 300)
                        
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(height:10)
                        
                        HStack{
                            Text("CAFFEINE")
                                .font(Font.custom("Montserrat-SemiBold", size: 15))
                            Rectangle()
                                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                                .frame(height:20)
                            ZStack{
                                RoundedRectangle(cornerRadius: 30).fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916)).frame(width: 80, height: 35)
                                TextField("", value: $viewModel.caffeineAmt, formatter: NumberFormatter())
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .frame(width: 50, height: 30)
                                    .background(Rectangle().fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916)).frame(width: 60, height: 35))
                                    .autocorrectionDisabled()
                                    .font(Font.custom("Montserrat-Regular", size: 15))
                                    .keyboardType(.numberPad)
                            }
                            
                            Text("mg")
                                .font(Font.custom("Montserrat-Regular", size: 15))
                                .frame(width: 30)
                        }
                        .frame(width: 300, height: 40)
                        
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(height:10)
                        
                        Button {
                            if viewModel.canSave {
                                viewModel.save()
                            }
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.61, brightness: 0.856))
                                Text("Save")
                                    .foregroundStyle(.white)
                                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                            }
                        }
                        .frame(width: 300, height: 40)
                        
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(height:5)
                        
                        HStack{
                            Spacer()
                            Text(viewModel.errormsg)
                                .foregroundColor(.red)
                                .padding()
                                .frame(height: 20)
                                .font(Font.custom("Montserrat-Regular", size: 12))
                            Spacer()
                        }
                        .frame(height:15)
                        
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .frame(height:15)
                        
                    }
                    .frame(width:300)
                    
                }
                CustomAlert(show: $viewModel.showSavedAlert, navigate: $navigateBack)
                    .onChange(of: navigateBack) {
                        if navigateBack {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
            }
        }
    }
}

#Preview {
    AddDrinkView(selectedDrink: DefaultDrink(drinkName: "Customize", drinkImage: "Default", quantity: 300, caffeineAmt: 0))
}
