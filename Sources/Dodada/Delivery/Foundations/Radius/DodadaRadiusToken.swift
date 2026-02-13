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
        let themeRadius = theme.foundation.radius
        switch self {
        case .none: return themeRadius.none
        case .xs: return themeRadius.xs
        case .sm: return themeRadius.sm
        case .md: return themeRadius.md
        case .lg: return themeRadius.lg
        case .xl: return themeRadius.xl
        case .twoXl: return themeRadius.twoXl
        case .threeXl: return themeRadius.threeXl
        case .full: return themeRadius.full
        }
    }
}

public protocol DodadaThemeRadiusTokens {
    var none: CGFloat { get }
    var xs: CGFloat { get }
    var sm: CGFloat { get }
    var md: CGFloat { get }
    var lg: CGFloat { get }
    var xl: CGFloat { get }
    var twoXl: CGFloat { get }
    var threeXl: CGFloat { get }
    var full: CGFloat { get }
    func value(for token: DodadaRadiusToken) -> CGFloat
}

public struct DodadaThemeRadiusTokensDefault: DodadaThemeRadiusTokens {
    public var none: CGFloat { DodadaRadiusToken.none.value }
    public var xs: CGFloat { DodadaRadiusToken.xs.value }
    public var sm: CGFloat { DodadaRadiusToken.sm.value }
    public var md: CGFloat { DodadaRadiusToken.md.value }
    public var lg: CGFloat { DodadaRadiusToken.lg.value }
    public var xl: CGFloat { DodadaRadiusToken.xl.value }
    public var twoXl: CGFloat { DodadaRadiusToken.twoXl.value }
    public var threeXl: CGFloat { DodadaRadiusToken.threeXl.value }
    public var full: CGFloat { DodadaRadiusToken.full.value }
    public func value(for token: DodadaRadiusToken) -> CGFloat {
        switch token {
        case .none: return none
        case .xs: return xs
        case .sm: return sm
        case .md: return md
        case .lg: return lg
        case .xl: return xl
        case .twoXl: return twoXl
        case .threeXl: return threeXl
        case .full: return full
        }
    }
}
