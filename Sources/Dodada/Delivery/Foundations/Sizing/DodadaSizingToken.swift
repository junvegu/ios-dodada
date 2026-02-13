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
        let themeSizing = theme.foundation.sizing
        switch self {
        case .iconXs: return themeSizing.iconXs
        case .iconSm: return themeSizing.iconSm
        case .iconMd: return themeSizing.iconMd
        case .iconLg: return themeSizing.iconLg
        case .iconXl: return themeSizing.iconXl
        case .iconTwoXl: return themeSizing.iconTwoXl
        case .buttonHeightRegular: return themeSizing.buttonHeightRegular
        case .buttonHeightMedium: return themeSizing.buttonHeightMedium
        case .buttonHeightSmall: return themeSizing.buttonHeightSmall
        case .buttonHeightLinkRegular: return themeSizing.buttonHeightLinkRegular
        case .buttonHeightLinkMedium: return themeSizing.buttonHeightLinkMedium
        case .buttonHeightLinkSmall: return themeSizing.buttonHeightLinkSmall
        case .buttonOnlyIconSize: return themeSizing.buttonOnlyIconSize
        case .buttonMinWidthSm: return themeSizing.buttonMinWidthSm
        case .buttonMinWidthMd: return themeSizing.buttonMinWidthMd
        case .buttonMinWidthLg: return themeSizing.buttonMinWidthLg
        case .inputHeightSm: return themeSizing.inputHeightSm
        case .inputHeightMd: return themeSizing.inputHeightMd
        case .inputHeightLg: return themeSizing.inputHeightLg
        case .inputHeightXl: return themeSizing.inputHeightXl
        case .touchTargetMin: return themeSizing.touchTargetMin
        case .touchTargetComfortable: return themeSizing.touchTargetComfortable
        case .touchTargetSpacious: return themeSizing.touchTargetSpacious
        case .containerXs: return themeSizing.containerXs
        case .containerSm: return themeSizing.containerSm
        case .containerMd: return themeSizing.containerMd
        case .containerLg: return themeSizing.containerLg
        case .containerXl: return themeSizing.containerXl
        case .containerTwoXl: return themeSizing.containerTwoXl
        }
    }
}

public protocol DodadaThemeSizingTokens {
    var iconXs: CGFloat { get }
    var iconSm: CGFloat { get }
    var iconMd: CGFloat { get }
    var iconLg: CGFloat { get }
    var iconXl: CGFloat { get }
    var iconTwoXl: CGFloat { get }
    var buttonHeightRegular: CGFloat { get }
    var buttonHeightMedium: CGFloat { get }
    var buttonHeightSmall: CGFloat { get }
    var buttonHeightLinkRegular: CGFloat { get }
    var buttonHeightLinkMedium: CGFloat { get }
    var buttonHeightLinkSmall: CGFloat { get }
    var buttonOnlyIconSize: CGFloat { get }
    var buttonMinWidthSm: CGFloat { get }
    var buttonMinWidthMd: CGFloat { get }
    var buttonMinWidthLg: CGFloat { get }
    var inputHeightSm: CGFloat { get }
    var inputHeightMd: CGFloat { get }
    var inputHeightLg: CGFloat { get }
    var inputHeightXl: CGFloat { get }
    var touchTargetMin: CGFloat { get }
    var touchTargetComfortable: CGFloat { get }
    var touchTargetSpacious: CGFloat { get }
    var containerXs: CGFloat { get }
    var containerSm: CGFloat { get }
    var containerMd: CGFloat { get }
    var containerLg: CGFloat { get }
    var containerXl: CGFloat { get }
    var containerTwoXl: CGFloat { get }
    func value(for token: DodadaSizingToken) -> CGFloat
}

