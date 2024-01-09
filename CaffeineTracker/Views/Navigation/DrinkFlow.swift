//
//  DrinkFlow.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/6.
//

import Foundation
import SwiftUI

class DrinkFlow: ObservableObject {
    static let shared = DrinkFlow()
    
    @Published var path = NavigationPath()
    @Published var selectedDrink: DefaultDrink = DefaultDrink(drinkName: "Customize", drinkImage: "Default", quantity: 300, caffeineAmt: 0)

    func clear() {
        path = .init()
    }
    
    func navigateBackToRoot() {
        path.removeLast(path.count)
    }
    
    func backToPrevious() {
        path.removeLast()
    }
    
    func navigateToDrinkList() {
        path.append(DrinkNavigation.drinkList)
    }
    
    func navigateToDrinkView() {
        path.append(DrinkNavigation.drinkDetails)
    }

    func done() {
        path = .init()
    }
}
