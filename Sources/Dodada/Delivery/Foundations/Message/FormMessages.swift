//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 31/01/25.
//

import Foundation
import SwiftUI

public enum Message: Equatable, Hashable, CustomStringConvertible {

    case normal(String, icon: DodadaIconToken? = nil)
    case help(String, icon: DodadaIconToken? = .actionsCheck)
    case warning(String, icon: DodadaIconToken? = .feedbackInfo)
    case error(String, icon: DodadaIconToken? = .feedbackInfo)

    public var description: String {
        switch self {
            case .normal(let text, _):      return text
            case .help(let text, _):        return text
            case .warning(let text, _):     return text
            case .error(let text, _):       return text
        }
    }

    public var isEmphasis: Bool {
        switch self {
            case .error, .help, .warning:   return true
            case .normal:                   return false
        }
    }

    public var isError: Bool {
        switch self {
            case .error:                    return true
            case .normal, .help, .warning:  return false
        }
    }

    public var status: Status? {
        switch self {
            case .normal:   return nil
            case .help:     return .info
            case .warning:  return .warning
            case .error:    return .critical
        }
    }

    public var color: Color {
        status?.color ?? Color.secondaryValue500
    }

    public var darkColor: Color {
        status?.darkColor ?? .black
    }

    public var lightColor: Color {
        status?.lightColor ?? Color.secondaryValue400
    }

    public var icon: DodadaIconToken? {
        switch self {
            case .error(_, let icon),
                 .warning(_, let icon),
                 .normal(_, let icon),
                 .help(_, let icon):
                return icon
        }
    }

    public var isEmpty: Bool {
        switch self {
            case .error(let message, let icon),
                 .warning(let message, let icon),
                 .normal(let message, let icon),
                 .help(let message, let icon):
                return message.isEmpty && icon == .none
        }
    }
}

public enum Status: Equatable {
    case info
    case success
    case warning
    case critical
}

public extension Status {

    /// Default icon associated with status.
    var icon: DodadaIconToken? {
        switch self {
            case .info:         return nil
            case .success:      return .feedbackAlertCircle
            case .warning:      return .feedbackAlertCircle
            case .critical:     return .feedbackAlertCircle
        }
    }

    /// Color associated with status.
    var color: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Light color associated with status.
    var lightColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Light hover color associated with status.
    var lightHoverColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Dark color associated with status.
    var darkColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Dark hover color associated with status.
    var darkHoverColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Active color associated with status.
    var activeColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Dark active color associated with status.
    var darkActiveColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

    /// Light active color associated with status.
    var lightActiveColor: Color {
        switch self {
        case .info:         return Color.secondaryValue500
            case .success:      return Color.secondaryValue500
            case .warning:      return Color.successValue500
            case .critical:     return Color.errorValue500
        }
    }

   
}
