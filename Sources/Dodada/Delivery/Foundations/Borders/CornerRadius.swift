//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/04/24.
//

import Foundation

public enum CornerRadius: CGFloat {
    case small = 4
    case regular = 8
    case large = 16
    case extraLarge = 100
}

public enum BorderStroke: CGFloat {
    case regular = 1
}


public extension CGFloat {
    static let smallCornerRadius = CornerRadius.small.rawValue
    static let regularCornerRadius = CornerRadius.regular.rawValue
    static let xLargeCornerRadius = CornerRadius.extraLarge.rawValue
    
    static let regularBorderWidth = BorderStroke.regular.rawValue
}
