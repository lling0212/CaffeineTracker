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
    private var userid: String
    
    
    init(userid: String) {
        self.userid = userid
        self._viewModel = StateObject (wrappedValue:
            DrinkListViewViewModel(userid: userid)
        )

    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height:10)
                
                Text("Drink Record")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                    .foregroundColor(.black)
                    .frame(height:10)
                    .offset(x: 30)
                                
                List {
                    ForEach(viewModel.sectionHeaders, id: \.self) { key in
                        VStack(alignment: .leading) {
                            Text(key)
                                .font(Font.custom("Montserrat-SemiBold", size: 12))
                                .foregroundColor(.black)
                                .offset(x: 15)
                            
                            ForEach(viewModel.groupedDrinks[key]!) { item in
                                
                                DrinkListItemView(userid: userid, drink: item)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                                
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    }
                }.listStyle(PlainListStyle())
            }
            
        }.onAppear{viewModel.fetchData()}
    }
}

#Preview {
    DrinkListView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
}
