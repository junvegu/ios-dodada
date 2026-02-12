// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaLayoutToken: CaseIterable {
    case screenPaddingHorizontal
    case screenPaddingVertical
    case screenPaddingCompactHorizontal
    case screenPaddingCompactVertical
    case screenPaddingComfortableHorizontal
    case screenPaddingComfortableVertical
    case sectionSpacingSm
    case sectionSpacingMd
    case sectionSpacingLg
    case sectionSpacingXl
    case sectionGapSm
    case sectionGapMd
    case sectionGapLg
    case gridGapXs
    case gridGapSm
    case gridGapMd
    case gridGapLg
    case gridGapXl
    case gridColumnsMobile
    case gridColumnsTablet
    case gridColumnsDesktop
    case stackSpacingXs
    case stackSpacingSm
    case stackSpacingMd
    case stackSpacingLg
}

extension DodadaLayoutToken {
    public var value: CGFloat {
        switch self {
        case .screenPaddingHorizontal: return CGFloat(16)
        case .screenPaddingVertical: return CGFloat(24)
        case .screenPaddingCompactHorizontal: return CGFloat(12)
        case .screenPaddingCompactVertical: return CGFloat(16)
        case .screenPaddingComfortableHorizontal: return CGFloat(24)
        case .screenPaddingComfortableVertical: return CGFloat(32)
        case .sectionSpacingSm: return CGFloat(24)
        case .sectionSpacingMd: return CGFloat(32)
        case .sectionSpacingLg: return CGFloat(40)
        case .sectionSpacingXl: return CGFloat(48)
        case .sectionGapSm: return CGFloat(8)
        case .sectionGapMd: return CGFloat(12)
        case .sectionGapLg: return CGFloat(16)
        case .gridGapXs: return CGFloat(4)
        case .gridGapSm: return CGFloat(8)
        case .gridGapMd: return CGFloat(12)
        case .gridGapLg: return CGFloat(16)
        case .gridGapXl: return CGFloat(24)
        case .gridColumnsMobile: return CGFloat(4)
        case .gridColumnsTablet: return CGFloat(8)
        case .gridColumnsDesktop: return CGFloat(12)
        case .stackSpacingXs: return CGFloat(4)
        case .stackSpacingSm: return CGFloat(8)
        case .stackSpacingMd: return CGFloat(12)
        case .stackSpacingLg: return CGFloat(16)
        }
    }
}

public extension DodadaLayoutToken {
    func toCGFloat(using theme: DDDTheme = DDDThemeManager.shared.main) -> CGFloat {
        let themeLayout = theme.foundation.layout
        switch self {
        case .screenPaddingHorizontal: return themeLayout.screenPaddingHorizontal
        case .screenPaddingVertical: return themeLayout.screenPaddingVertical
        case .screenPaddingCompactHorizontal: return themeLayout.screenPaddingCompactHorizontal
        case .screenPaddingCompactVertical: return themeLayout.screenPaddingCompactVertical
        case .screenPaddingComfortableHorizontal: return themeLayout.screenPaddingComfortableHorizontal
        case .screenPaddingComfortableVertical: return themeLayout.screenPaddingComfortableVertical
        case .sectionSpacingSm: return themeLayout.sectionSpacingSm
        case .sectionSpacingMd: return themeLayout.sectionSpacingMd
        case .sectionSpacingLg: return themeLayout.sectionSpacingLg
        case .sectionSpacingXl: return themeLayout.sectionSpacingXl
        case .sectionGapSm: return themeLayout.sectionGapSm
        case .sectionGapMd: return themeLayout.sectionGapMd
        case .sectionGapLg: return themeLayout.sectionGapLg
        case .gridGapXs: return themeLayout.gridGapXs
        case .gridGapSm: return themeLayout.gridGapSm
        case .gridGapMd: return themeLayout.gridGapMd
        case .gridGapLg: return themeLayout.gridGapLg
        case .gridGapXl: return themeLayout.gridGapXl
        case .gridColumnsMobile: return themeLayout.gridColumnsMobile
        case .gridColumnsTablet: return themeLayout.gridColumnsTablet
        case .gridColumnsDesktop: return themeLayout.gridColumnsDesktop
        case .stackSpacingXs: return themeLayout.stackSpacingXs
        case .stackSpacingSm: return themeLayout.stackSpacingSm
        case .stackSpacingMd: return themeLayout.stackSpacingMd
        case .stackSpacingLg: return themeLayout.stackSpacingLg
        }
    }
}

