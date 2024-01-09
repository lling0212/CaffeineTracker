//
//  AddDrinkViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddDrinkViewViewModel: ObservableObject {
    
    @Published var drinkName = ""
    @Published var drinkImage = ""
    @Published var date = Date()
    @Published var drinkAmount = 0
    @Published var caffeineAmt = 0
    @Published var showSavedAlert = false
    @Published var errormsg = ""
    
//    init(selectedDrink: DefaultDrink) {
//        updateFields(with: selectedDrink)
//    }
//
//    func updateFields(with drink: DefaultDrink) {
//        drinkName = drink.drinkName
//        drinkAmount = drink.quantity
//        caffeineAmt = drink.caffeineAmt
//    }
    
    func save() {
        guard let uId = Auth.auth().currentUser?.uid else {
            errormsg = "Error when saving - please try again"
            return
        }
        
        let newId = UUID().uuidString
        let newItem = DrinkItem(id: newId,
                                drinkName: drinkName,
                                drinkImage: drinkImage,
                                drinkAmt: drinkAmount,
                                caffeineAmt: caffeineAmt,
                                time: date.timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("drinks")
            .document(newId)
            .setData(newItem.asDictionary())
        
        showSavedAlert = true
        
    }
    
    var canSave: Bool {
        guard !drinkName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errormsg = "Please fill in all fields"
            return false
        }
        
        guard drinkAmount > 0 else {
            errormsg = "Drink amount must be positive"
            return false
        }
        
        guard caffeineAmt >= 0 else {
            errormsg = "Caffeine amount must be non-negative"
            return false
        }
        
        errormsg = ""
        return true
    }
    
}
