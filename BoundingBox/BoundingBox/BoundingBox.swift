//
//  BoundingBox.swift
//  BoundingBox
//

import SwiftUI

// MARK: - Initializer
extension BoundingBox {
    
    init(formType: EditFormType,
         isEditing: Bool,
         editingWidth: Binding<CGFloat>,
         editingHeight: Binding<CGFloat>,
         position: Binding<CGPoint>,
         @ViewBuilder content: () -> Content) {
        
        _editingWidth = editingWidth
        _editingHeight = editingHeight
        _editingPosition = position
        self.formType = formType
        self.isEditing = isEditing

        self.content = content()
    }
}

struct BoundingBox<Content: View>: View {
    
    @Binding var editingWidth: CGFloat
    @Binding var editingHeight: CGFloat
    @Binding var editingPosition: CGPoint
    let formType: EditFormType
    let isEditing: Bool
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
                
                content
                    .overlay {
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
        BoundingBox(formType: .freeForm,
                    isEditing: true,
                    editingWidth: .constant(100),
                    editingHeight: .constant(100),
                    position: .constant(CGPoint(x: 100,
                                                y: 100))) {
            Image(systemName: "circle")
                .resizable()
        }
    }
}
