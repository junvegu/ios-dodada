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
    var sizeXs: CGFloat { get }
    var sizeSm: CGFloat { get }
    var sizeMd: CGFloat { get }
    var sizeLg: CGFloat { get }
    var sizeXl: CGFloat { get }
    var sizeTwoXl: CGFloat { get }
    var sizeThreeXl: CGFloat { get }
    var sizeFourXl: CGFloat { get }
    var sizeFiveXl: CGFloat { get }
    var sizeSixXl: CGFloat { get }
    var sizeSevenXl: CGFloat { get }
    func value(for token: DodadaFontSize) -> CGFloat
}

public struct DodadaThemeFontSizeTokens: DodadaFontSizeTokens {
    public var sizeXs: CGFloat { DodadaFontSize.sizeXs.value }
    public var sizeSm: CGFloat { DodadaFontSize.sizeSm.value }
    public var sizeMd: CGFloat { DodadaFontSize.sizeMd.value }
    public var sizeLg: CGFloat { DodadaFontSize.sizeLg.value }
    public var sizeXl: CGFloat { DodadaFontSize.sizeXl.value }
    public var sizeTwoXl: CGFloat { DodadaFontSize.sizeTwoXl.value }
    public var sizeThreeXl: CGFloat { DodadaFontSize.sizeThreeXl.value }
    public var sizeFourXl: CGFloat { DodadaFontSize.sizeFourXl.value }
    public var sizeFiveXl: CGFloat { DodadaFontSize.sizeFiveXl.value }
    public var sizeSixXl: CGFloat { DodadaFontSize.sizeSixXl.value }
    public var sizeSevenXl: CGFloat { DodadaFontSize.sizeSevenXl.value }
    public func value(for token: DodadaFontSize) -> CGFloat {
        switch token {
        case .sizeXs: return sizeXs
        case .sizeSm: return sizeSm
        case .sizeMd: return sizeMd
        case .sizeLg: return sizeLg
        case .sizeXl: return sizeXl
        case .sizeTwoXl: return sizeTwoXl
        case .sizeThreeXl: return sizeThreeXl
        case .sizeFourXl: return sizeFourXl
        case .sizeFiveXl: return sizeFiveXl
        case .sizeSixXl: return sizeSixXl
        case .sizeSevenXl: return sizeSevenXl
        }
    }
}
