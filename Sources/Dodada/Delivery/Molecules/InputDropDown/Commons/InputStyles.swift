//
//  InputStyles.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 18/05/25.
//
import SwiftUI

public enum InputStyles {
    case `default`, focus, error, disabled
    
    /// Color del borde basado en el estado
    public var borderColor: Color {
        switch self {
case .default: return Color.secondaryValue200
    case .focus: return Color.secondaryValue500
    case .error: return Color.errorValue500
    case .disabled: return Color.secondaryValue200
        }
    }
    
    /// Color del texto basado en el estado
    public var textColor: Color {
        self == .disabled ? Color.secondaryValue300 : Color.secondaryValue500
    }
    
    /// Estilo de fuente basado en el estado
    public var textStyle: DodadaTypographyToken {
        switch self {
        case .focus: return .bodyBold
        case .error: return .bodyBold
        case .disabled: return .bodyRegular
        case .default: return .bodyRegular
        }
    }
}
