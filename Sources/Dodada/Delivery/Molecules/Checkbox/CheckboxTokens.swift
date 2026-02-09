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
        case .active: return Color.secondaryValue500
        case .focused: return Color.secondaryValue500
        case .disabled: return Color.secondaryValue200
        case .default: return Color.secondaryValue200
        }
    }
    
    var checkmarkColor : Color {
        switch self{
        case .active: return .white
        default: return .black
        }
    }

    var checkmarkColorToken: DodadaColorToken {
        switch self {
        case .active: return .textOnPrimary
        default: return .neutralValue1000
        }
    }

    var backgroundColor: Color{
        switch self{
        case .active: return Color.secondaryValue500
        case .disabled: return Color.secondaryValue100
        default: return .clear
        }
    }
}

public enum CheckboxFilterType{
    case checkbox
    case last_results
}
