//
//  ContentView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            AccountView(userid: viewModel.currentUserId)
        } else {
            NavigationView {
                WelcomeView()
            }
        }
    }
}
    
    

#Preview {
    MainView()
        .environmentObject(DrinkFlow.shared)
}
