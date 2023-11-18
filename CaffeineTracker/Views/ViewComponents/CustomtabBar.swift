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
    
    var body: some View {
        
            HStack(spacing: 0) {
                TabbarButton(animation: animation, image: "heart", selectedTab: $selectedTab)
                
                TabbarButton(animation: animation, image: "calendar", selectedTab: $selectedTab)
                
                Button(action: {
                    viewModel.showNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(.pink)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                    
                })
                .offset(y: -35)
                
                TabbarButton(animation: animation, image: "photo.on.rectangle", selectedTab: $selectedTab)
                
                TabbarButton(animation: animation, image: "person.crop.square", selectedTab: $selectedTab)
            }
            
//            .padding(.top)
            .padding(.vertical, 10)
//            .offset(y:15)
            .background(Color.white)
            
        
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
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? Color(.pink) : Color.gray.opacity(0.6))
                
                if selectedTab == image{
                    Circle()
                        .fill(.pink)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
                
            }
            .frame(maxWidth: .infinity)
            
        })
    }
}

#Preview {
    AccountView()
}
