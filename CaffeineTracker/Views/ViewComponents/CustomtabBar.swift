//
//  CustomtabBar.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/11/7.
//

import SwiftUI

// nameSpaceID
// add action to plus button

struct CustomtabBar: View {
    @Binding var selectedTab: String
    @Namespace var animation
    @StateObject var viewModel: AccountViewViewModel
    @EnvironmentObject var drinkFlow: DrinkFlow
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                TabbarButton(animation: animation, image: "heart", selectedTab: $selectedTab)
                
                TabbarButton(animation: animation, image: "calendar", selectedTab: $selectedTab)
                
                Button(action: {
                    drinkFlow.navigateToDrinkList()
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Color(hue: 1.0, saturation: 0.61, brightness: 0.856))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                    
                })
                .offset(y: -30)
                
                TabbarButton(animation: animation, image: "list.bullet.circle", selectedTab: $selectedTab)
                
                TabbarButton(animation: animation, image: "person.crop.square", selectedTab: $selectedTab)
            }
            //            .padding(.top)
            .padding(.vertical, 5)
            .background(Color.white)
            .frame(height:95)
        }
        
    }
}

struct TabbarButton: View {
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                selectedTab = image
            }
        }, label: {
            
            VStack(spacing: 8){
                
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(selectedTab == image ? Color(Color(hue: 1.0, saturation: 0.61, brightness: 0.856)) : Color.gray.opacity(0.6))
                
                if selectedTab == image{
                    Circle()
                        .fill(Color(hue: 1.0, saturation: 0.61, brightness: 0.856))
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
                
            }
            .frame(maxWidth: .infinity)
            
        })
    }
}

#Preview {
    AccountView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
        .environmentObject(DrinkFlow.shared)
}
