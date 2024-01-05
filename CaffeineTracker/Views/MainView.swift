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
            AccountView()
        } else {
            NavigationView {
                WelcomeView()
            }
        }
    }
}
    
    

#Preview {
    MainView()
}

// FOR LOOKING UP FONTS
// in init
//        for name in UIFont.familyNames {
//            print(name)
//            for fontName in UIFont.fontNames(forFamilyName: name) {
//                print("-- \(fontName)")
//            }
//        }
