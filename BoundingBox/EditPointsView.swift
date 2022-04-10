//
//  EditingPointsView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct EditPointsView: View {
    
    enum EditPointPlace {
        case topLeft
        case topCenter
        case topRight
        case middleLeft
        case middleRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
    
    private let dragOnChangePointHandler: (_ place: EditPointPlace, _ value: DragGesture.Value) -> Void
    private let dragOnEndedPointHandler: (_ place: EditPointPlace, _ value: DragGesture.Value) -> Void
    
    init(onChange onChangeHandler: @escaping (_ place: EditPointPlace,
                             _ value: DragGesture.Value) -> Void,
         onEnded onEndedHandler: @escaping (_ place: EditPointPlace,
                            _ value: DragGesture.Value) -> Void) {
        self.dragOnChangePointHandler = onChangeHandler
        self.dragOnEndedPointHandler = onEndedHandler
    }
    
    
    var body: some View {
        
        VStack {
            HStack {
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.topLeft, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.topLeft, value)
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.topCenter, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.topCenter, value)
                })
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.topRight, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.topRight, value)
                })
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: -5)
            
            Spacer()
            
            HStack {
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.middleLeft, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.middleLeft, value)
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.middleRight, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.middleRight, value)
                })
                .offset(x: 5, y: 0)
            }
            
            Spacer()
            
            HStack {
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.bottomLeft, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.bottomLeft, value)
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.bottomCenter, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.bottomCenter, value)
                })
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.bottomRight, value)
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.bottomRight, value)
                })
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
            EditPointsView { _, _ in} onEnded: { _, _ in}
        }
        .frame(width: 100, height: 100)
    }
}
