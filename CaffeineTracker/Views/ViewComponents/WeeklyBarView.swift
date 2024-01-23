//
//  WeeklyBarView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/10.
//

import SwiftUI

struct WeeklyBarView: View {
    @State var selectedBar = 6
    private let barWidth: CGFloat
    private let barheight: CGFloat
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let selectedColor: Color
    private let days: [String]
    private let sums: [Double]
    
    init(barWidth: CGFloat, barheight: CGFloat, backgroundColor: Color, foregroundColor: Color, selectedColor: Color, days: [String], sums: [Double]) {
        self.barWidth = barWidth
        self.barheight = barheight
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.selectedColor = selectedColor
        self.days = days
        self.sums = sums
    }
    
    var body: some View {
       
        HStack {
            ForEach(0..<7) { i in
                VStack {
                    Text(String(format: "%.0f", sums[i]) + " mg")
                        .font(Font.custom("Montserrat-Regular", size: 10))
                        .foregroundStyle(selectedBar == i ? Color.black : Color.black.opacity(0.0))
                    
                    BarView(barWidth:barWidth,
                            barHeight: barheight,
                            backgroundColor: backgroundColor,
                            foregroundColor: selectedBar == i ? selectedColor : foregroundColor,
                            text: days[i],
                            sum: sums[i])
                    .onTapGesture {
                        selectedBar = i
                    }
                }
                    
                    
            }
        }
    }
}

struct BarView: View {
    private let barWidth: CGFloat
    private let barHeight: CGFloat
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let text: String
    private let sum: Double
    
    init(barWidth: CGFloat, barHeight: CGFloat, backgroundColor: Color, foregroundColor: Color, text: String, sum: Double) {
        self.barWidth = barWidth
        self.barHeight = barHeight
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.text = text
        self.sum = sum
    }
    
    var sumHeight: CGFloat {
        if sum / 400.0 >= 1 {
            return barHeight
        }
        return (sum / 400.0) * barHeight
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: barWidth, height: barHeight)
                    .foregroundStyle(backgroundColor)
                Capsule()
                    .frame(width: barWidth, height: sumHeight)
                    .foregroundStyle(foregroundColor)
            }
            Text(text).padding(.top, 8)
                .font(Font.custom("Montserrat-Regular", size: 12))
                .foregroundColor(.black)
        }.padding(.horizontal, 5)
    }
}

#Preview {
    WeeklyBarView(
        barWidth: 25,
        barheight: 150,
        backgroundColor: .green.opacity(0.2),
        foregroundColor: .green,
        selectedColor: .red,
        days: ["Su", "M", "T", "W", "Th", "F", "Sa"],
        sums: [0, 150, 300, 200, 500, 200, 80])
}
