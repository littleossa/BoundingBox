//
//  EditingPointsView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct EditPointsView: View {
    
    enum EditPointPlace {
        case topLeft(translation: CGSize)
        case topCenter(translation: CGSize)
        case topRight(translation: CGSize)
        case middleLeft(translation: CGSize)
        case middleRight(translation: CGSize)
        case bottomLeft(translation: CGSize)
        case bottomCenter(translation: CGSize)
        case bottomRight(translation: CGSize)
        
        var scaleSize: CGSize {
                        
            switch self {
            case .topLeft(let translation):
                return CGSize(width: translation.width * -1,
                              height: translation.height * -1)
            case .topCenter(let translation):
                return CGSize(width: 0,
                              height: translation.height * -1)
            case .topRight(let translation):
                return CGSize(width: translation.width,
                              height: translation.height * -1)
            case .middleLeft(let translation):
                return CGSize(width: translation.width * -1,
                              height: 0)
            case .middleRight(let translation):
                return CGSize(width: translation.width,
                              height: 0)
            case .bottomLeft(let translation):
                return CGSize(width: translation.width * -1,
                              height: translation.height)
            case .bottomCenter(let translation):
                return CGSize(width: 0,
                              height: translation.height)
            case .bottomRight(let translation):
                return CGSize(width: translation.width,
                              height: translation.height)
            }
        }
        
        var scaleValue: CGFloat {
                        
            switch self {
            case .topLeft, .topRight, .middleLeft, .middleRight, .bottomLeft, .bottomRight:
                return self.scaleSize.width
            case .topCenter, .bottomCenter:
                return self.scaleSize.height
            }
        }
        
        var value: EditPointPlace.Value {
            EditPointPlace.Value(scaleValue: scaleValue,
                                 scaleSize: scaleSize)
        }
        
        struct Value {
            let scaleValue: CGFloat
            let scaleSize: CGSize
        }
    }
    
    private let dragOnChangePointHandler: (_ value: EditPointPlace.Value) -> Void
    
    init(onChange onChangeHandler: @escaping (_ value: EditPointPlace.Value) -> Void) {
        self.dragOnChangePointHandler = onChangeHandler
    }
    
    var body: some View {
        
        VStack {
            
            //
            // ⬆️ Top edit points
            //
            HStack {
                EditPoint { value in
                    let editPointPlace = EditPointPlace.topLeft(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let editPointPlace = EditPointPlace.topCenter(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
                }
                
                Spacer()
                
                EditPoint { value in
                    let editPointPlace = EditPointPlace.topRight(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
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
                    let editPointPlace = EditPointPlace.middleLeft(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let editPointPlace = EditPointPlace.middleRight(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
                }
                .offset(x: 5, y: 0)
            }
            
            Spacer()
            
            //
            // ⬇️ Bottom Edit points
            //
            HStack {
                EditPoint { value in
                    let editPointPlace = EditPointPlace.bottomLeft(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
                }
                .offset(x: -5, y: 0)
                
                Spacer()
                
                EditPoint { value in
                    let editPointPlace = EditPointPlace.bottomCenter(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
                }
                
                Spacer()
                
                EditPoint { value in
                    let editPointPlace = EditPointPlace.bottomRight(translation: value.translation)
                    dragOnChangePointHandler(editPointPlace.value)
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
