//
//  EditPointPosition.swift
//  BoundingBox
//

import SwiftUI

enum EditPointPosition {
    case topLeft
    case topCenter
    case topRight
    case middleLeft
    case middleRight
    case bottomLeft
    case bottomCenter
    case bottomRight
    
    var alignment: Alignment {
        switch self {
        case .topLeft:
            return .topLeading
        case .topCenter:
            return .top
        case .topRight:
            return .topTrailing
        case .middleLeft:
            return .leading
        case .middleRight:
            return .trailing
        case .bottomLeft:
            return .bottomLeading
        case .bottomCenter:
            return .bottom
        case .bottomRight:
            return .bottomTrailing
        }
    }
    
    var offset: Offset {
        switch self {
        case .topLeft:
            return Offset(x: -5, y: -5)
        case .topCenter:
            return Offset(x: 0, y: -5)
        case .topRight:
            return Offset(x: 5, y: -5)
        case .middleLeft:
            return Offset(x: -5, y: 0)
        case .middleRight:
            return Offset(x: 5, y: 0)
        case .bottomLeft:
            return Offset(x: -5, y: 5)
        case .bottomCenter:
            return Offset(x: 0, y: 5)
        case .bottomRight:
            return Offset(x: 5, y: 5)
        }
    }
    
    struct Offset {
        let x: CGFloat
        let y: CGFloat
    }
}
