//
//  EditingPointsView.swift
//  BoundingBox
//

import SwiftUI

struct EditPointsFramedRectangle: View {
    
    let dragOnChangePinHandler: (_ value: EditPointScaling.Value) -> Void
    
    var body: some View {
        
        VStack {
            
            //
            // ⬆️ Top edit points
            //
            HStack {
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .topLeft).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .topCenter).value
                    dragOnChangePinHandler(scalingValue)
                }
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .topRight).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: -5)
            
            Spacer()
            
            //
            // ↔️ Middle edit points
            //
            HStack {
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .middleLeft).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .middleRight).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: 5, y: 0)
            }
            
            Spacer()
            
            //
            // ⬇️ Bottom Edit points
            //
            HStack {
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .bottomLeft).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .bottomCenter).value
                    dragOnChangePinHandler(scalingValue)
                }
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .bottomRight).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: 5)
        }
    }
}

struct BoundingBoxPins_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MovingDashFramedRectangle()
            EditPointsFramedRectangle { _ in}
        }
        .frame(width: 100, height: 100)
    }
}
