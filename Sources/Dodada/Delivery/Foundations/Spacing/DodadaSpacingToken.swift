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
        let themeSpacing = theme.foundation.spacing
        switch self {
        case .zero: return themeSpacing.zero
        case .twoXs: return themeSpacing.twoXs
        case .xs: return themeSpacing.xs
        case .sm: return themeSpacing.sm
        case .md: return themeSpacing.md
        case .lg: return themeSpacing.lg
        case .xl: return themeSpacing.xl
        case .twoXl: return themeSpacing.twoXl
        case .threeXl: return themeSpacing.threeXl
        case .fourXl: return themeSpacing.fourXl
        case .fiveXl: return themeSpacing.fiveXl
        }
    }
}

public protocol DodadaThemeSpacingTokens {
    var zero: CGFloat { get }
    var twoXs: CGFloat { get }
    var xs: CGFloat { get }
    var sm: CGFloat { get }
    var md: CGFloat { get }
    var lg: CGFloat { get }
    var xl: CGFloat { get }
    var twoXl: CGFloat { get }
    var threeXl: CGFloat { get }
    var fourXl: CGFloat { get }
    var fiveXl: CGFloat { get }
    func value(for token: DodadaSpacingToken) -> CGFloat
}

public struct DodadaThemeSpacingTokensDefault: DodadaThemeSpacingTokens {
    public var zero: CGFloat { DodadaSpacingToken.zero.value }
    public var twoXs: CGFloat { DodadaSpacingToken.twoXs.value }
    public var xs: CGFloat { DodadaSpacingToken.xs.value }
    public var sm: CGFloat { DodadaSpacingToken.sm.value }
    public var md: CGFloat { DodadaSpacingToken.md.value }
    public var lg: CGFloat { DodadaSpacingToken.lg.value }
    public var xl: CGFloat { DodadaSpacingToken.xl.value }
    public var twoXl: CGFloat { DodadaSpacingToken.twoXl.value }
    public var threeXl: CGFloat { DodadaSpacingToken.threeXl.value }
    public var fourXl: CGFloat { DodadaSpacingToken.fourXl.value }
    public var fiveXl: CGFloat { DodadaSpacingToken.fiveXl.value }
    public func value(for token: DodadaSpacingToken) -> CGFloat {
        switch token {
        case .zero: return zero
        case .twoXs: return twoXs
        case .xs: return xs
        case .sm: return sm
        case .md: return md
        case .lg: return lg
        case .xl: return xl
        case .twoXl: return twoXl
        case .threeXl: return threeXl
        case .fourXl: return fourXl
        case .fiveXl: return fiveXl
        }
    }
}
