// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaFontSize: CaseIterable {
    case sizeXs
    case sizeSm
    case sizeMd
    case sizeLg
    case sizeXl
    case sizeTwoXl
    case sizeThreeXl
    case sizeFourXl
    case sizeFiveXl
    case sizeSixXl
    case sizeSevenXl
}

extension DodadaFontSize {
    public var value: CGFloat {
        switch self {
        case .sizeXs: return CGFloat(11)
        case .sizeSm: return CGFloat(12)
        case .sizeMd: return CGFloat(13)
        case .sizeLg: return CGFloat(15)
        case .sizeXl: return CGFloat(16)
        case .sizeTwoXl: return CGFloat(17)
        case .sizeThreeXl: return CGFloat(18)
        case .sizeFourXl: return CGFloat(20)
        case .sizeFiveXl: return CGFloat(22)
        case .sizeSixXl: return CGFloat(28)
        case .sizeSevenXl: return CGFloat(34)
        }
    }
}

public protocol DodadaFontSizeTokens {
    static var sizeXs: CGFloat { get }
    static var sizeSm: CGFloat { get }
    static var sizeMd: CGFloat { get }
    static var sizeLg: CGFloat { get }
    static var sizeXl: CGFloat { get }
    static var sizeTwoXl: CGFloat { get }
    static var sizeThreeXl: CGFloat { get }
    static var sizeFourXl: CGFloat { get }
    static var sizeFiveXl: CGFloat { get }
    static var sizeSixXl: CGFloat { get }
    static var sizeSevenXl: CGFloat { get }
    func value(for token: DodadaFontSize) -> CGFloat
}

public struct DodadaThemeFontSizeTokens: DodadaFontSizeTokens {
    public static var sizeXs: CGFloat { DodadaFontSize.sizeXs.value }
    public static var sizeSm: CGFloat { DodadaFontSize.sizeSm.value }
    public static var sizeMd: CGFloat { DodadaFontSize.sizeMd.value }
    public static var sizeLg: CGFloat { DodadaFontSize.sizeLg.value }
    public static var sizeXl: CGFloat { DodadaFontSize.sizeXl.value }
    public static var sizeTwoXl: CGFloat { DodadaFontSize.sizeTwoXl.value }
    public static var sizeThreeXl: CGFloat { DodadaFontSize.sizeThreeXl.value }
    public static var sizeFourXl: CGFloat { DodadaFontSize.sizeFourXl.value }
    public static var sizeFiveXl: CGFloat { DodadaFontSize.sizeFiveXl.value }
    public static var sizeSixXl: CGFloat { DodadaFontSize.sizeSixXl.value }
    public static var sizeSevenXl: CGFloat { DodadaFontSize.sizeSevenXl.value }
    public func value(for token: DodadaFontSize) -> CGFloat {
        switch token {
        case .sizeXs: return Self.sizeXs
        case .sizeSm: return Self.sizeSm
        case .sizeMd: return Self.sizeMd
        case .sizeLg: return Self.sizeLg
        case .sizeXl: return Self.sizeXl
        case .sizeTwoXl: return Self.sizeTwoXl
        case .sizeThreeXl: return Self.sizeThreeXl
        case .sizeFourXl: return Self.sizeFourXl
        case .sizeFiveXl: return Self.sizeFiveXl
        case .sizeSixXl: return Self.sizeSixXl
        case .sizeSevenXl: return Self.sizeSevenXl
        }
    }
}
