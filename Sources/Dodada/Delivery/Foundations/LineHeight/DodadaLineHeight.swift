// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaLineHeight: CaseIterable {
    case lineHeightTight
    case lineHeightNormal
    case lineHeightRelaxed
    case lineHeightLoose
}

extension DodadaLineHeight {
    public var value: CGFloat {
        switch self {
        case .lineHeightTight: return CGFloat(1.2)
        case .lineHeightNormal: return CGFloat(1.5)
        case .lineHeightRelaxed: return CGFloat(1.75)
        case .lineHeightLoose: return CGFloat(2)
        }
    }
}

public protocol DodadaLineHeightTokens {
    static var lineHeightTight: CGFloat { get }
    static var lineHeightNormal: CGFloat { get }
    static var lineHeightRelaxed: CGFloat { get }
    static var lineHeightLoose: CGFloat { get }
    func value(for token: DodadaLineHeight) -> CGFloat
}

public struct DodadaThemeLineHeightTokens: DodadaLineHeightTokens {
    public static var lineHeightTight: CGFloat { DodadaLineHeight.lineHeightTight.value }
    public static var lineHeightNormal: CGFloat { DodadaLineHeight.lineHeightNormal.value }
    public static var lineHeightRelaxed: CGFloat { DodadaLineHeight.lineHeightRelaxed.value }
    public static var lineHeightLoose: CGFloat { DodadaLineHeight.lineHeightLoose.value }
    public func value(for token: DodadaLineHeight) -> CGFloat {
        switch token {
        case .lineHeightTight: return Self.lineHeightTight
        case .lineHeightNormal: return Self.lineHeightNormal
        case .lineHeightRelaxed: return Self.lineHeightRelaxed
        case .lineHeightLoose: return Self.lineHeightLoose
        }
    }
}
