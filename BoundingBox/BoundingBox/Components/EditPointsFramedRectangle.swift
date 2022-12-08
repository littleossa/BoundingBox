//
//  EditingPointsView.swift
//  BoundingBox
//

import SwiftUI

struct EditPointsFramedRectangle: View {
    
    let width: CGFloat
    let height: CGFloat
    let scaleChangeAction: (_ value: EditPointScaling.Value) -> Void
    
    var body: some View {
        
        ZStack {
            
            ForEach(EditPointPosition.allCases) { position in
                EditPoint(editingWidth: width,
                          editingHeight: height,
                          position: position) { value in
                    scaleChangeAction(value)
                }
            }
        }
    }
}

struct BoundingBoxPins_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MovingDashFramedRectangle()
                .frame(width: 100, height: 100)
            EditPointsFramedRectangle(width: 100, height: 100) { _ in}
        }
    }
}
