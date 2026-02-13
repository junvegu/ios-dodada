// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaElevation: CaseIterable {
    case levelZero
    case levelOne
    case levelTwo
    case levelThree
    case levelFour
    case blurNone
    case blurSm
    case blurMd
    case blurLg
    case blurXl
    case offsetYSm
    case offsetYMd
    case offsetYLg
    case offsetYXl
}

extension DodadaElevation {
    public var value: CGFloat {
        switch self {
        case .levelZero: return CGFloat(0)
        case .levelOne: return CGFloat(1)
        case .levelTwo: return CGFloat(2)
        case .levelThree: return CGFloat(3)
        case .levelFour: return CGFloat(4)
        case .blurNone: return CGFloat(0)
        case .blurSm: return CGFloat(4)
        case .blurMd: return CGFloat(8)
        case .blurLg: return CGFloat(16)
        case .blurXl: return CGFloat(24)
        case .offsetYSm: return CGFloat(1)
        case .offsetYMd: return CGFloat(2)
        case .offsetYLg: return CGFloat(4)
        case .offsetYXl: return CGFloat(8)
        }
    }
}

public extension DodadaElevation {
    func toCGFloat(using theme: DDDTheme = DDDThemeManager.shared.main) -> CGFloat {
        let themeElevation = theme.foundation.elevation
        switch self {
        case .levelZero: return themeElevation.levelZero
        case .levelOne: return themeElevation.levelOne
        case .levelTwo: return themeElevation.levelTwo
        case .levelThree: return themeElevation.levelThree
        case .levelFour: return themeElevation.levelFour
        case .blurNone: return themeElevation.blurNone
        case .blurSm: return themeElevation.blurSm
        case .blurMd: return themeElevation.blurMd
        case .blurLg: return themeElevation.blurLg
        case .blurXl: return themeElevation.blurXl
        case .offsetYSm: return themeElevation.offsetYSm
        case .offsetYMd: return themeElevation.offsetYMd
        case .offsetYLg: return themeElevation.offsetYLg
        case .offsetYXl: return themeElevation.offsetYXl
        }
    }
}

public protocol DodadaElevationTokens {
    var levelZero: CGFloat { get }
    var levelOne: CGFloat { get }
    var levelTwo: CGFloat { get }
    var levelThree: CGFloat { get }
    var levelFour: CGFloat { get }
    var blurNone: CGFloat { get }
    var blurSm: CGFloat { get }
    var blurMd: CGFloat { get }
    var blurLg: CGFloat { get }
    var blurXl: CGFloat { get }
    var offsetYSm: CGFloat { get }
    var offsetYMd: CGFloat { get }
    var offsetYLg: CGFloat { get }
    var offsetYXl: CGFloat { get }
    func value(for token: DodadaElevation) -> CGFloat
}

public struct DodadaThemeElevationTokens: DodadaElevationTokens {
    public var levelZero: CGFloat { DodadaElevation.levelZero.value }
    public var levelOne: CGFloat { DodadaElevation.levelOne.value }
    public var levelTwo: CGFloat { DodadaElevation.levelTwo.value }
    public var levelThree: CGFloat { DodadaElevation.levelThree.value }
    public var levelFour: CGFloat { DodadaElevation.levelFour.value }
    public var blurNone: CGFloat { DodadaElevation.blurNone.value }
    public var blurSm: CGFloat { DodadaElevation.blurSm.value }
    public var blurMd: CGFloat { DodadaElevation.blurMd.value }
    public var blurLg: CGFloat { DodadaElevation.blurLg.value }
    public var blurXl: CGFloat { DodadaElevation.blurXl.value }
    public var offsetYSm: CGFloat { DodadaElevation.offsetYSm.value }
    public var offsetYMd: CGFloat { DodadaElevation.offsetYMd.value }
    public var offsetYLg: CGFloat { DodadaElevation.offsetYLg.value }
    public var offsetYXl: CGFloat { DodadaElevation.offsetYXl.value }
    public func value(for token: DodadaElevation) -> CGFloat {
        switch token {
        case .levelZero: return levelZero
        case .levelOne: return levelOne
        case .levelTwo: return levelTwo
        case .levelThree: return levelThree
        case .levelFour: return levelFour
        case .blurNone: return blurNone
        case .blurSm: return blurSm
        case .blurMd: return blurMd
        case .blurLg: return blurLg
        case .blurXl: return blurXl
        case .offsetYSm: return offsetYSm
        case .offsetYMd: return offsetYMd
        case .offsetYLg: return offsetYLg
        case .offsetYXl: return offsetYXl
        }
    }
}
