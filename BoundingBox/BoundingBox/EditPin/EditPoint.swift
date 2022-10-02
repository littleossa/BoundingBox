//
//  EditPoint.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct EditPoint: View {
    
    let editingWidth: CGFloat
    let editingHeight: CGFloat
    let position: EditPointPosition
    let scalingAction: (_ value: EditPointScaling.Value) -> Void
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                let editPointScaling = EditPointScaling(position: position,
                                                        dragGestureTranslation: value.translation)
                scalingAction(editPointScaling.value)
            }
    }
    
    var body: some View {
        ZStack {
            EditPointMark()
                .gesture(dragGesture)
                .offset(x: position.offset.x,
                        y: position.offset.y)
        }
        .frame(width: editingWidth,
               height: editingHeight,
               alignment: position.alignment)
    }
}

struct EditPoint_Previews: PreviewProvider {
    static var previews: some View {
        EditPoint(editingWidth: 100,
                  editingHeight: 100,
                  position: .topCenter) { _ in }
    }
}
