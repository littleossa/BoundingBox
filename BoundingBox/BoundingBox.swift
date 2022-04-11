//
//  BoundingBox.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/10.
//

import SwiftUI

struct BoundingBox<Content: View>: View {
    
    @Binding var editingWidth: CGFloat
    @Binding var editingHeight: CGFloat
    @Binding var formType: EditFormType
    @Binding var isEditing: Bool
    private let content: Content
    
    init(editingWidth: Binding<CGFloat>,
         andHeight editingHeight: Binding<CGFloat>,
         formType: Binding<EditFormType>,
         isEditing: Binding<Bool>,
         @ViewBuilder _ content: () -> Content) {
        self._editingWidth = editingWidth
        self._editingHeight = editingHeight
        self._formType = formType
        self._isEditing = isEditing
        self.content = content()
    }
    
    var body: some View {
        
        VStack {
            
            ZStack {
                content
                
                if isEditing {
                    
                    MovingDashFramedRectangle()
                    
                    EditPointsView { value in
                        
                        switch formType {
                        case .freeForm:
                            guard editingWidth + value.scaleSize.width > 0 && editingHeight + value.scaleSize.height > 0
                            else { return }
                            
                            editingWidth += value.scaleSize.width
                            editingHeight += value.scaleSize.height
                            
                        case .uniform:
                            guard editingWidth + value.scaleValue > 0 && editingHeight + value.scaleValue > 0
                            else { return }
                            
                            editingWidth += value.scaleValue
                            editingHeight += value.scaleValue
                        }
                    }
                }
            }
            .frame(width: editingWidth, height: editingHeight)
        }
    }
}

struct BoundingBox_Previews: PreviewProvider {
    static var previews: some View {
        BoundingBox(editingWidth: .constant(100),
                    andHeight: .constant(100),
                    formType: .constant(.freeForm),
                    isEditing: .constant(true)) {
            Text("contents")
        }
    }
}
