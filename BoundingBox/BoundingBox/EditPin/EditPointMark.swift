//
//  EditPointMark.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/10/03.
//

import SwiftUI

struct EditPointMark: View {
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
    }
}

struct EditPointMark_Previews: PreviewProvider {
    static var previews: some View {
        EditPointMark()
    }
}
