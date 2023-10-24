//
//  ContentView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
//                .font(.mySystemFont(ofSize: 16))
//                .bold()
            
        }
        .padding()
    }
    
    
    
    init() {
        for name in UIFont.familyNames {
            print(name)
            
            for fontName in UIFont.fontNames(forFamilyName: name) {
                
                print("-- \(fontName)")
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
