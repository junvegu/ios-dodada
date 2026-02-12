// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaFontWeight: CaseIterable {
    case weightLight
    case weightRegular
    case weightMedium
    case weightSemibold
    case weightBold
}

extension DodadaFontWeight {
    public var value: CGFloat {
        switch self {
        case .weightLight: return CGFloat(300)
        case .weightRegular: return CGFloat(400)
        case .weightMedium: return CGFloat(500)
        case .weightSemibold: return CGFloat(600)
        case .weightBold: return CGFloat(700)
        }
    }
}

public protocol DodadaFontWeightTokens {
    var weightLight: CGFloat { get }
    var weightRegular: CGFloat { get }
    var weightMedium: CGFloat { get }
    var weightSemibold: CGFloat { get }
    var weightBold: CGFloat { get }
    func value(for token: DodadaFontWeight) -> CGFloat
}

public struct DodadaThemeFontWeightTokens: DodadaFontWeightTokens {
    public var weightLight: CGFloat { DodadaFontWeight.weightLight.value }
    public var weightRegular: CGFloat { DodadaFontWeight.weightRegular.value }
    public var weightMedium: CGFloat { DodadaFontWeight.weightMedium.value }
    public var weightSemibold: CGFloat { DodadaFontWeight.weightSemibold.value }
    public var weightBold: CGFloat { DodadaFontWeight.weightBold.value }
    public func value(for token: DodadaFontWeight) -> CGFloat {
        switch token {
        case .weightLight: return weightLight
        case .weightRegular: return weightRegular
        case .weightMedium: return weightMedium
        case .weightSemibold: return weightSemibold
        case .weightBold: return weightBold
        }
    }
}
