//
//  BoundingBox.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/10.
//

import SwiftUI

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
            EditPointsView()
            content
        }
        .frame(width: width, height: height)
    }
}

struct BoundingBox_Previews: PreviewProvider {
    static var previews: some View {
        BoundingBox(width: 150, height: 400) {
            Text("contents")
        }
    }
}
