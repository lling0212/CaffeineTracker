//
//  DrinkDestination.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/6.
//

import Foundation
import SwiftUI

class DrinkViewFactory {
    
    static func setViewForDestination(_ destination: DrinkNavigation) -> AnyView {
        
        switch destination {
            case .drinkList:
                return AnyView(NewDrinkListView())
            case .drinkDetails:
                return AnyView(AddDrinkView())
    //        case .drinkIngredients:
    //            return AnyView(DrinkyIngedientsView())
        }
    }
}
