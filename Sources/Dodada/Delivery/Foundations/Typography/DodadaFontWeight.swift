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
    static var weightLight: CGFloat { get }
    static var weightRegular: CGFloat { get }
    static var weightMedium: CGFloat { get }
    static var weightSemibold: CGFloat { get }
    static var weightBold: CGFloat { get }
    func value(for token: DodadaFontWeight) -> CGFloat
}

public struct DodadaThemeFontWeightTokens: DodadaFontWeightTokens {
    public static var weightLight: CGFloat { DodadaFontWeight.weightLight.value }
    public static var weightRegular: CGFloat { DodadaFontWeight.weightRegular.value }
    public static var weightMedium: CGFloat { DodadaFontWeight.weightMedium.value }
    public static var weightSemibold: CGFloat { DodadaFontWeight.weightSemibold.value }
    public static var weightBold: CGFloat { DodadaFontWeight.weightBold.value }
    public func value(for token: DodadaFontWeight) -> CGFloat {
        switch token {
        case .weightLight: return Self.weightLight
        case .weightRegular: return Self.weightRegular
        case .weightMedium: return Self.weightMedium
        case .weightSemibold: return Self.weightSemibold
        case .weightBold: return Self.weightBold
        }
    }
}
