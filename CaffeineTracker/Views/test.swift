//
//  test.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/12/3.
//

import SwiftUI

struct test: View {
    @StateObject private var viewModel = NewDrinkListViewViewModel()
    
    var body: some View {
        LazyVStack {
            ForEach(viewModel.drinks) { drink in
                Button {
                    
                } label: {
                    HStack {
                        // button appearance
                        Text(drink.drinkImage)
                            .font(.largeTitle)
                        VStack {
                            Text(drink.drinkName)
                            HStack {
                                Text("\(drink.quantity) ml")
                                Text("\(drink.caffeineAmt) mg")
                            }
                        }
                        
                    }
                }.buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    test()
}
