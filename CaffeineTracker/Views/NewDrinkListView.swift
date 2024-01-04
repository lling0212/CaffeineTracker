//
//  NewDrinkListView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct NewDrinkListView: View {
    @StateObject private var viewModel = NewDrinkListViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        NavigationView{
            ZStack {
                    Rectangle()
                        .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                        .ignoresSafeArea(.all)

                    VStack {
                        Rectangle()
                            .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                            .ignoresSafeArea(.all)
                            .frame(height:20)

                        Text("Select a new drink to record")
                            .font(Font.custom("Montserrat-SemiBold", size: 30))
                
                    ScrollView {
                        LazyVStack {
                            
                            ForEach(viewModel.drinks) { drink in
                                NavigationLink(destination: AddDrinkView(selectedDrink: drink)) {
                                    
                                        HStack {
                                            
                                            Image(drink.drinkImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Circle())
                                                .overlay{
                                                    Circle().stroke(.white, lineWidth: 4)
                                                }
                                                .frame(width: 100, height: 100)
                                            
                                            Rectangle()
                                                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                                                .frame(width: 10, height: 100)
                                            
                                            VStack(alignment: .leading, spacing: 8) {
                                                Text(drink.drinkName)
                                                    .font(Font.custom("Montserrat-SemiBold", size: 16))
                                                    .foregroundColor(.black)
                                                HStack {
                                                    Text("\(drink.quantity) ml")
                                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                                        .foregroundColor(.gray)
                                                    Text("\(drink.caffeineAmt) mg")
                                                        .font(Font.custom("Montserrat-Regular", size: 12))
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                            .frame(width: 200, height: 120, alignment: .leading)
                                        }
                                        .padding(.horizontal)
                                        .id(drink.id)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    NewDrinkListView(newItemPresented: .constant(true))
}
