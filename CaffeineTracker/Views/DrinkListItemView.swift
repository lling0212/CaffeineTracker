//
//  DrinkListItemView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct DrinkListItemView: View {
    let drink : DrinkItem
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                .ignoresSafeArea(.all)
            
            HStack {
                
                Image(drink.drinkImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .frame(width: 10, height: 100)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(drink.drinkName)
                        .font(Font.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(.black)
                    HStack {
                        Text("\(drink.drinkAmt) ml")
                            .font(Font.custom("Montserrat-Regular", size: 10))
                            .foregroundColor(.gray)
                        Text("\(drink.caffeineAmt) mg")
                            .font(Font.custom("Montserrat-Regular", size: 10))
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 200, height: 80, alignment: .leading)
            }
        }
    }
}

#Preview {
    DrinkListItemView(drink : DrinkItem(
        id: "123",
        drinkName: "Customize",
        drinkImage: "Default",
        drinkAmt: 300,
        caffeineAmt: 0, 
        time: Date().timeIntervalSince1970))
}
