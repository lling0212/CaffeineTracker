//
//  AddDrinkView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import SwiftUI

struct AddDrinkView: View {
    
    @State var selectedDrink: DefaultDrink
    
    var body: some View {
        
        Text(selectedDrink.drinkImage)
            .font(.largeTitle)
        
        Text(selectedDrink.drinkName)
        HStack {
            Text("\(selectedDrink.quantity) ml")
            Text("\(selectedDrink.caffeineAmt) mg")
        }
        
    }
}

//#Preview {
//    AddDrinkView(selectedDrink: DefaultDrink(drinkName: "Customize",
//                              drinkImage: "Default",
//                              quantity: 300,
//                              caffeineAmt: 0))
//}
