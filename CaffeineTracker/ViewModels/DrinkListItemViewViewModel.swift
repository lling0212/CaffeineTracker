//
//  DrinkListItemViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/9.
//

import Foundation
import FirebaseFirestore

class DrinkListItemViewViewModel: ObservableObject {
    private let userid: String
    
    init(userid: String) {
        self.userid = userid
    }
    
    func delete(drinkid: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userid)
            .collection("drinks")
            .document(drinkid)
            .delete()
    }
    
}
