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

public protocol DodadaElevationTokens {
    static var levelZero: CGFloat { get }
    static var levelOne: CGFloat { get }
    static var levelTwo: CGFloat { get }
    static var levelThree: CGFloat { get }
    static var levelFour: CGFloat { get }
    static var blurNone: CGFloat { get }
    static var blurSm: CGFloat { get }
    static var blurMd: CGFloat { get }
    static var blurLg: CGFloat { get }
    static var blurXl: CGFloat { get }
    static var offsetYSm: CGFloat { get }
    static var offsetYMd: CGFloat { get }
    static var offsetYLg: CGFloat { get }
    static var offsetYXl: CGFloat { get }
    func value(for token: DodadaElevation) -> CGFloat
}

public struct DodadaThemeElevationTokens: DodadaElevationTokens {
    public static var levelZero: CGFloat { DodadaElevation.levelZero.value }
    public static var levelOne: CGFloat { DodadaElevation.levelOne.value }
    public static var levelTwo: CGFloat { DodadaElevation.levelTwo.value }
    public static var levelThree: CGFloat { DodadaElevation.levelThree.value }
    public static var levelFour: CGFloat { DodadaElevation.levelFour.value }
    public static var blurNone: CGFloat { DodadaElevation.blurNone.value }
    public static var blurSm: CGFloat { DodadaElevation.blurSm.value }
    public static var blurMd: CGFloat { DodadaElevation.blurMd.value }
    public static var blurLg: CGFloat { DodadaElevation.blurLg.value }
    public static var blurXl: CGFloat { DodadaElevation.blurXl.value }
    public static var offsetYSm: CGFloat { DodadaElevation.offsetYSm.value }
    public static var offsetYMd: CGFloat { DodadaElevation.offsetYMd.value }
    public static var offsetYLg: CGFloat { DodadaElevation.offsetYLg.value }
    public static var offsetYXl: CGFloat { DodadaElevation.offsetYXl.value }
    public func value(for token: DodadaElevation) -> CGFloat {
        switch token {
        case .levelZero: return Self.levelZero
        case .levelOne: return Self.levelOne
        case .levelTwo: return Self.levelTwo
        case .levelThree: return Self.levelThree
        case .levelFour: return Self.levelFour
        case .blurNone: return Self.blurNone
        case .blurSm: return Self.blurSm
        case .blurMd: return Self.blurMd
        case .blurLg: return Self.blurLg
        case .blurXl: return Self.blurXl
        case .offsetYSm: return Self.offsetYSm
        case .offsetYMd: return Self.offsetYMd
        case .offsetYLg: return Self.offsetYLg
        case .offsetYXl: return Self.offsetYXl
        }
    }
}
