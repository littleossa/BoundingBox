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
        
        func scaleSize(with translation: CGSize) -> CGSize {
                        
            print(translation)
            switch self {
            case .topLeft:
                return CGSize(width: translation.width * -1,
                              height: translation.height * -1)
            case .topCenter:
                return CGSize(width: 0,
                              height: translation.height * -1)
            case .topRight:
                return CGSize(width: translation.width,
                              height: translation.height * -1)
            case .middleLeft:
                return CGSize(width: translation.width * -1,
                              height: 0)
            case .middleRight:
                return CGSize(width: translation.width,
                              height: 0)
            case .bottomLeft:
                return CGSize(width: translation.width * -1,
                              height: translation.height)
            case .bottomCenter:
                return CGSize(width: 0,
                              height: translation.height)
            case .bottomRight:
                return CGSize(width: translation.width,
                              height: translation.height)
            }
        }
    }
    
    private let dragOnChangePointHandler: (_ scaleSize: CGSize) -> Void
    private let dragOnEndedPointHandler: (_ place: EditPointPlace, _ value: DragGesture.Value) -> Void
    
    init(onChange onChangeHandler: @escaping (_ scaleSize: CGSize) -> Void,
         onEnded onEndedHandler: @escaping (_ place: EditPointPlace,
                            _ value: DragGesture.Value) -> Void) {
        self.dragOnChangePointHandler = onChangeHandler
        self.dragOnEndedPointHandler = onEndedHandler
    }
    
    
    var body: some View {
        
        VStack {
            
            //
            // ⬆️ Top edit points
            //
            HStack {
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.topLeft.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.topLeft, value)
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.topCenter.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.topCenter, value)
                })
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.topRight.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.topRight, value)
                })
                .offset(x: 5, y: 0)
            }
            .offset(x: 0, y: -5)
            
            Spacer()
            
            //
            // ↔️ Middle edit points
            //
            HStack {
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.middleLeft.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.middleLeft, value)
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.middleRight.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.middleRight, value)
                })
                .offset(x: 5, y: 0)
            }
            
            Spacer()
            
            //
            // ⬇️ Bottom Edit points
            //
            HStack {
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.bottomLeft.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.bottomLeft, value)
                })
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.bottomCenter.scaleSize(with: value.translation))
                }, dragOnEnded: { value in
                    dragOnEndedPointHandler(EditPointPlace.bottomCenter, value)
                })
                
                Spacer()
                
                EditPoint(dragOnChange: { value in
                    dragOnChangePointHandler(EditPointPlace.bottomRight.scaleSize(with: value.translation))
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
            EditPointsView { _ in} onEnded: { _, _ in}
        }
        .frame(width: 100, height: 100)
    }
}
