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
        case .default: return Color(asset: Color.secondary200)
        case .focus: return Color(asset: Color.secondary500)
        case .error: return Color(asset: Color.error)
        case .disabled: return Color(asset: Color.secondary200)
        }
    }
    
    /// Color del texto basado en el estado
    public var textColor: Color {
        self == .disabled ? Color(asset: Color.secondary300) : Color(asset: Color.secondary500)
    }
    
    /// Estilo de fuente basado en el estado
    public var textStyle: (token: DDDFontToken, weight: DDDFontToken.Weigth) {
        switch self {
        case .focus: return (.body, .bold)
        case .error: return (.body, .bold)
        case .disabled: return (.body, .regular)
        case .default: return (.body, .regular)
        }
    }
}
