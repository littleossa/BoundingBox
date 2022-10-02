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
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .topLeft).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .topLeading)
            .offset(x: -5, y: -5)
            
            //
            // Top Center Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .topLeft).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .top)
            .offset(x: 0, y: -5)
            
            
            //
            // Top Right Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .topRight).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .topTrailing)
            .offset(x: 5, y: -5)
            
            
            //
            // Middle Left Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .middleLeft).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .leading)
            .offset(x: -5, y: 0)
            
            
            //
            // Middle Right Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .middleRight).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .trailing)
            .offset(x: 5, y: 0)
            
            //
            // Bottom Left Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .bottomLeft).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .bottomLeading)
            .offset(x: -5, y: 5)
            
            
            //
            // Bottom Center Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .bottomCenter).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .bottom)
            .offset(x: 0, y: 5)
            
            //
            // Bottom Right Edit point
            //
            EditPoint { value in
                let scalingValue = EditPointScaling(with: value.translation,
                                                    at: .bottomRight).value
                dragOnChangePinHandler(scalingValue)
            }
            .frame(width: width, height: height, alignment: .bottomTrailing)
            .offset(x: 5, y: 5)
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
