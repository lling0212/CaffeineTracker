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
    @Published var drinks: [DrinkItem]
    @Published var dateHeaders: [String]
    
    init(userid: String) {
        self.userid = userid
        self.drinks = []
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
    
    func fetchData() {
        let db = Firestore.firestore()
        
        let query = db.collection("users")
            .document(userid)
            .collection("drinks")
            .order(by: "time", descending: true)
        
        query.addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error: no documents")
                return
            }
            
            self.drinks = documents.map{ (QueryDocumentSnapshot) -> DrinkItem in
                let data = QueryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let name = data["drinkName"] as? String ?? ""
                let drinkImage = data["drinkImage"] as? String ?? "Custom"
                let amt = data["drinkAmt"] as? Int ?? 0
                let caffeine = data["caffeineAmt"] as? Int ?? 0
                let mytime = data["time"] as? TimeInterval ?? Date().timeIntervalSince1970
                let mydate = data["date"] as? String ?? ""
                return DrinkItem(id: id, drinkName: name, drinkImage: drinkImage, drinkAmt: amt, caffeineAmt: caffeine, time: mytime, date: mydate)
                
            }
        }
        
    }
    
    var groupedDrinks: [String: [DrinkItem]] {
        return Dictionary(grouping: drinks) { $0.date }
    }
    
    var sectionHeaders: [String] {
        
        let dateStrings = Array(Set(drinks.map {$0.date}))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yy"
        
        // Convert strings to dates
        let dates = dateStrings.compactMap { dateFormatter.date(from: $0) }
        
        // Sort the dates
        let sortedDates = dates.sorted(by: >)
        
        // Convert sorted dates back to strings
        let sortedDateStrings = sortedDates.map { dateFormatter.string(from: $0) }
        
        return sortedDateStrings
    }
}
