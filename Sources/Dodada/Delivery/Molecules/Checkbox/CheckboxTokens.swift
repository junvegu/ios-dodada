//
//  CheckboxTokens.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 2/04/25.
//

import SwiftUI

public enum CheckboxType {
    case checkbox
    case radio
}

public enum CheckboxState{
    case active, focused, disabled, `default`
    
    var borderColor : Color {
        switch self{
        case .active: return Color(asset: Color.secondary500)
        case .focused: return Color(asset: Color.secondary500)
        case .disabled: return Color(asset: Color.secondary200)
        case .default: return Color(asset: Color.secondary200)
        }
    }
    
    var checkmarkColor : Color {
        switch self{
        case .active: return .white
        default: return .black
        }
    }
    
    var backgroundColor: Color{
        switch self{
        case .active: return Color(asset: Color.secondary500)
        case .disabled: return Color(asset: Color.secondary100)
        default: return .clear
        }
    }
}

public enum CheckboxFilterType{
    case checkbox
    case last_results
}
