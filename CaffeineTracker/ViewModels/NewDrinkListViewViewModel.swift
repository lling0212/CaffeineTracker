//
//  NewDrinkListViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import Foundation

class NewDrinkListViewViewModel: ObservableObject {
    
    @Published var drinks: [DefaultDrink]
    
    init() {
        self.drinks = [
                       DefaultDrink(drinkName: "Customize",
                                     drinkImage: "Default",
                                     quantity: 300,
                                     caffeineAmt: 0),
                       DefaultDrink(drinkName: "Coffee",
                                    drinkImage: "Coffee",
                                    quantity: 470,
                                    caffeineAmt: 310),
                       DefaultDrink(drinkName: "Decaf Coffee",
                                    drinkImage: "Decaf",
                                    quantity: 250,
                                    caffeineAmt: 5),
                       DefaultDrink(drinkName: "Green Tea",
                                    drinkImage: "GreenTea",
                                   quantity: 250,
                                   caffeineAmt: 18),
                       DefaultDrink(drinkName: "Black Tea",
                                    drinkImage: "BlackTea",
                                   quantity: 250,
                                   caffeineAmt: 45),
                       DefaultDrink(drinkName: "Coke",
                                    drinkImage: "Coke",
                                   quantity: 355,
                                   caffeineAmt: 40),
                       DefaultDrink(drinkName: "Matcha",
                                    drinkImage: "Matcha",
                                    quantity: 250,
                                   caffeineAmt: 64),
                       DefaultDrink(drinkName: "Red Bull",
                                    drinkImage: "Redbull",
                                    quantity: 350,
                                    caffeineAmt: 80)
        ]
    }
    
}
