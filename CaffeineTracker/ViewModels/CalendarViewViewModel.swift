//
//  CalendarViewViewModel.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation
import FirebaseFirestore

class CalendarViewViewModel: ObservableObject {
    private let userid: String
    @Published var currentDate: Date = Date()
    @Published var dayDrinks: [DrinkItem] = []
    @Published var monthDrinks: [DrinkItem] = []
    @Published var drinkDates: [String] = []
    
    init(userid: String) {
        self.userid = userid
    }
    
    func fetchData(currentMonth: Int) async throws {
        
        let range = getTimeIntervalRangeForCurrentMonth(currentMonth: currentMonth)
        
        let db = Firestore.firestore()
        let query = db.collection("users")
            .document(userid)
            .collection("drinks")
            .whereField("time", isGreaterThanOrEqualTo: range.0)
            .whereField("time", isLessThanOrEqualTo: range.1)
        
        do {
            let querySnapshot = try await query.getDocuments()
            let documents = querySnapshot.documents
            
            for document in documents {
                let data = document.data()
                let id = data["id"] as? String ?? ""
                let name = data["drinkName"] as? String ?? ""
                let drinkImage = data["drinkImage"] as? String ?? "Custom"
                let amt = data["drinkAmt"] as? Int ?? 0
                let caffeine = data["caffeineAmt"] as? Int ?? 0
                let mytime = data["time"] as? TimeInterval ?? Date().timeIntervalSince1970
                let mydate = data["date"] as? String ?? ""
                drinkDates.append(mydate)
                monthDrinks.append(DrinkItem(id: id, drinkName: name, drinkImage: drinkImage, drinkAmt: amt, caffeineAmt: caffeine, time: mytime, date: mydate))
                
            }
        } catch {
            print("Error loading data")
        }
        
        getDayDrinks()
    }
    
    func getDayDrinks() {
        dayDrinks = []
        let selectedDate = dateToString(date: currentDate)
        for drink in monthDrinks {
            if drink.date == selectedDate {
                dayDrinks.append(drink)
            }
        }
    }
    
    func dayExists(date: Date) -> Bool {
        let selectedDate = dateToString(date: date)
        return drinkDates.contains(selectedDate)
    }
    
    func dateToString(date: Date) -> (String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yy"
        return dateFormatter.string(from: date)
    }
    
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func yearMonth(currentMonth: Int)->String {
        let calendar = Calendar.current
        let adjusted = calendar.date(byAdding: .month, value: currentMonth, to: Date())
        
        if let adjusted = adjusted {
            let month = calendar.component(.month, from: adjusted) - 1
            let year = calendar.component(.year, from: adjusted)
            
            return calendar.monthSymbols[month] + " \(year)"
        } else {
            print("Error displaying month and year")
            return ""
        }
    }
    
    func getCurrentMonth(currentMonth: Int)->Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func getTimeIntervalRangeForCurrentMonth(currentMonth: Int) -> (TimeInterval, TimeInterval) {
        let currentDate = Date()
        let calendar = Calendar.current
        let adjusted = calendar.date(byAdding: .month, value: currentMonth, to: currentDate)

        if let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: adjusted!)) {
            if let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth) {
                let startTimeInterval = startOfMonth.timeIntervalSince1970
                let endTimeInterval = endOfMonth.timeIntervalSince1970 + 86399 // Adjust for the end of the day
//                print("startOfMonth", startOfMonth)
//                print(startTimeInterval)
//                print("EndOfMonth", endOfMonth)
//                print(endTimeInterval)
                return (startTimeInterval, endTimeInterval)
            }
        }
        return (0, 0)
    }

    
    func extractDate(currentMonth: Int)->[DateValue] {
//        print("current month", currentMonth)
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth(currentMonth: currentMonth)
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first!.date)
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date:Date()), at: 0)
        }
        return days
    }
    
}

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
