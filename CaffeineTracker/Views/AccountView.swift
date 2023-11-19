//
//  AccountView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/11/7.
//

import SwiftUI

struct AccountView: View {
    
    @State var selectedTab: String = "heart"
    @StateObject var viewModel: AccountViewViewModel
    
    init() {
        UITabBar.appearance().isHidden = true
        self._viewModel = StateObject(wrappedValue: AccountViewViewModel())
    }
    
    var body: some View {
        NavigationView {
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
                
                CustomtabBar(selectedTab: $selectedTab, viewModel: viewModel)
                    
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $viewModel.showNewItemView, content : {
                NewDrinkItemView(newItemPresented: $viewModel.showNewItemView)
            })
        }
        
        
    }
}

#Preview {
    AccountView()
}
