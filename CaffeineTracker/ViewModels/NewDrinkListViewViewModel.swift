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
        self.drinks = [DefaultDrink(drinkName: "Decaf Coffee",
                                    drinkImage: "☕️",
                                    quantity: 350,
                                    caffeineAmt: 5),
                       DefaultDrink(drinkName: "Green Tea",
                                    drinkImage: "🍵",
                                   quantity: 300,
                                   caffeineAmt: 18),
                       DefaultDrink(drinkName: "Black Tea",
                                    drinkImage: "🫖",
                                   quantity: 300,
                                   caffeineAmt: 42),
                       DefaultDrink(drinkName: "Coke",
                                    drinkImage: "🥤",
                                   quantity: 330,
                                   caffeineAmt: 46),
                       DefaultDrink(drinkName: "Matcha",
                                    drinkImage: "🍵",
                                    quantity: 200,
                                   caffeineAmt: 64),
                       DefaultDrink(drinkName: "Red Bull",
                                    drinkImage: "⚡️",
                                    quantity: 350,
                                    caffeineAmt: 80),
                       DefaultDrink(drinkName: "Coffee",
                                    drinkImage: "☕️",
                                    quantity: 470,
                                    caffeineAmt: 310),
        ]
    }
    
}
