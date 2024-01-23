//
//  SummaryView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import SwiftUI

struct SummaryView: View {
    @StateObject var viewModel: SummaryViewViewModel
    
    init(userid: String) {
        self._viewModel = StateObject (wrappedValue:
                                        SummaryViewViewModel(userid: userid)
        )
    }
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                
                Rectangle()
                    .fill(.white.opacity(0))
                    .frame(height:10)
                
                HStack {
                    Text("Caffeine Summary")
                        .font(Font.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(.black)
                        .frame(width: 330, height:10, alignment: .leading)
                        .offset(x: 30)
                    
                    Button{
                        Task {
                            do {
                                try await viewModel.fetchData()
                            } catch {
                                print("Error")
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .frame(width: 18, height: 20)
                            .foregroundColor(.black)
                    }
                }
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height:10)
                
                HStack{
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916))
                            .ignoresSafeArea(.all)
                            .frame(width: 350, height: 330)
                        
                        VStack {
                            Text(viewModel.weekDays[6] + ", " + viewModel.weekDates[6])
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.black)
                                .frame(height:10)
                            
                            Rectangle()
                                .fill(.white.opacity(0.0))
                                .frame(height: 10)
                            
                            ZStack {
                                ProgressBarView(
                                    ringWidth: 25,
                                    percent: viewModel.todayPercent,
                                    backgroundColor: Color(hue: 1.0, saturation: 0.61, brightness: 0.856).opacity(0.1),
                                    foregroundColor: Color(hue: 1.0, saturation: 0.61, brightness: 0.856)
                                )
                                .frame(width: 210, height: 210)
                                
                                Text(String(format: "%.0f", viewModel.weekSums[6]) + " of 400 mg consumed today")
                                    .font(Font.custom("Montserrat-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                            }
                            
                            Rectangle()
                                .fill(.white.opacity(0.0))
                                .frame(height: 5)
                            
                            Text("The U.S. FDA considers 400 milligrams  a safe amount of caffeine for healthy adults to consume daily.")
                                .font(Font.custom("Montserrat-Regular", size: 10))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .frame(width: 300, alignment: .center)
                        }
                    }
                    Spacer()
                }
                
                Rectangle()
                    .fill(Color(red: 0.96, green: 0.96, blue: 0.95, opacity: 1.0))
                    .ignoresSafeArea(.all)
                    .frame(height:5)
                
                HStack{
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(hue: 1.0, saturation: 0.018, brightness: 0.916))
                            .ignoresSafeArea(.all)
                            .frame(width: 350, height: 270)
                        
                        VStack{
                            
                            Text("Previous Week")
                                .font(Font.custom("Montserrat-Regular", size: 16))
                                .foregroundColor(.black)
                                .frame(height:20)
                            
                            Text(viewModel.weekDates[0] + " - " + viewModel.weekDates[6])
                                .font(Font.custom("Montserrat-Regular", size: 10))
                            
                            Rectangle()
                                .fill(.white.opacity(0.0))
                                .frame(height: 5)
                            
                            WeeklyBarView(barWidth: 20,
                                          barheight: 140,
                                          backgroundColor: Color(hue: 1.0, saturation: 0.61, brightness: 0.856).opacity(0.1),
                                          foregroundColor:Color(hue: 1.0, saturation: 0.412, brightness: 0.72),
                                          selectedColor: Color(hue: 1.0, saturation: 0.61, brightness: 0.856),
                                          days: viewModel.weekDays,
                                          sums: viewModel.weekSums)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }.onAppear{
            Task {
                do {
                    try await viewModel.fetchData()
                } catch {
                    print("Error")
                }
            }
        }
    }
}

#Preview {
    SummaryView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
}
