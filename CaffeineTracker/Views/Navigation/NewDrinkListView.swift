//
//  NewDrinkItemView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct NewDrinkItemView: View {
    @StateObject private var viewModel = NewDrinkListViewViewModel()
    @EnvironmentObject var drinkFlow: DrinkFlow
    @Binding var newItemPresented: Bool

    
    var body: some View {
        NavigationStack(path: $drinkFlow.path) {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        Text("Select a new drink to record")
                        
                        ForEach(viewModel.drinks) { drink in
                            Button {
                                drinkFlow.selectedDrink = drink
                                drinkFlow.navigateToAddDrinkView()
                            } label: {
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
                                        HStack {
                                            Text("\(drink.quantity) ml")
                                                .font(Font.custom("Montserrat-Regular", size: 12))
                                            Text("\(drink.caffeineAmt) mg")
                                                .font(Font.custom("Montserrat-Regular", size: 12))
                                        }
                                    }
                                    .frame(width: 200, height: 120, alignment: .leading)
                                }
                            }.buttonStyle(.plain)
                                .padding(.horizontal)
                        }
                    }
                }.navigationDestination(for: DrinkNavigation.self) {destination in DrinkViewProduction.setViewForDestination(destination)}
            }
        }
    }
}

#Preview {
    NewDrinkItemView(newItemPresented: .constant(true))
        .environmentObject(DrinkFlow.shared)
}
