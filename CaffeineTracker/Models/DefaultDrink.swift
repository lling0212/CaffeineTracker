//
//  DefaultDrink.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import Foundation

struct DefaultDrink: Identifiable, Hashable {
    
    let id = UUID()
    let drinkName: String
    let drinkImage: String
    let quantity: Int
    let caffeineAmt: Int

}
