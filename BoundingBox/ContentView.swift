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
    @State private var location: CGPoint = CGPoint(x: 150, y: 100)
    @State private var formType: EditFormType = .freeForm
    @State private var isEditing = true
    
    var dragGesture: some Gesture {
        DragGesture().onChanged { value in
            print("onChange")
            print(location)
            print(value.location)
            location = value.location
        }
    }
    
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
            
            Group {
                Image(systemName: "circle")
                    .resizable()
                    .position(location)
                
                BoundingBox(editingWidth: $width,
                            andHeight: $height,
                            location: $location,
                            formType: $formType,
                            isEditing: $isEditing)
            }
            .frame(width: width, height: height)
            .gesture(dragGesture)
            
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
