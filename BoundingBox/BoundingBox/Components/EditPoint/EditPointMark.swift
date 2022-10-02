//
//  EditPointMark.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/10/03.
//

import SwiftUI

struct EditPointMark: View {
    
    let editPointFrame = EditPointFrame()
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .shadow(radius: 1)
                .frame(width: editPointFrame.outerCircleDiameter,
                       height: editPointFrame.outerCircleDiameter)
            Circle()
                .foregroundColor(.accentColor)
                .frame(width: editPointFrame.innerCircleDiameter,
                       height: editPointFrame.innerCircleDiameter)
        }
    }
}

struct EditPointMark_Previews: PreviewProvider {
    static var previews: some View {
        EditPointMark()
    }
}
