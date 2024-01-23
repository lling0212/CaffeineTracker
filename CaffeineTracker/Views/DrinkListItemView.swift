//
//  DrinkListItemView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct DrinkListItemView: View {
    
    @State var drink : DrinkItem
    @StateObject var viewModel: DrinkListItemViewViewModel
    
    init(userid: String, drink: DrinkItem) {
        self.drink = drink
        self._viewModel = StateObject (wrappedValue:
            DrinkListItemViewViewModel(userid: userid)
        )
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yy"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        ZStack {
           
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916))
                .ignoresSafeArea(.all)
                .frame(width: 350, height: 80)
            
            VStack(alignment:.leading) {
                
                HStack {
                    
                    Image(drink.drinkImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay{
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916))
                        .frame(width: 10, height: 25)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.drinkName)
                            .font(Font.custom("Montserrat-SemiBold", size: 12))
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
                    .frame(width: 200, height: 60, alignment: .leading)
                    .offset(x:20)
                    
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Color(hue: 1.0, saturation: 0.412, brightness: 0.72))
                        .onTapGesture {
                            viewModel.delete(drinkid:drink.id)
                        }
                }
                
            }
        }
    }
}

#Preview {
    DrinkListView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
}
