//
//  DrinkItem.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation

struct DrinkItem: Codable, Identifiable {
    var id: String
    var drinkName: String
    let drinkImage: String
    var drinkAmt: Int
    var caffeineAmt: Int
    var time: TimeInterval
    
    // need to add mutating functions to be able edit each item
    
    
    
}
