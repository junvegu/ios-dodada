//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 13/04/24.
//

import Foundation

public enum DDDButtonDesing {
    case primary
    case secondary
    case tertiary
    case onlyIcon
    case link
    
    var cornerRadius: CGFloat {
        switch self {
        case .primary:
            return 100
        case .secondary:
            return 100
        case .tertiary:
            return 4
        case .onlyIcon:
            return 4
        case .link:
            return 4
        }
    }
    
    var height: CGFloat {
        switch self {
        case .primary, .secondary, .tertiary, .onlyIcon, .link:
            return 48
        }
    }
    
    var width: CGFloat {
        switch self {
        case .primary, .secondary, .tertiary, .link:
            return .infinity
        case .onlyIcon:
            return 48
        }
    }
}
