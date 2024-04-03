//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/04/24.
//

import Foundation

public enum Spacing: CGFloat {
    case _3xSmall = 2
    case _2xSmall = 4
    case xSmall = 8
    case small = 12
    case medium = 16
    case xMedium = 20
    case large = 24
    case xLarge = 32
    case _2xLarge = 44
    case _3xxLarge = 60
}

public extension CGFloat {
    static let xxxSmall = Spacing._3xSmall.rawValue
    static let xxSmall = Spacing._2xSmall.rawValue
    static let xSmall = Spacing.xSmall.rawValue
    static let small = Spacing.small.rawValue
    static let medium = Spacing.medium.rawValue
    static let xMedium = Spacing.xMedium.rawValue
    static let large = Spacing.large.rawValue
    static let xLarge = Spacing.xLarge.rawValue
    static let xxLarge = Spacing._2xLarge.rawValue
    static let xxxLarge = Spacing._3xxLarge.rawValue
}
