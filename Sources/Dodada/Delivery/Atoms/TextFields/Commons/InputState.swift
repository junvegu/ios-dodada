//
//  InputState.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 18/05/25.
//
import SwiftUI

public enum InputState {

    case `default`
    case modified

    public var textColor: Color {
        switch self {
        case .default:          return .secondary500.swiftUIColor
        case .modified:         return .secondary200.swiftUIColor
        }
    }
    
    public var placeholderColor: Color {
        .secondary400.swiftUIColor
    }
}
