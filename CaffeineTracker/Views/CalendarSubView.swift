//
//  CalendarSubView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/12.
//

import SwiftUI

struct CalendarSubView: View {
    @State var currentDate: Date = Date()
    @State var currentMonth: Int = 0
    
    var body: some View {
        Text("Calendar")
    }
}

#Preview {
    CalendarSubView()
}
