//
//  BoundingBox.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/10.
//

import SwiftUI

struct BoundingBox<Content: View>: View {
    
    @Binding var editingWidth: CGFloat
    @Binding var editingHeight: CGFloat
    var content: Content
    
    init(editingWidth: Binding<CGFloat>,
         andHeight editingHeight: Binding<CGFloat>,
         @ViewBuilder _ content: () -> Content) {
        self._editingWidth = editingWidth
        self._editingHeight = editingHeight
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            MovingDashFramedRectangle()
            
            EditPointsView { scaleSize in
                editingWidth += scaleSize.width
                editingHeight += scaleSize.height
            } onEnded: { place, value in
                print(place)
            }

            content
        }
        .frame(width: editingWidth, height: editingHeight)
    }
}

struct BoundingBox_Previews: PreviewProvider {
    static var previews: some View {
        BoundingBox(editingWidth: .constant(100),
                    andHeight: .constant(100)) {
            Text("contents")
        }
    }
}
