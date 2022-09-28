//
//  BoundingBox.swift
//  BoundingBox
//

import SwiftUI

// MARK: - Initializer
extension BoundingBox {
    
    init(width: Binding<CGFloat>,
         height: Binding<CGFloat>,
         position: Binding<CGPoint>,
         formType: Binding<EditFormType>,
         @ViewBuilder content: () -> Content) {
        
        _editingWidth = width
        _editingHeight = height
        _editingPosition = position
        _formType = formType
        self.content = content()
    }
}

struct BoundingBox<Content: View>: View {
    
    @Binding var editingWidth: CGFloat
    @Binding var editingHeight: CGFloat
    @Binding var editingPosition: CGPoint
    @Binding var formType: EditFormType
    let content: Content
    
    private var dragGesture: some Gesture {
        DragGesture().onChanged { value in
            editingPosition = value.location
        }
    }
    
    var body: some View {
        
        ZStack {
            
            MovingDashFramedRectangle()
            
            BoundingBoxPins { value in
                
                switch formType {
                case .freeForm:
                    guard editingWidth + value.scaleSize.width > 0,
                          editingHeight + value.scaleSize.height > 0
                    else { return }
                    
                    editingWidth += value.scaleSize.width
                    editingHeight += value.scaleSize.height
                    
                case .uniform:
                    guard editingWidth + value.scaleValue > 0,
                          editingHeight + value.scaleValue > 0
                    else { return }
                    
                    editingWidth += value.scaleValue
                    editingHeight += value.scaleValue
                }
            }
            content
        }
        .frame(width: editingWidth, height: editingHeight)
        .position(editingPosition)
        .gesture(dragGesture)
    }
}
