//
//  ContentView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 150
    @State private var formType: EditFormType = .freeForm
    @State private var isEditing = true
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Button {
                    isEditing.toggle()
                } label: {
                    Text("Edit切り替え")
                }

                Spacer()
            }
            
            BoundingBox(editingWidth: $width,
                        andHeight: $height,
            formType: $formType,
            isEditing: $isEditing) {
                Image(systemName: "circle")
                    .resizable()
            }
            
            if isEditing {
                EditOptionsView(formType: $formType)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
