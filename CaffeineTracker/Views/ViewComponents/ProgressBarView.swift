//
//  ProgressBarView.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2024/1/10.
//  


import SwiftUI

struct ProgressBarShape: Shape {
    static func percentToAngle(percent: Double, startAngle: Double) -> Double {
        (percent / 100 * 360) + startAngle
    }
    private var percent: Double
    private var startAngle: Double
    private let drawnClockwise: Bool
    
    // This allows animations to run smoothly for percent values
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(percent: Double = 100, startAngle: Double = -90, drawnClockwise: Bool = false) {
        self.percent = percent
        self.startAngle = startAngle
        self.drawnClockwise = drawnClockwise
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Angle(degrees: ProgressBarShape.percentToAngle(percent: self.percent, startAngle: self.startAngle))
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: endAngle, clockwise: drawnClockwise)
        }
    }
}

struct ProgressBarView: View {
    private let ringWidth: CGFloat
    private let percent: Double
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let startAngle: Double = -90
    
    private static let ShadowColor: Color = Color.black.opacity(0.2)
    private static let ShadowRadius: CGFloat = 5
    private static let ShadowOffsetMultiplier: CGFloat = ShadowRadius + 2
    
    private var absolutePercentageAngle: Double {
        ProgressBarShape.percentToAngle(percent: self.percent, startAngle: 0)
    }
    private var relativePercentageAngle: Double {
        absolutePercentageAngle + startAngle
    }
    
    init(ringWidth: CGFloat, percent: Double, backgroundColor: Color, foregroundColor: Color) {
            self.ringWidth = ringWidth
            self.percent = percent
            self.backgroundColor = backgroundColor
            self.foregroundColor = foregroundColor
    }

    var body: some View {
        GeometryReader { geometry in
          ZStack {
            
              ProgressBarShape()
                  .stroke(style: StrokeStyle(lineWidth: self.ringWidth))
                  .fill(self.backgroundColor)
            
              ProgressBarShape(percent: self.percent, startAngle: self.startAngle)
                  .stroke(style: StrokeStyle(lineWidth: self.ringWidth, lineCap: .round))
                  .fill(self.foregroundColor)
              
              Circle()
                  .fill(self.foregroundColor)
                  .frame(width: self.ringWidth, height: self.ringWidth, alignment: .center)
                  .offset(x: self.getEndCircleLocation(frame: geometry.size).0,
                      y: self.getEndCircleLocation(frame: geometry.size).1)
                  .shadow(color: ProgressBarView.ShadowColor,
                          radius: ProgressBarView.ShadowRadius,
                          x: self.getEndCircleShadowOffset().0,
                          y: self.getEndCircleShadowOffset().1)
          }
        }.padding(self.ringWidth / 2)
    }
    
    private func getEndCircleLocation(frame: CGSize) -> (CGFloat, CGFloat) {
        // Get angle of the end circle with respect to the start angle
        let angleOfEndInRadians: Double = relativePercentageAngle.toRadians()
        let offsetRadius = min(frame.width, frame.height) / 2
        return (offsetRadius * cos(angleOfEndInRadians).toCGFloat(), offsetRadius * sin(angleOfEndInRadians).toCGFloat())
    }
    
    private func getEndCircleShadowOffset() -> (CGFloat, CGFloat) {
        let angleForOffset = absolutePercentageAngle + (self.startAngle + 90)
        let angleForOffsetInRadians = angleForOffset.toRadians()
        let relativeXOffset = cos(angleForOffsetInRadians)
        let relativeYOffset = sin(angleForOffsetInRadians)
        let xOffset = relativeXOffset.toCGFloat() * ProgressBarView.ShadowOffsetMultiplier
        let yOffset = relativeYOffset.toCGFloat() * ProgressBarView.ShadowOffsetMultiplier
        return (xOffset, yOffset)
    }
    
}

#Preview {
    ProgressBarView(
        ringWidth: 30,
        percent: 5,
        backgroundColor: Color.green.opacity(0.2),
        foregroundColor: .green
    )
    .frame(width: 300, height: 300)
}
