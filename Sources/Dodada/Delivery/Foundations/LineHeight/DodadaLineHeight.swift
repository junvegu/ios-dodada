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
    var lineHeightTight: CGFloat { get }
    var lineHeightNormal: CGFloat { get }
    var lineHeightRelaxed: CGFloat { get }
    var lineHeightLoose: CGFloat { get }
    func value(for token: DodadaLineHeight) -> CGFloat
}

public struct DodadaThemeLineHeightTokens: DodadaLineHeightTokens {
    public var lineHeightTight: CGFloat { DodadaLineHeight.lineHeightTight.value }
    public var lineHeightNormal: CGFloat { DodadaLineHeight.lineHeightNormal.value }
    public var lineHeightRelaxed: CGFloat { DodadaLineHeight.lineHeightRelaxed.value }
    public var lineHeightLoose: CGFloat { DodadaLineHeight.lineHeightLoose.value }
    public func value(for token: DodadaLineHeight) -> CGFloat {
        switch token {
        case .lineHeightTight: return lineHeightTight
        case .lineHeightNormal: return lineHeightNormal
        case .lineHeightRelaxed: return lineHeightRelaxed
        case .lineHeightLoose: return lineHeightLoose
        }
    }
}