public struct DodadaThemeSizingTokensDefault: DodadaThemeSizingTokens {
    public var iconXs: CGFloat { DodadaSizingToken.iconXs.value }
    public var iconSm: CGFloat { DodadaSizingToken.iconSm.value }
    public var iconMd: CGFloat { DodadaSizingToken.iconMd.value }
    public var iconLg: CGFloat { DodadaSizingToken.iconLg.value }
    public var iconXl: CGFloat { DodadaSizingToken.iconXl.value }
    public var iconTwoXl: CGFloat { DodadaSizingToken.iconTwoXl.value }
    public var buttonHeightRegular: CGFloat { DodadaSizingToken.buttonHeightRegular.value }
    public var buttonHeightMedium: CGFloat { DodadaSizingToken.buttonHeightMedium.value }
    public var buttonHeightSmall: CGFloat { DodadaSizingToken.buttonHeightSmall.value }
    public var buttonHeightLinkRegular: CGFloat { DodadaSizingToken.buttonHeightLinkRegular.value }
    public var buttonHeightLinkMedium: CGFloat { DodadaSizingToken.buttonHeightLinkMedium.value }
    public var buttonHeightLinkSmall: CGFloat { DodadaSizingToken.buttonHeightLinkSmall.value }
    public var buttonOnlyIconSize: CGFloat { DodadaSizingToken.buttonOnlyIconSize.value }
    public var buttonMinWidthSm: CGFloat { DodadaSizingToken.buttonMinWidthSm.value }
    public var buttonMinWidthMd: CGFloat { DodadaSizingToken.buttonMinWidthMd.value }
    public var buttonMinWidthLg: CGFloat { DodadaSizingToken.buttonMinWidthLg.value }
    public var inputHeightSm: CGFloat { DodadaSizingToken.inputHeightSm.value }
    public var inputHeightMd: CGFloat { DodadaSizingToken.inputHeightMd.value }
    public var inputHeightLg: CGFloat { DodadaSizingToken.inputHeightLg.value }
    public var inputHeightXl: CGFloat { DodadaSizingToken.inputHeightXl.value }
    public var touchTargetMin: CGFloat { DodadaSizingToken.touchTargetMin.value }
    public var touchTargetComfortable: CGFloat { DodadaSizingToken.touchTargetComfortable.value }
    public var touchTargetSpacious: CGFloat { DodadaSizingToken.touchTargetSpacious.value }
    public var containerXs: CGFloat { DodadaSizingToken.containerXs.value }
    public var containerSm: CGFloat { DodadaSizingToken.containerSm.value }
    public var containerMd: CGFloat { DodadaSizingToken.containerMd.value }
    public var containerLg: CGFloat { DodadaSizingToken.containerLg.value }
    public var containerXl: CGFloat { DodadaSizingToken.containerXl.value }
    public var containerTwoXl: CGFloat { DodadaSizingToken.containerTwoXl.value }
    public func value(for token: DodadaSizingToken) -> CGFloat {
        switch token {
        case .iconXs: return iconXs
        case .iconSm: return iconSm
        case .iconMd: return iconMd
        case .iconLg: return iconLg
        case .iconXl: return iconXl
        case .iconTwoXl: return iconTwoXl
        case .buttonHeightRegular: return buttonHeightRegular
        case .buttonHeightMedium: return buttonHeightMedium
        case .buttonHeightSmall: return buttonHeightSmall
        case .buttonHeightLinkRegular: return buttonHeightLinkRegular
        case .buttonHeightLinkMedium: return buttonHeightLinkMedium
        case .buttonHeightLinkSmall: return buttonHeightLinkSmall
        case .buttonOnlyIconSize: return buttonOnlyIconSize
        case .buttonMinWidthSm: return buttonMinWidthSm
        case .buttonMinWidthMd: return buttonMinWidthMd
        case .buttonMinWidthLg: return buttonMinWidthLg
        case .inputHeightSm: return inputHeightSm
        case .inputHeightMd: return inputHeightMd
        case .inputHeightLg: return inputHeightLg
        case .inputHeightXl: return inputHeightXl
        case .touchTargetMin: return touchTargetMin
        case .touchTargetComfortable: return touchTargetComfortable
        case .touchTargetSpacious: return touchTargetSpacious
        case .containerXs: return containerXs
        case .containerSm: return containerSm
        case .containerMd: return containerMd
        case .containerLg: return containerLg
        case .containerXl: return containerXl
        case .containerTwoXl: return containerTwoXl
        }
    }
}
