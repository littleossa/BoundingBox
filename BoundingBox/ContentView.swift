//
//  ContentView.swift
//  BoundingBox
//

import SwiftUI

struct ContentView: View {
    
    @State private var isEditing = true
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 150
    @State private var location: CGPoint = CGPoint(x: 150, y: 100)
    @State private var formType: EditFormType = .freeForm
    
    var body: some View {
        VStack {
            
            BoundingBox(isEditing: $isEditing,
                        width: $width,
                        height: $height,
                        position: $location,
                        formType: $formType) {
                Image(systemName: "circle")
                    .resizable()
            }
            
            HStack {
                Button {
                    formType = formType == .freeForm ? .uniform : .freeForm
                } label: {
                    Text(formType.rawValue)
                }
                
                Button {
                    isEditing.toggle()
                } label: {
                    Text("isEditing")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
