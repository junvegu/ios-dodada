// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaSizingToken: CaseIterable {
    case iconXs
    case iconSm
    case iconMd
    case iconLg
    case iconXl
    case iconTwoXl
    case buttonHeightRegular
    case buttonHeightMedium
    case buttonHeightSmall
    case buttonHeightLinkRegular
    case buttonHeightLinkMedium
    case buttonHeightLinkSmall
    case buttonOnlyIconSize
    case buttonMinWidthSm
    case buttonMinWidthMd
    case buttonMinWidthLg
    case inputHeightSm
    case inputHeightMd
    case inputHeightLg
    case inputHeightXl
    case touchTargetMin
    case touchTargetComfortable
    case touchTargetSpacious
    case containerXs
    case containerSm
    case containerMd
    case containerLg
    case containerXl
    case containerTwoXl
}

extension DodadaSizingToken {
    public var value: CGFloat {
        switch self {
        case .iconXs: return CGFloat(12)
        case .iconSm: return CGFloat(16)
        case .iconMd: return CGFloat(24)
        case .iconLg: return CGFloat(32)
        case .iconXl: return CGFloat(48)
        case .iconTwoXl: return CGFloat(64)
        case .buttonHeightRegular: return CGFloat(48)
        case .buttonHeightMedium: return CGFloat(36)
        case .buttonHeightSmall: return CGFloat(34)
        case .buttonHeightLinkRegular: return CGFloat(40)
        case .buttonHeightLinkMedium: return CGFloat(24)
        case .buttonHeightLinkSmall: return CGFloat(22)
        case .buttonOnlyIconSize: return CGFloat(48)
        case .buttonMinWidthSm: return CGFloat(64)
        case .buttonMinWidthMd: return CGFloat(80)
        case .buttonMinWidthLg: return CGFloat(120)
        case .inputHeightSm: return CGFloat(32)
        case .inputHeightMd: return CGFloat(40)
        case .inputHeightLg: return CGFloat(48)
        case .inputHeightXl: return CGFloat(56)
        case .touchTargetMin: return CGFloat(44)
        case .touchTargetComfortable: return CGFloat(48)
        case .touchTargetSpacious: return CGFloat(56)
        case .containerXs: return CGFloat(320)
        case .containerSm: return CGFloat(480)
        case .containerMd: return CGFloat(768)
        case .containerLg: return CGFloat(1024)
        case .containerXl: return CGFloat(1280)
        case .containerTwoXl: return CGFloat(1536)
        }
    }
}

public extension DodadaSizingToken {
    func toCGFloat(using theme: DDDTheme = DDDThemeManager.shared.main) -> CGFloat {
        theme.foundation.sizing.value(for: self)
    }
}

public protocol DodadaThemeSizingTokens {
    static var iconXs: CGFloat { get }
    static var iconSm: CGFloat { get }
    static var iconMd: CGFloat { get }
    static var iconLg: CGFloat { get }
    static var iconXl: CGFloat { get }
    static var iconTwoXl: CGFloat { get }
    static var buttonHeightRegular: CGFloat { get }
    static var buttonHeightMedium: CGFloat { get }
    static var buttonHeightSmall: CGFloat { get }
    static var buttonHeightLinkRegular: CGFloat { get }
    static var buttonHeightLinkMedium: CGFloat { get }
    static var buttonHeightLinkSmall: CGFloat { get }
    static var buttonOnlyIconSize: CGFloat { get }
    static var buttonMinWidthSm: CGFloat { get }
    static var buttonMinWidthMd: CGFloat { get }
    static var buttonMinWidthLg: CGFloat { get }
    static var inputHeightSm: CGFloat { get }
    static var inputHeightMd: CGFloat { get }
    static var inputHeightLg: CGFloat { get }
    static var inputHeightXl: CGFloat { get }
    static var touchTargetMin: CGFloat { get }
    static var touchTargetComfortable: CGFloat { get }
    static var touchTargetSpacious: CGFloat { get }
    static var containerXs: CGFloat { get }
    static var containerSm: CGFloat { get }
    static var containerMd: CGFloat { get }
    static var containerLg: CGFloat { get }
    static var containerXl: CGFloat { get }
    static var containerTwoXl: CGFloat { get }
    func value(for token: DodadaSizingToken) -> CGFloat
}

