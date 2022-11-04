//
//  EditFormType.swift
//  BoundingBox
//

import Foundation

enum EditFormType: String, CaseIterable, Identifiable {
        
    case freeForm = "Free form"
    case uniform = "Uniform"
    
    var id: String { rawValue }
}
