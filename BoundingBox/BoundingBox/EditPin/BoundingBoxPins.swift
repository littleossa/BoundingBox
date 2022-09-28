//
//  EditingPointsView.swift
//  BoundingBox
//

import SwiftUI

struct BoundingBoxPins: View {
    
    let dragOnChangePinHandler: (_ value: EditPinScaling.Value) -> Void
    
    var body: some View {
        
        VStack {
            
            //
            // ⬆️ Top edit points
            //
            HStack {
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
                                                        at: .topLeft).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
                                                        at: .topCenter).value
                    dragOnChangePinHandler(scalingValue)
                }
                
                Spacer()
                
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
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
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
                                                        at: .middleLeft).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
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
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
                                                        at: .bottomLeft).value
                    dragOnChangePinHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
                                                        at: .bottomCenter).value
                    dragOnChangePinHandler(scalingValue)
                }
                
                Spacer()
                
                EditPin { value in
                    let scalingValue = EditPinScaling(with: value.translation,
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
            BoundingBoxPins { _ in}
        }
        .frame(width: 100, height: 100)
    }
}