public struct DodadaThemeSizingTokensDefault: DodadaThemeSizingTokens {
    public static var iconXs: CGFloat { DodadaSizingToken.iconXs.value }
    public static var iconSm: CGFloat { DodadaSizingToken.iconSm.value }
    public static var iconMd: CGFloat { DodadaSizingToken.iconMd.value }
    public static var iconLg: CGFloat { DodadaSizingToken.iconLg.value }
    public static var iconXl: CGFloat { DodadaSizingToken.iconXl.value }
    public static var iconTwoXl: CGFloat { DodadaSizingToken.iconTwoXl.value }
    public static var buttonHeightRegular: CGFloat { DodadaSizingToken.buttonHeightRegular.value }
    public static var buttonHeightMedium: CGFloat { DodadaSizingToken.buttonHeightMedium.value }
    public static var buttonHeightSmall: CGFloat { DodadaSizingToken.buttonHeightSmall.value }
    public static var buttonHeightLinkRegular: CGFloat { DodadaSizingToken.buttonHeightLinkRegular.value }
    public static var buttonHeightLinkMedium: CGFloat { DodadaSizingToken.buttonHeightLinkMedium.value }
    public static var buttonHeightLinkSmall: CGFloat { DodadaSizingToken.buttonHeightLinkSmall.value }
    public static var buttonOnlyIconSize: CGFloat { DodadaSizingToken.buttonOnlyIconSize.value }
    public static var buttonMinWidthSm: CGFloat { DodadaSizingToken.buttonMinWidthSm.value }
    public static var buttonMinWidthMd: CGFloat { DodadaSizingToken.buttonMinWidthMd.value }
    public static var buttonMinWidthLg: CGFloat { DodadaSizingToken.buttonMinWidthLg.value }
    public static var inputHeightSm: CGFloat { DodadaSizingToken.inputHeightSm.value }
    public static var inputHeightMd: CGFloat { DodadaSizingToken.inputHeightMd.value }
    public static var inputHeightLg: CGFloat { DodadaSizingToken.inputHeightLg.value }
    public static var inputHeightXl: CGFloat { DodadaSizingToken.inputHeightXl.value }
    public static var touchTargetMin: CGFloat { DodadaSizingToken.touchTargetMin.value }
    public static var touchTargetComfortable: CGFloat { DodadaSizingToken.touchTargetComfortable.value }
    public static var touchTargetSpacious: CGFloat { DodadaSizingToken.touchTargetSpacious.value }
    public static var containerXs: CGFloat { DodadaSizingToken.containerXs.value }
    public static var containerSm: CGFloat { DodadaSizingToken.containerSm.value }
    public static var containerMd: CGFloat { DodadaSizingToken.containerMd.value }
    public static var containerLg: CGFloat { DodadaSizingToken.containerLg.value }
    public static var containerXl: CGFloat { DodadaSizingToken.containerXl.value }
    public static var containerTwoXl: CGFloat { DodadaSizingToken.containerTwoXl.value }
    public func value(for token: DodadaSizingToken) -> CGFloat {
        switch token {
        case .iconXs: return Self.iconXs
        case .iconSm: return Self.iconSm
        case .iconMd: return Self.iconMd
        case .iconLg: return Self.iconLg
        case .iconXl: return Self.iconXl
        case .iconTwoXl: return Self.iconTwoXl
        case .buttonHeightRegular: return Self.buttonHeightRegular
        case .buttonHeightMedium: return Self.buttonHeightMedium
        case .buttonHeightSmall: return Self.buttonHeightSmall
        case .buttonHeightLinkRegular: return Self.buttonHeightLinkRegular
        case .buttonHeightLinkMedium: return Self.buttonHeightLinkMedium
        case .buttonHeightLinkSmall: return Self.buttonHeightLinkSmall
        case .buttonOnlyIconSize: return Self.buttonOnlyIconSize
        case .buttonMinWidthSm: return Self.buttonMinWidthSm
        case .buttonMinWidthMd: return Self.buttonMinWidthMd
        case .buttonMinWidthLg: return Self.buttonMinWidthLg
        case .inputHeightSm: return Self.inputHeightSm
        case .inputHeightMd: return Self.inputHeightMd
        case .inputHeightLg: return Self.inputHeightLg
        case .inputHeightXl: return Self.inputHeightXl
        case .touchTargetMin: return Self.touchTargetMin
        case .touchTargetComfortable: return Self.touchTargetComfortable
        case .touchTargetSpacious: return Self.touchTargetSpacious
        case .containerXs: return Self.containerXs
        case .containerSm: return Self.containerSm
        case .containerMd: return Self.containerMd
        case .containerLg: return Self.containerLg
        case .containerXl: return Self.containerXl
        case .containerTwoXl: return Self.containerTwoXl
        }
    }
}
