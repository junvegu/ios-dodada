// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaSpacingToken: CaseIterable {
    case zero
    case twoXs
    case xs
    case sm
    case md
    case lg
    case xl
    case twoXl
    case threeXl
    case fourXl
    case fiveXl
}

extension DodadaSpacingToken {
    public var value: CGFloat {
        switch self {
        case .zero: return CGFloat(0)
        case .twoXs: return CGFloat(2)
        case .xs: return CGFloat(4)
        case .sm: return CGFloat(8)
        case .md: return CGFloat(12)
        case .lg: return CGFloat(16)
        case .xl: return CGFloat(24)
        case .twoXl: return CGFloat(32)
        case .threeXl: return CGFloat(40)
        case .fourXl: return CGFloat(48)
        case .fiveXl: return CGFloat(64)
        }
    }
}

public extension DodadaSpacingToken {
    func toCGFloat(using theme: DDDTheme = DDDThemeManager.shared.main) -> CGFloat {
        theme.foundation.spacing.value(for: self)
    }
}

public protocol DodadaThemeSpacingTokens {
    static var zero: CGFloat { get }
    static var twoXs: CGFloat { get }
    static var xs: CGFloat { get }
    static var sm: CGFloat { get }
    static var md: CGFloat { get }
    static var lg: CGFloat { get }
    static var xl: CGFloat { get }
    static var twoXl: CGFloat { get }
    static var threeXl: CGFloat { get }
    static var fourXl: CGFloat { get }
    static var fiveXl: CGFloat { get }
    func value(for token: DodadaSpacingToken) -> CGFloat
}

public struct DodadaThemeSpacingTokensDefault: DodadaThemeSpacingTokens {
    public static var zero: CGFloat { DodadaSpacingToken.zero.value }
    public static var twoXs: CGFloat { DodadaSpacingToken.twoXs.value }
    public static var xs: CGFloat { DodadaSpacingToken.xs.value }
    public static var sm: CGFloat { DodadaSpacingToken.sm.value }
    public static var md: CGFloat { DodadaSpacingToken.md.value }
    public static var lg: CGFloat { DodadaSpacingToken.lg.value }
    public static var xl: CGFloat { DodadaSpacingToken.xl.value }
    public static var twoXl: CGFloat { DodadaSpacingToken.twoXl.value }
    public static var threeXl: CGFloat { DodadaSpacingToken.threeXl.value }
    public static var fourXl: CGFloat { DodadaSpacingToken.fourXl.value }
    public static var fiveXl: CGFloat { DodadaSpacingToken.fiveXl.value }
    public func value(for token: DodadaSpacingToken) -> CGFloat {
        switch token {
        case .zero: return Self.zero
        case .twoXs: return Self.twoXs
        case .xs: return Self.xs
        case .sm: return Self.sm
        case .md: return Self.md
        case .lg: return Self.lg
        case .xl: return Self.xl
        case .twoXl: return Self.twoXl
        case .threeXl: return Self.threeXl
        case .fourXl: return Self.fourXl
        case .fiveXl: return Self.fiveXl
        }
    }
}
