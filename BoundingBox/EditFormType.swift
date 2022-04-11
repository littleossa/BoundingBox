//
//  EditFormType.swift
//  BoundingBox
//
//  Created by 平岡修 on 2022/04/11.
//

import Foundation

enum EditFormType: String, CaseIterable, Identifiable {
        
    case freeForm = "Free form"
    case uniform = "Uniform"
    
    var id: String { rawValue }
}
