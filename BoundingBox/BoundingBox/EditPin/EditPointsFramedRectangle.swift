//
//  EditingPointsView.swift
//  BoundingBox
//

import SwiftUI

struct EditPointsFramedRectangle: View {
    
    let width: CGFloat
    let height: CGFloat
    let dragOnChangePinHandler: (_ value: EditPointScaling.Value) -> Void
    
    var body: some View {
        
        ZStack {
            
            //
            // Top Left Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .topLeft) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Top Center Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .topCenter) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Top Right Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .topRight) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Middle Left Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .middleLeft) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Middle Right Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .middleRight) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Bottom Left Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .bottomLeft) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Bottom Center Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .bottomCenter) { value in
                dragOnChangePinHandler(value)
            }
            
            //
            // Bottom Right Edit point
            //
            EditPoint(editingWidth: width,
                      editingHeight: height,
                      position: .bottomRight) { value in
                dragOnChangePinHandler(value)
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
