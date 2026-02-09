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
        theme.foundation.layout.value(for: self)
    }
}

public protocol DodadaThemeLayoutTokens {
    static var screenPaddingHorizontal: CGFloat { get }
    static var screenPaddingVertical: CGFloat { get }
    static var screenPaddingCompactHorizontal: CGFloat { get }
    static var screenPaddingCompactVertical: CGFloat { get }
    static var screenPaddingComfortableHorizontal: CGFloat { get }
    static var screenPaddingComfortableVertical: CGFloat { get }
    static var sectionSpacingSm: CGFloat { get }
    static var sectionSpacingMd: CGFloat { get }
    static var sectionSpacingLg: CGFloat { get }
    static var sectionSpacingXl: CGFloat { get }
    static var sectionGapSm: CGFloat { get }
    static var sectionGapMd: CGFloat { get }
    static var sectionGapLg: CGFloat { get }
    static var gridGapXs: CGFloat { get }
    static var gridGapSm: CGFloat { get }
    static var gridGapMd: CGFloat { get }
    static var gridGapLg: CGFloat { get }
    static var gridGapXl: CGFloat { get }
    static var gridColumnsMobile: CGFloat { get }
    static var gridColumnsTablet: CGFloat { get }
    static var gridColumnsDesktop: CGFloat { get }
    static var stackSpacingXs: CGFloat { get }
    static var stackSpacingSm: CGFloat { get }
    static var stackSpacingMd: CGFloat { get }
    static var stackSpacingLg: CGFloat { get }
    func value(for token: DodadaLayoutToken) -> CGFloat
}

public struct DodadaThemeLayoutTokensDefault: DodadaThemeLayoutTokens {
    public static var screenPaddingHorizontal: CGFloat { DodadaLayoutToken.screenPaddingHorizontal.value }
    public static var screenPaddingVertical: CGFloat { DodadaLayoutToken.screenPaddingVertical.value }
    public static var screenPaddingCompactHorizontal: CGFloat { DodadaLayoutToken.screenPaddingCompactHorizontal.value }
    public static var screenPaddingCompactVertical: CGFloat { DodadaLayoutToken.screenPaddingCompactVertical.value }
    public static var screenPaddingComfortableHorizontal: CGFloat { DodadaLayoutToken.screenPaddingComfortableHorizontal.value }
    public static var screenPaddingComfortableVertical: CGFloat { DodadaLayoutToken.screenPaddingComfortableVertical.value }
    public static var sectionSpacingSm: CGFloat { DodadaLayoutToken.sectionSpacingSm.value }
    public static var sectionSpacingMd: CGFloat { DodadaLayoutToken.sectionSpacingMd.value }
    public static var sectionSpacingLg: CGFloat { DodadaLayoutToken.sectionSpacingLg.value }
    public static var sectionSpacingXl: CGFloat { DodadaLayoutToken.sectionSpacingXl.value }
    public static var sectionGapSm: CGFloat { DodadaLayoutToken.sectionGapSm.value }
    public static var sectionGapMd: CGFloat { DodadaLayoutToken.sectionGapMd.value }
    public static var sectionGapLg: CGFloat { DodadaLayoutToken.sectionGapLg.value }
    public static var gridGapXs: CGFloat { DodadaLayoutToken.gridGapXs.value }
    public static var gridGapSm: CGFloat { DodadaLayoutToken.gridGapSm.value }
    public static var gridGapMd: CGFloat { DodadaLayoutToken.gridGapMd.value }
    public static var gridGapLg: CGFloat { DodadaLayoutToken.gridGapLg.value }
    public static var gridGapXl: CGFloat { DodadaLayoutToken.gridGapXl.value }
    public static var gridColumnsMobile: CGFloat { DodadaLayoutToken.gridColumnsMobile.value }
    public static var gridColumnsTablet: CGFloat { DodadaLayoutToken.gridColumnsTablet.value }
    public static var gridColumnsDesktop: CGFloat { DodadaLayoutToken.gridColumnsDesktop.value }
    public static var stackSpacingXs: CGFloat { DodadaLayoutToken.stackSpacingXs.value }
    public static var stackSpacingSm: CGFloat { DodadaLayoutToken.stackSpacingSm.value }
    public static var stackSpacingMd: CGFloat { DodadaLayoutToken.stackSpacingMd.value }
    public static var stackSpacingLg: CGFloat { DodadaLayoutToken.stackSpacingLg.value }
    public func value(for token: DodadaLayoutToken) -> CGFloat {
        switch token {
        case .screenPaddingHorizontal: return Self.screenPaddingHorizontal
        case .screenPaddingVertical: return Self.screenPaddingVertical
        case .screenPaddingCompactHorizontal: return Self.screenPaddingCompactHorizontal
        case .screenPaddingCompactVertical: return Self.screenPaddingCompactVertical
        case .screenPaddingComfortableHorizontal: return Self.screenPaddingComfortableHorizontal
        case .screenPaddingComfortableVertical: return Self.screenPaddingComfortableVertical
        case .sectionSpacingSm: return Self.sectionSpacingSm
        case .sectionSpacingMd: return Self.sectionSpacingMd
        case .sectionSpacingLg: return Self.sectionSpacingLg
        case .sectionSpacingXl: return Self.sectionSpacingXl
        case .sectionGapSm: return Self.sectionGapSm
        case .sectionGapMd: return Self.sectionGapMd
        case .sectionGapLg: return Self.sectionGapLg
        case .gridGapXs: return Self.gridGapXs
        case .gridGapSm: return Self.gridGapSm
        case .gridGapMd: return Self.gridGapMd
        case .gridGapLg: return Self.gridGapLg
        case .gridGapXl: return Self.gridGapXl
        case .gridColumnsMobile: return Self.gridColumnsMobile
        case .gridColumnsTablet: return Self.gridColumnsTablet
        case .gridColumnsDesktop: return Self.gridColumnsDesktop
        case .stackSpacingXs: return Self.stackSpacingXs
        case .stackSpacingSm: return Self.stackSpacingSm
        case .stackSpacingMd: return Self.stackSpacingMd
        case .stackSpacingLg: return Self.stackSpacingLg
        }
    }
}
