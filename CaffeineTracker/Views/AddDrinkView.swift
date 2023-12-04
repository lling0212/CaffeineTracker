//
//  AddDrinkView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import SwiftUI

struct AddDrinkView: View {
    
    @EnvironmentObject var drinkFlow: DrinkFlow
    
    var body: some View {
        Text(drinkFlow.selectedDrink.drinkImage)
            .font(.largeTitle)
        
        Text(drinkFlow.selectedDrink.drinkName)
        HStack {
            Text("\(drinkFlow.selectedDrink.quantity) ml")
            Text("\(drinkFlow.selectedDrink.caffeineAmt) mg")
        }
        
    }
}

#Preview {
    AddDrinkView()
}
