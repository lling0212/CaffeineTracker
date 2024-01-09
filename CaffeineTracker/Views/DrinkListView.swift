//
//  DrinkListView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI
import FirebaseFirestoreSwift

struct DrinkListView: View {
    @StateObject var viewModel: DrinkListViewViewModel
    @FirestoreQuery var drinks: [DrinkItem]
    
    init(userid: String) {
        self._viewModel = StateObject (wrappedValue:
            DrinkListViewViewModel(userid: userid)
        )
        self._drinks = FirestoreQuery(collectionPath: "users/\(userid)/drinks")
    }
    
    var body: some View {
        
            VStack {
                if viewModel.drinks.isEmpty {
                    Text("Loading...")
                } else {
                    List {
                        ForEach(viewModel.groupedDrinks.keys.sorted(), id: \.self){ date in
                            Section(header: Text(date)) {
                                ForEach(viewModel.groupedDrinks[date] ?? []) {drink in DrinkListItemView(drink: drink)}
                            }
                            
                        }
                    }
                }
                List(viewModel.drinks) { item in
                    DrinkListItemView(drink: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(drinkid:item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            //                viewModel.drinks = drinks
            //                print(drinks)
            //                print(viewModel.drinks)
            //                viewModel.updateGrouping()
            //                print(viewModel.groupedDrinks)
            //            }
    }
}

#Preview {
    DrinkListView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
}
