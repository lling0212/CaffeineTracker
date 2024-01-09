//
//  DrinkListViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class DrinkListViewViewModel: ObservableObject {
    private let userid: String
    @FirestoreQuery var drinks: [DrinkItem] {
            didSet {
                updateGrouping()
                print(drinks)
            }
        }
    @Published var groupedDrinks: [String: [DrinkItem]]
    @Published var dateHeaders: [String]
    
    init(userid: String) {
        self.userid = userid
        self._drinks = FirestoreQuery(collectionPath: "users/\(userid)/drinks")
        self.groupedDrinks = [:]
        self.dateHeaders = []
    }
    
    func delete(drinkid: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userid)
            .collection("drinks")
            .document(drinkid)
            .delete()
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    
    func updateGrouping() {
        let groupedDictionary = Dictionary(grouping: drinks) { drink in
                    // Format the date as needed
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    return dateFormatter.string(from:Date(timeIntervalSince1970: drink.time))
                }
        groupedDrinks = Dictionary(uniqueKeysWithValues: groupedDictionary.sorted { $0.key < $1.key })
//        print(drinks)
        print(groupedDrinks)
//        dateHeaders = Array(Set(drinks.map {$0.time})).sorted(by: >)
    }
    
}
