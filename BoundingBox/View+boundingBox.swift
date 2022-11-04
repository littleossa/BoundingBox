//
//  View+withBoundingBox.swift
//  BoundingBox
//

import SwiftUI

extension View {
    
    func boundingBox(formType: EditFormType,
                         isEditing: Binding<Bool>,
                         editingWidth: Binding<CGFloat>,
                         editingHeight: Binding<CGFloat>,
                         position: Binding<CGPoint>) -> some View {
        
        self.modifier(BondingBoxModifier(formType: formType,
                                         isEditing: isEditing,
                                         width: editingWidth,
                                         height: editingHeight,
                                         position: position))
    }
}

struct BondingBoxModifier: ViewModifier {
    
    let formType: EditFormType
    @Binding var isEditing: Bool
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    @Binding var position: CGPoint
    
    func body(content: Content) -> some View {
        
        BoundingBox(formType: formType,
                    isEditing: $isEditing,
                    editingWidth: $width,
                    editingHeight: $height,
                    position: $position) {
            content
        }
    }
}

