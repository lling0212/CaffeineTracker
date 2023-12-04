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
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.drinks) { drink in
                        Button {
                            drinkFlow.selectedDrink = drink
                            drinkFlow.navigateToAddDrinkView()
                        } label: {
                            HStack {
                                // button appearance
                                Text(drink.drinkImage)
                                    .font(.largeTitle)
                                VStack {
                                    Text(drink.drinkName)
                                    HStack {
                                        Text("\(drink.quantity) ml")
                                        Text("\(drink.caffeineAmt) mg")
                                    }
                                }
                                
                            }
                        }.buttonStyle(.plain)
                    }
                }
            }.navigationDestination(for: DrinkNavigation.self) {destination in DrinkViewProduction.setViewForDestination(destination)}
        }
    }
}

#Preview {
    NewDrinkItemView(newItemPresented: .constant(true))
        .environmentObject(DrinkFlow.shared)
}
