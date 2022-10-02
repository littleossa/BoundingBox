//
//  BoundingBox.swift
//  BoundingBox
//

import SwiftUI

// MARK: - Initializer
extension BoundingBox {
    
    init(isEditing: Binding<Bool>,
         width: Binding<CGFloat>,
         height: Binding<CGFloat>,
         position: Binding<CGPoint>,
         formType: Binding<EditFormType>,
         @ViewBuilder content: () -> Content) {
        
        _isEditing = isEditing
        _editingWidth = width
        _editingHeight = height
        _editingPosition = position
        _formType = formType
        self.content = content()
    }
}

struct BoundingBox<Content: View>: View {
    
    @Binding var isEditing: Bool
    @Binding var editingWidth: CGFloat
    @Binding var editingHeight: CGFloat
    @Binding var editingPosition: CGPoint
    @Binding var formType: EditFormType
    let content: Content
    
    private let minScalingWidth: CGFloat = 10
    private let minScalingHeight: CGFloat = 10
    
    private var dragGesture: some Gesture {
        DragGesture().onChanged { value in
            editingPosition = value.location
        }
    }
    
    var body: some View {
        
        ZStack {
            
            if isEditing {
                
                ZStack {
                    
                    MovingDashFramedRectangle()
                    
                    EditPointsFramedRectangle(width: editingWidth,
                                              height: editingHeight) { value in
                        
                        switch formType {
                        case .freeForm:
                            guard editingWidth + value.scaleSize.width > minScalingWidth,
                                  editingHeight + value.scaleSize.height > minScalingHeight
                            else { return }
                            
                            editingWidth += value.scaleSize.width
                            editingHeight += value.scaleSize.height
                            
                        case .uniform:
                            guard editingWidth + value.scaleValue > minScalingWidth,
                                  editingHeight + value.scaleValue > minScalingHeight
                            else { return }
                            
                            editingWidth += value.scaleValue
                            editingHeight += value.scaleValue
                        }
                    }

                    content
                }
                .frame(width: editingWidth,
                       height: editingHeight)
                .position(editingPosition)
                .gesture(dragGesture)
                
            } else {
                
                content
                    .frame(width: editingWidth,
                           height: editingHeight)
                    .position(editingPosition)
            }
        }
    }
}

struct BoundingBox_Previews: PreviewProvider {
    static var previews: some View {
        BoundingBox(isEditing: .constant(true),
                    editingWidth: .constant(100),
                    editingHeight: .constant(100),
                    editingPosition: .constant(CGPoint(x: 100,
                                                       y: 100)),
                    formType: .constant(.freeForm), content: Image(systemName: "circle")
            .resizable()
        )
    }
}
