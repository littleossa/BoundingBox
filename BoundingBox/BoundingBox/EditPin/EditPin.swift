//
//  EditPoint.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/08.
//

import SwiftUI

struct EditPin: View {
    
    let dragOnChangeHandler: (_ value: DragGesture.Value) -> Void
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                dragOnChangeHandler(value)
            }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .shadow(radius: 1)
                .frame(width: 10, height: 10)
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: 6, height: 6)
        }
        .gesture(dragGesture)
    }
}

struct EditPoint_Previews: PreviewProvider {
    static var previews: some View {
        EditPin {_ in}
    }
}
