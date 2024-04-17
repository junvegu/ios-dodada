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
        case .link:
            Color.white
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            Color.clear
        case .secondary:
            Asset.Colors.primary.swiftUIColor
        case .tertiary:
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
        case .onlyIcon:
            Color.clear
        case .link:
            Asset.Colors.primary.swiftUIColor
        }
    }
    
    var pressedColor: Color {
        switch self {
        case .primary, .secondary, .tertiary, .link:
            Asset.Colors.primary400.swiftUIColor
        case .onlyIcon(let inverted):
            inverted ? Asset.Colors.primary400.swiftUIColor : Color.white
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .primary:
            return 100
        case .secondary:
            return 100
        case .tertiary:
            return 0
        case .onlyIcon:
            return 0
        case .link:
            return 24
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


public enum DDDButtonStyle {
    case normal
    case hover
    case pressed
    case disable
}
