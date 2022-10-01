//
//  EditPointScaling.swift
//  BoundingBox
//

import CoreGraphics

struct EditPointScaling {
    
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
    
    /// which points dragged on
    let place: EditPointPlace
    /// translation of DragGesture.Value
    let dragGestureTranslation: CGSize
    
    init(with translation: CGSize, at place: EditPointPlace) {
        self.dragGestureTranslation = translation
        self.place = place
    }
    
    /// Return EditPointDragGesture.Value with DragGesture.Value.translation
    var value: EditPointScaling.Value {
        return EditPointScaling.Value(scaleValue: self.scaleValue,
                                      scaleSize: self.scaleSize)
    }
    
    /// How scale the size with the dragged edit point
    private var scaleSize: CGSize {
        
        switch place {
        case .topLeft:
            return CGSize(width: dragGestureTranslation.width * -1,
                          height: dragGestureTranslation.height * -1)
        case .topCenter:
            return CGSize(width: 0,
                          height: dragGestureTranslation.height * -1)
        case .topRight:
            return CGSize(width: dragGestureTranslation.width,
                          height: dragGestureTranslation.height * -1)
        case .middleLeft:
            return CGSize(width: dragGestureTranslation.width * -1,
                          height: 0)
        case .middleRight:
            return CGSize(width: dragGestureTranslation.width,
                          height: 0)
        case .bottomLeft:
            return CGSize(width: dragGestureTranslation.width * -1,
                          height: dragGestureTranslation.height)
        case .bottomCenter:
            return CGSize(width: 0,
                          height: dragGestureTranslation.height)
        case .bottomRight:
            return CGSize(width: dragGestureTranslation.width,
                          height: dragGestureTranslation.height)
        }
    }
    
    /// How scale the value with the dragged edit point.top center and bottom center return scaleSize height.
    private var scaleValue: CGFloat {
        
        switch place {
        case .topLeft, .topRight, .middleLeft, .middleRight, .bottomLeft, .bottomRight:
            return scaleSize.width
        case .topCenter, .bottomCenter:
            return scaleSize.height
        }
    }
    
    struct Value {
        let scaleValue: CGFloat
        let scaleSize: CGSize
    }
}
