//
//  File.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 9/04/25.
//

import SwiftUI

public enum TagType {
    case outline, filled, opacity

    public func background(for state: TagState) -> Color {
        switch self {
        case .outline:
            return .white
        case .filled:
            return state == .ghost ? .clear : state.background
        case .opacity:
            return state == .ghost ? .clear : state.background.opacity(0.15)
        }
    }

    public func foreground(for state: TagState) -> Color {
        switch self {
        case .filled:
            return .white
        case .outline, .opacity:
            return state.foregroundColor
        }
    }

    public func border(for state: TagState) -> Color {
        switch self {
        case .outline:
            return state == .ghost ? .clear : state.outlineBorderColor
        case .filled:
            return state == .ghost ? .clear : state.filledBorderColor
        case .opacity:
            return .clear
        }
    }
}


public enum TagState {
    case `default`, info, success, warning, alert, secondary, ghost

    public var outlineBorderColor: Color {
        switch self {
        case .default: return Color.primaryValue500
        case .info: return Color.infoValue500
        case .success: return Color.successValue500
        case .warning: return Color.warningValue500
        case .alert: return Color.errorValue500
        case .secondary: return Color.secondaryValue200
        case .ghost: return .clear
        }
    }

    public var filledBorderColor: Color {
        switch self {
        case .default: return Color.primaryValue600
        case .info: return Color.infoValue500
        case .success: return Color.successValue500
        case .warning: return Color.warningValue500
        case .alert: return Color.errorValue500
        case .secondary: return Color.secondaryValue600
        case .ghost: return .clear
        }
    }


    public var foregroundColor: Color {
        switch self {
        case .default:
            return Color.primaryValue500
        case .info:
            return Color.infoValue500
        case .success:
            return Color.successValue500
        case .warning:
            return Color.warningValue500
        case .alert:
            return Color.errorValue500
        case .secondary:
            return Color.secondaryValue500
        case .ghost:
            return Color.secondaryValue500
        }
    }

    public var background: Color {
        switch self {
        case .default: return Color.primaryValue500
        case .info: return Color.infoValue500
        case .success: return Color.successValue500
        case .warning: return Color.warningValue500
        case .alert: return Color.errorValue500
        case .secondary: return Color.secondaryValue500
        case .ghost: return .clear
        }
    }

    public func iconColor(for type: TagType) -> Color {
        switch type {
        case .filled:
            return .white
        case .outline, .opacity:
            switch self {
            case .default: return Color.primaryValue500
            case .info: return Color.infoValue500
            case .success: return Color.successValue500
            case .warning: return Color.warningValue500
            case .alert: return Color.errorValue500
            case .secondary, .ghost: return Color.secondaryValue500
            }
        }
    }

    public func iconColorToken(for type: TagType) -> DodadaColorToken {
        switch type {
        case .filled: return .textOnPrimary
        case .outline, .opacity:
            switch self {
            case .default: return .primaryValue500
            case .info: return .infoValue500
            case .success: return .successValue500
            case .warning: return .warningValue500
            case .alert: return .errorValue500
            case .secondary, .ghost: return .secondaryValue500
            }
        }
    }

}