public protocol DodadaThemeLayoutTokens {
    var screenPaddingHorizontal: CGFloat { get }
    var screenPaddingVertical: CGFloat { get }
    var screenPaddingCompactHorizontal: CGFloat { get }
    var screenPaddingCompactVertical: CGFloat { get }
    var screenPaddingComfortableHorizontal: CGFloat { get }
    var screenPaddingComfortableVertical: CGFloat { get }
    var sectionSpacingSm: CGFloat { get }
    var sectionSpacingMd: CGFloat { get }
    var sectionSpacingLg: CGFloat { get }
    var sectionSpacingXl: CGFloat { get }
    var sectionGapSm: CGFloat { get }
    var sectionGapMd: CGFloat { get }
    var sectionGapLg: CGFloat { get }
    var gridGapXs: CGFloat { get }
    var gridGapSm: CGFloat { get }
    var gridGapMd: CGFloat { get }
    var gridGapLg: CGFloat { get }
    var gridGapXl: CGFloat { get }
    var gridColumnsMobile: CGFloat { get }
    var gridColumnsTablet: CGFloat { get }
    var gridColumnsDesktop: CGFloat { get }
    var stackSpacingXs: CGFloat { get }
    var stackSpacingSm: CGFloat { get }
    var stackSpacingMd: CGFloat { get }
    var stackSpacingLg: CGFloat { get }
    func value(for token: DodadaLayoutToken) -> CGFloat
}

public struct DodadaThemeLayoutTokensDefault: DodadaThemeLayoutTokens {
    public var screenPaddingHorizontal: CGFloat { DodadaLayoutToken.screenPaddingHorizontal.value }
    public var screenPaddingVertical: CGFloat { DodadaLayoutToken.screenPaddingVertical.value }
    public var screenPaddingCompactHorizontal: CGFloat { DodadaLayoutToken.screenPaddingCompactHorizontal.value }
    public var screenPaddingCompactVertical: CGFloat { DodadaLayoutToken.screenPaddingCompactVertical.value }
    public var screenPaddingComfortableHorizontal: CGFloat { DodadaLayoutToken.screenPaddingComfortableHorizontal.value }
    public var screenPaddingComfortableVertical: CGFloat { DodadaLayoutToken.screenPaddingComfortableVertical.value }
    public var sectionSpacingSm: CGFloat { DodadaLayoutToken.sectionSpacingSm.value }
    public var sectionSpacingMd: CGFloat { DodadaLayoutToken.sectionSpacingMd.value }
    public var sectionSpacingLg: CGFloat { DodadaLayoutToken.sectionSpacingLg.value }
    public var sectionSpacingXl: CGFloat { DodadaLayoutToken.sectionSpacingXl.value }
    public var sectionGapSm: CGFloat { DodadaLayoutToken.sectionGapSm.value }
    public var sectionGapMd: CGFloat { DodadaLayoutToken.sectionGapMd.value }
    public var sectionGapLg: CGFloat { DodadaLayoutToken.sectionGapLg.value }
    public var gridGapXs: CGFloat { DodadaLayoutToken.gridGapXs.value }
    public var gridGapSm: CGFloat { DodadaLayoutToken.gridGapSm.value }
    public var gridGapMd: CGFloat { DodadaLayoutToken.gridGapMd.value }
    public var gridGapLg: CGFloat { DodadaLayoutToken.gridGapLg.value }
    public var gridGapXl: CGFloat { DodadaLayoutToken.gridGapXl.value }
    public var gridColumnsMobile: CGFloat { DodadaLayoutToken.gridColumnsMobile.value }
    public var gridColumnsTablet: CGFloat { DodadaLayoutToken.gridColumnsTablet.value }
    public var gridColumnsDesktop: CGFloat { DodadaLayoutToken.gridColumnsDesktop.value }
    public var stackSpacingXs: CGFloat { DodadaLayoutToken.stackSpacingXs.value }
    public var stackSpacingSm: CGFloat { DodadaLayoutToken.stackSpacingSm.value }
    public var stackSpacingMd: CGFloat { DodadaLayoutToken.stackSpacingMd.value }
    public var stackSpacingLg: CGFloat { DodadaLayoutToken.stackSpacingLg.value }
    public func value(for token: DodadaLayoutToken) -> CGFloat {
        switch token {
        case .screenPaddingHorizontal: return screenPaddingHorizontal
        case .screenPaddingVertical: return screenPaddingVertical
        case .screenPaddingCompactHorizontal: return screenPaddingCompactHorizontal
        case .screenPaddingCompactVertical: return screenPaddingCompactVertical
        case .screenPaddingComfortableHorizontal: return screenPaddingComfortableHorizontal
        case .screenPaddingComfortableVertical: return screenPaddingComfortableVertical
        case .sectionSpacingSm: return sectionSpacingSm
        case .sectionSpacingMd: return sectionSpacingMd
        case .sectionSpacingLg: return sectionSpacingLg
        case .sectionSpacingXl: return sectionSpacingXl
        case .sectionGapSm: return sectionGapSm
        case .sectionGapMd: return sectionGapMd
        case .sectionGapLg: return sectionGapLg
        case .gridGapXs: return gridGapXs
        case .gridGapSm: return gridGapSm
        case .gridGapMd: return gridGapMd
        case .gridGapLg: return gridGapLg
        case .gridGapXl: return gridGapXl
        case .gridColumnsMobile: return gridColumnsMobile
        case .gridColumnsTablet: return gridColumnsTablet
        case .gridColumnsDesktop: return gridColumnsDesktop
        case .stackSpacingXs: return stackSpacingXs
        case .stackSpacingSm: return stackSpacingSm
        case .stackSpacingMd: return stackSpacingMd
        case .stackSpacingLg: return stackSpacingLg
        }
    }
}
