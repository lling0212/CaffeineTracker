//
//  AccountView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/11/7.
//

import SwiftUI

struct AccountView: View {
    
    
    init() {
        UITabBar.appearance().isHidden = true
        
    }
    
    @State var selectedTab: String = "heart"
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab){
                
                SummaryView()
                    .tag("heart")
                
                CalendarView()
                    .tag("calendar")
                
                JournalView()
                    .tag("photo.on.rectangle")
                
                ProfileView()
                    .tag("person.crop.square")
                
            }
            CustomtabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    AccountView()
}
