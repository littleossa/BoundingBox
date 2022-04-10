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
    var isFreeForm = false
    private let content: Content
    
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
            
            EditPointsView { value in
                if isFreeForm {
                    editingWidth += value.scaleSize.width
                    editingHeight += value.scaleSize.height
                } else {
                    editingWidth += value.scaleValue
                    editingHeight += value.scaleValue
                }
            }
            content
                .frame(width: editingWidth, height: editingHeight)
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
