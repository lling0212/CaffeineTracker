//
//  SummaryViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation
import FirebaseFirestore

class SummaryViewViewModel: ObservableObject {
    private let userid: String
    @Published var todayPercent = 0.0
    @Published var weekSums: [Double]
    @Published var weekDays: [String]
    var weekDates: [String]
    
    init(userid: String) {
        self.userid = userid
        self.weekSums = [0,0,0,0,0,0,0]
        self.weekDays = []
        self.weekDates = []
        fillDates()
    }
    
    private func dateToString(date: Date) -> (String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yy"
        return dateFormatter.string(from: date)
    }
    
    func fillDates() {
        let today = Date()
        for i in -6..<1{
            let current = Calendar.current.date(byAdding: .day, value: i, to: today)!
            weekDates.append(dateToString(date: current))
            weekDays.append(current.formatted(Date.FormatStyle().weekday()))
        }
    }
    
    
    func fetchData() async throws {
        weekSums = [0,0,0,0,0,0,0]
        let db = Firestore.firestore()
        let query = db.collection("users")
            .document(userid)
            .collection("drinks")
            .whereField("date", in: weekDates)
        
        do {
            let querySnapshot = try await query.getDocuments()
            
            for document in querySnapshot.documents {
                if let amount = document.data()["caffeineAmt"] as? Double,
                let time = document.data()["date"] as? String {
                    print(amount)
                    print(time)
                    let idx = weekDates.firstIndex(where: { $0 == time })!
                        weekSums[idx] += amount
                }
            }
            
            todayPercent = (100 * weekSums[6] / 400)
            print(todayPercent)
            
        } catch {
            print("Error loading data")
        }
    }
    
}
