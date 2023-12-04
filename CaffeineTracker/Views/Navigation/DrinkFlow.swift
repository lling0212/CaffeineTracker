//
//  DrinkFlow.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//  https://moussahellal.medium.com/navigation-in-swiftui-custom-and-complete-with-navigationstack-a12f8e8f8745

import Foundation
import SwiftUI

class DrinkFlow: ObservableObject {
    
    static let shared = DrinkFlow()
    
    @Published var path = NavigationPath()
    @Published var selectedDrink: DefaultDrink = DefaultDrink(drinkName: "", drinkImage: "", quantity: 0, caffeineAmt: 0)
    
    func clear() {
        path = .init()
    }
    
    func navigateBackToRoot() {
        path.removeLast(path.count)
    }
    
    func backToPrevious() {
        path.removeLast()
    }
    
    func navigateToAddDrinkView() {
        path.append(DrinkNavigation.drinkItems)
    }
    
    func done() {
        path = .init()
    }
    
}
