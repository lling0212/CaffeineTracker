//
//  DrinkViewProduction.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import Foundation
import SwiftUI

class DrinkViewProduction {
    static func setViewForDestination (_ destination: DrinkNavigation) -> AnyView {
        switch destination {
        case .drinkItems:
            return AnyView(AddDrinkView())
        }
    }
}
