//
//  CaffeineTrackerApp.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI
import FirebaseCore


@main
struct CaffeineTrackerApp: App {
    
    init() {
        FirebaseApp.configure()
        FontBlaster.blast() 
        
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
