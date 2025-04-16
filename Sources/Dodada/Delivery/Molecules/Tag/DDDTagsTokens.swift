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
        case .default: return Color(asset: Color.primary500)
        case .info: return Color(asset: Color.info)
        case .success: return Color(asset: Color.success500)
        case .warning: return Color(asset: Color.warning500)
        case .alert: return Color(asset: Color.error)
        case .secondary: return Color(asset: Color.secondary200)
        case .ghost: return .clear
        }
    }

    public var filledBorderColor: Color {
        switch self {
        case .default: return Color(asset: Color.primary600)
        case .info: return Color(asset: Color.info)
        case .success: return Color(asset: Color.success)
        case .warning: return Color(asset: Color.warning)
        case .alert: return Color(asset: Color.error)
        case .secondary: return Color(asset: Color.secondary600)
        case .ghost: return .clear
        }
    }


    public var foregroundColor: Color {
        switch self {
        case .default:
            return Color(asset: Color.primary500)
        case .info:
            return Color(asset: Color.info)
        case .success:
            return Color(asset: Color.success500)
        case .warning:
            return Color(asset: Color.warning500)
        case .alert:
            return Color(asset: Color.error)
        case .secondary:
            return Color(asset: Color.secondary500)
        case .ghost:
            return Color(asset: Color.secondary500)
        }
    }

    public var background: Color {
        switch self {
        case .default: return Color(asset: Color.primary500)
        case .info: return Color(asset: Color.info)
        case .success: return Color(asset: Color.success500)
        case .warning: return Color(asset: Color.warning500)
        case .alert: return Color(asset: Color.error)
        case .secondary: return Color(asset: Color.secondary500)
        case .ghost: return .clear
        }
    }

    public func iconColor(for type: TagType) -> Color {
        switch type {
        case .filled:
            return .white
        case .outline, .opacity:
            switch self {
            case .default: return Color(asset: Color.primary500)
            case .info: return Color(asset: Color.info)
            case .success: return Color(asset: Color.success500)
            case .warning: return Color(asset: Color.warning500)
            case .alert: return Color(asset: Color.error)
            case .secondary, .ghost: return Color(asset: Color.secondary500)
            }
        }
    }

}
