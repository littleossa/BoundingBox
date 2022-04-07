//
//  MovingDashFramedRectangle.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct MovingDashFramedRectangle: View {
        
        @State private var dashPhase: CGFloat = 0
        @State private var timerCount: CGFloat = 0
        private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        var body: some View {
            Rectangle()
                .stroke(style: StrokeStyle(dash: [6, 6],
                                           dashPhase: dashPhase))
                .frame(width: 200, height: 200)
                .onReceive(timer) { _ in
                    timerCount = timerCount > 10 ? 0 : timerCount + 1
                    dashPhase = timerCount
                }
        }
}

struct MovingDashFramedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        MovingDashFramedRectangle()
    }
}
