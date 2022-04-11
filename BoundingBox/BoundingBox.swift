//
//  BoundingBox.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/10.
//

import SwiftUI

struct BoundingBox: View {
    
    @Binding var editingWidth: CGFloat
    @Binding var editingHeight: CGFloat
    @Binding var formType: EditFormType
    @Binding var location: CGPoint
    @Binding var isEditing: Bool
    
    init(editingWidth: Binding<CGFloat>,
         andHeight editingHeight: Binding<CGFloat>,
         location: Binding<CGPoint>,
         formType: Binding<EditFormType>,
         isEditing: Binding<Bool>) {
        self._editingWidth = editingWidth
        self._editingHeight = editingHeight
        self._location = location
        self._formType = formType
        self._isEditing = isEditing
    }
    
    var body: some View {
        
        if isEditing {
            
            ZStack {
                
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
            .position(location)
        }
    }
}

struct BoundingBox_Previews: PreviewProvider {
    static var previews: some View {
        BoundingBox(editingWidth: .constant(100),
                    andHeight: .constant(100),
                    location: .constant(CGPoint(x: 100,
                                                y: 100)),
                    formType: .constant(.freeForm),
                    isEditing: .constant(true))
    }
}
