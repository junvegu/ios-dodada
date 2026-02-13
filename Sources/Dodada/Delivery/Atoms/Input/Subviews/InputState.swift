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
        case .default:          return Color.secondaryValue500
        case .modified:         return Color.secondaryValue200
        }
    }
    
    public var placeholderColor: Color {
        Color.secondaryValue400
    }
}
