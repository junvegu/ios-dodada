// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaRadiusToken: CaseIterable {
    case none
    case xs
    case sm
    case md
    case lg
    case xl
    case twoXl
    case threeXl
    case full
}

extension DodadaRadiusToken {
    public var value: CGFloat {
        switch self {
        case .none: return CGFloat(0)
        case .xs: return CGFloat(2)
        case .sm: return CGFloat(4)
        case .md: return CGFloat(8)
        case .lg: return CGFloat(12)
        case .xl: return CGFloat(16)
        case .twoXl: return CGFloat(24)
        case .threeXl: return CGFloat(32)
        case .full: return CGFloat(9999)
        }
    }
}

public extension DodadaRadiusToken {
    func toCGFloat(using theme: DDDTheme = DDDThemeManager.shared.main) -> CGFloat {
        theme.foundation.radius.value(for: self)
    }
}

public protocol DodadaThemeRadiusTokens {
    static var none: CGFloat { get }
    static var xs: CGFloat { get }
    static var sm: CGFloat { get }
    static var md: CGFloat { get }
    static var lg: CGFloat { get }
    static var xl: CGFloat { get }
    static var twoXl: CGFloat { get }
    static var threeXl: CGFloat { get }
    static var full: CGFloat { get }
    func value(for token: DodadaRadiusToken) -> CGFloat
}

public struct DodadaThemeRadiusTokensDefault: DodadaThemeRadiusTokens {
    public static var none: CGFloat { DodadaRadiusToken.none.value }
    public static var xs: CGFloat { DodadaRadiusToken.xs.value }
    public static var sm: CGFloat { DodadaRadiusToken.sm.value }
    public static var md: CGFloat { DodadaRadiusToken.md.value }
    public static var lg: CGFloat { DodadaRadiusToken.lg.value }
    public static var xl: CGFloat { DodadaRadiusToken.xl.value }
    public static var twoXl: CGFloat { DodadaRadiusToken.twoXl.value }
    public static var threeXl: CGFloat { DodadaRadiusToken.threeXl.value }
    public static var full: CGFloat { DodadaRadiusToken.full.value }
    public func value(for token: DodadaRadiusToken) -> CGFloat {
        switch token {
        case .none: return Self.none
        case .xs: return Self.xs
        case .sm: return Self.sm
        case .md: return Self.md
        case .lg: return Self.lg
        case .xl: return Self.xl
        case .twoXl: return Self.twoXl
        case .threeXl: return Self.threeXl
        case .full: return Self.full
        }
    }
}
