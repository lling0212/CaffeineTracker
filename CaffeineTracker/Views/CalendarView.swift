//
//  CaldendarView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel: CalendarViewViewModel
    private var userid: String
    @State var currentMonth: Int = 0
    
    init(userid: String) {
        self.userid = userid
        self._viewModel = StateObject (wrappedValue:
                                        CalendarViewViewModel(userid: userid)
        )
    }
    
    var body: some View {
        let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        let columns = Array(repeating: GridItem(.flexible()), count: 7)
        
        ZStack {
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                .ignoresSafeArea(.all)
            
            ScrollView{
                VStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white.opacity(0))
                        .frame(height:10)
                    
                    HStack{
                        Spacer()
                        Button{
                            withAnimation{currentMonth -= 1}
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundStyle(.black)
                        }
                        Text(viewModel.yearMonth(currentMonth: currentMonth))
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                            .foregroundColor(.black)
                            .frame(width: 200, height:10)
                        Button{
                            withAnimation{currentMonth += 1}
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.title2)
                                .foregroundStyle(.black)
                        }
                        Spacer()
                    }
                    
                    Rectangle()
                        .frame(height: 5)
                        .opacity(0.0)
                    
                    HStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916))
                                .ignoresSafeArea(.all)
                                .frame(width: 350)
                            
                            VStack {
                                Rectangle()
                                    .frame(height: 10)
                                    .opacity(0.0)
                                
                                HStack {
                                    ForEach(days, id: \.self) { day in
                                        Text(day)
                                            .font(Font.custom("Montserrat-Regular", size: 16))
                                            .foregroundColor(.black)
                                            .frame(maxWidth:.infinity)
                                    }
                                }
                                
                                Rectangle()
                                    .frame(height: 5)
                                    .opacity(0.0)
                                
                                LazyVGrid(columns: columns) {
                                    ForEach(viewModel.extractDate(currentMonth: currentMonth)) { value in
                                        DayView(value: value)
                                            .onTapGesture {
                                                if value.day != -1 {
                                                    viewModel.currentDate = value.date
                                                    viewModel.getDayDrinks()
                                                }
                                            }
                                    }
                                }
                                Rectangle()
                                    .frame(height: 5)
                                    .opacity(0.0)
                            }.frame(width: 315)
                        }
                        Spacer()
                    }
                    
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 5)
                        .opacity(0.0)
                    
                    Text(viewModel.dateToString(date: viewModel.currentDate))
                        .font(Font.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(.black)
                        .offset(x: 35)
                        .frame(height: 20)
                    
                    if viewModel.dayDrinks.count == 0 {
                        Text("No drinks added for this day")
                            .font(Font.custom("Montserrat-Regular", size: 14))
                            .foregroundColor(.gray)
                            .offset(x: 35)
                            .frame(height: 20)
                    } else {
                        ForEach(viewModel.dayDrinks) { item in
                            HStack {
                                Spacer()
                                DrinkListItemView(userid: userid, drink: item)
                                    .frame(width: 330)
                                Spacer()
                            }
                        }
                        }
                    }
                }
            }
        }.onAppear{
            Task {
                do {
                    try await viewModel.fetchData(currentMonth: currentMonth)
                } catch {
                    print("Error")
                }
            }
        }
        .onChange(of: currentMonth) {
            Task {
                do {
                    try await viewModel.fetchData(currentMonth: currentMonth)
                } catch {
                    print("Error")
                }
            }
        }
        
    }
    
    
    
    @ViewBuilder
    func DayView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                ZStack {
                    if viewModel.isSameDay(date1: viewModel.currentDate, date2: value.date) {
                        Capsule()
                            .fill(Color(hue: 1.0, saturation: 0.61, brightness: 0.856).opacity(0.2))
                            .frame(width: 25, height: 50)
                    } else {
                        Capsule()
                            .opacity(0.0)
                            .frame(width: 25, height: 50)
                    }
                    
                    VStack {
                        Rectangle()
                            .frame(height: 5)
                            .opacity(0.0)
                        
                        Text("\(value.day)")
                            .font(Font.custom("Montserrat-Regular", size: 16))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        
                        Circle()
                            .fill(viewModel.dayExists(date: value.date) ? Color(hue: 1.0, saturation: 0.61, brightness: 0.856) : .white.opacity(0.0))
                            .frame(width: 5, height: 5)
                        
                        Rectangle()
                            .frame(height: 5)
                            .opacity(0.0)
                    }
                    
                    
                }
                
            } else {
                Text("")
            }
        }
    }
    
    
    
}

#Preview {
    CalendarView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
}
