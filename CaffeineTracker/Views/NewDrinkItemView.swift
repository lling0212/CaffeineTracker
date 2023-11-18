//
//  NewDrinkItemView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct NewDrinkItemView: View {
    @StateObject var viewModel = NewDrinkItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        Text("Add a new drink!")
    }
}

#Preview {
    NewDrinkItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in}))
}
