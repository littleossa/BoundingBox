//
//  ContentView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        BoundingBox(width: 150, height: 400) {
            Text("")
        }
    }
}

struct BoundingBox<Content: View>: View {
    
    let width: CGFloat
    let height: CGFloat
    var content: Content
    
    init(width: CGFloat, height: CGFloat, @ViewBuilder _ content: () -> Content) {
        self.width = width
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            MovingDashFramedRectangle()
            EditingPointsView()
            content
        }
        .frame(width: width, height: height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
