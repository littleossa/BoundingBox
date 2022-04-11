//
//  EditingPointsView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct EditPointsView: View {
    
    private let dragOnChangePointHandler: (_ value: EditPointScaling.Value) -> Void
    
    init(onChange onChangeHandler: @escaping (_ value: EditPointScaling.Value) -> Void) {
        self.dragOnChangePointHandler = onChangeHandler
    }
    
    var body: some View {
        
        VStack {
            
            //
            // ⬆️ Top edit points
            //
            HStack {
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .topLeft).value
                    dragOnChangePointHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .topCenter).value
                    dragOnChangePointHandler(scalingValue)
                }
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .topRight).value
                    dragOnChangePointHandler(scalingValue)
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
                    dragOnChangePointHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .middleRight).value
                    dragOnChangePointHandler(scalingValue)
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
                    dragOnChangePointHandler(scalingValue)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .bottomCenter).value
                    dragOnChangePointHandler(scalingValue)
                }
                
                Spacer()
                
                EditPoint { value in
                    let scalingValue = EditPointScaling(with: value.translation,
                                                        at: .bottomRight).value
                    dragOnChangePointHandler(scalingValue)
                }
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: 5)
        }
    }
}

struct EditingPointsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MovingDashFramedRectangle()
            EditPointsView { _ in}
        }
        .frame(width: 100, height: 100)
    }
}
