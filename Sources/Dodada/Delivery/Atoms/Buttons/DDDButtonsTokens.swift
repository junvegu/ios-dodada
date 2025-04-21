//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 13/04/24.
//

import Foundation
import SwiftUI

public enum DDDButtonDesing {
    case primary
    case secondary
    case tertiary
    case onlyIcon(inverted: Bool)
    case ghost
    case link
    
    var iconColor: Color? {
        switch self {
        case .primary:
            .white
        case .secondary:
            Asset.Colors.primary.swiftUIColor
        case .tertiary:
            Asset.Colors.primary.swiftUIColor
        case .onlyIcon(let inverted):
            inverted ? Asset.Colors.primary.swiftUIColor : Color.white
        case .link:
            Asset.Colors.primary.swiftUIColor
        case .ghost:
            Asset.Colors.black.swiftUIColor
        }
    }
    
    var gap: CGFloat {
        8
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            Asset.Colors.primary.swiftUIColor
        case .secondary:
            Color.white
        case .tertiary:
            Color.white
        case .onlyIcon(let inverted):
            inverted ? Color.white : Asset.Colors.primary.swiftUIColor 
        case .link, .ghost:
            Color.clear
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            Color.clear
        case .secondary:
            Asset.Colors.primary.swiftUIColor
        case .tertiary, .ghost:
            Color.clear
        case .onlyIcon(let inverted):
            inverted ? Asset.Colors.primary.swiftUIColor : Color.clear
        case .link:
            Color.white
        }
    }
    
    var textColor: Color {
        switch self {
        case .primary:
            Color.white
        case .secondary:
            Asset.Colors.primary.swiftUIColor
        case .tertiary:
            Asset.Colors.primary.swiftUIColor
        case .onlyIcon, .ghost:
            Color.clear
        case .link:
            Asset.Colors.primary.swiftUIColor
        }
    }
    
    var pressedColor: Color {
        switch self {
        case .primary, .secondary, .tertiary, .link:
            Asset.Colors.primary400.swiftUIColor
        case .ghost:
            Asset.Colors.secondary200.swiftUIColor
        case .onlyIcon(let inverted):
            inverted ? Asset.Colors.primary400.swiftUIColor : Color.white
        }
    }
    
    var height: CGFloat {
        switch self {
        case .primary, .secondary, .onlyIcon, .link, .ghost:
            return 48
        case .tertiary:
            return 24
        }
    }
    
    var width: CGFloat {
        switch self {
        case .primary, .secondary, .link:
            return .infinity
        case .tertiary:
            return .leastNormalMagnitude
        case .onlyIcon, .ghost:
            return 48
        }
    }
}


public enum DDDButtonStyle {
    case normal
    case hover
    case pressed
    case disable
}
