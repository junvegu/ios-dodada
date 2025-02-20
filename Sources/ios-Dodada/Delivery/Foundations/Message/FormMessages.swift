//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 31/01/25.
//

import Foundation
import SwiftUI

public enum Message: Equatable, Hashable, CustomStringConvertible {

    case normal(String, icon: DDDIcon.Images? = nil)
    case help(String, icon: DDDIcon.Images? = .alertCircle)
    case warning(String, icon: DDDIcon.Images? = .alertCircle)
    case error(String, icon: DDDIcon.Images? = .alertCircle)

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
        status?.color ?? Asset.Colors.secondary.swiftUIColor
    }

    public var darkColor: Color {
        status?.darkColor ?? .black
    }

    public var lightColor: Color {
        status?.lightColor ?? Asset.Colors.secondary400.swiftUIColor
    }

    public var icon: DDDIcon.Images? {
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
    var icon: DDDIcon.Images? {
        switch self {
            case .info:         return nil
            case .success:      return .alertCircle
            case .warning:      return .alertCircle
            case .critical:     return .alertCircle
        }
    }

    /// Color associated with status.
    var color: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Light color associated with status.
    var lightColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Light hover color associated with status.
    var lightHoverColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Dark color associated with status.
    var darkColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Dark hover color associated with status.
    var darkHoverColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Active color associated with status.
    var activeColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Dark active color associated with status.
    var darkActiveColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

    /// Light active color associated with status.
    var lightActiveColor: Color {
        switch self {
        case .info:         return Asset.Colors.secondary.swiftUIColor
            case .success:      return Asset.Colors.secondary.swiftUIColor
            case .warning:      return Asset.Colors.success.swiftUIColor
            case .critical:     return Asset.Colors.error.swiftUIColor
        }
    }

   
}
