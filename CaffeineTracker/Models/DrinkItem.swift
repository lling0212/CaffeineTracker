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
    var caffeineAmt: Int
    // how to make this auto
    var time: TimeInterval
    
    // need to add mutating functions to be able edit each item
    
    
    
}
