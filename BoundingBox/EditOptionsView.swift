//
//  EditOptionsView.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/11.
//

import SwiftUI

struct EditOptionsView: View {
    
    @Binding var formType: EditFormType
    
    var body: some View {
        
        GeometryReader { proxy in
            
            VStack {
                Spacer()
                
                //                Rectangle()
                //                    .frame(width: proxy.size.width, height: 100)
                
                Picker("", selection: $formType) {
                    ForEach(EditFormType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("左右反転").font(.system(size: 10))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "arrow.up.and.down.righttriangle.up.righttriangle.down.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("上下反転").font(.system(size: 10))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "rotate.right.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("45°回転").font(.system(size: 10))
                    }
                    
                    Spacer()
                    
                    VStack {
                        TextField("width", text: .constant(""))
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 25)
                        Text("Width").font(.system(size: 10))
                    }
                    
                    Spacer()
                    
                    VStack {
                        TextField("height", text: .constant(""))
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 25)
                        Text("height").font(.system(size: 10))
                    }
                }
                .padding()
            }
        }
    }
}

//struct EditOptionsView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        EditOptionsView(formType: .constant(.freeForm))
//    }
//}
