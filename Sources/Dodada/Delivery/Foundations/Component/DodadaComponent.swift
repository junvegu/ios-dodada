// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaComponent: CaseIterable {
    case buttonHeightRegular
    case buttonHeightMedium
    case buttonHeightSmall
    case buttonHeightLinkRegular
    case buttonHeightLinkMedium
    case buttonHeightLinkSmall
    case buttonOnlyIconSize
    case buttonPaddingHorizontalSm
    case buttonPaddingHorizontalMd
    case buttonPaddingHorizontalLg
    case buttonPaddingHorizontalLink
    case buttonPaddingVerticalSm
    case buttonPaddingVerticalMd
    case buttonPaddingVerticalLg
    case buttonRadiusSm
    case buttonRadiusMd
    case buttonRadiusLg
    case buttonRadiusFull
    case buttonGap
    case buttonMinWidthSm
    case buttonMinWidthMd
    case buttonMinWidthLg
    case cardPaddingSm
    case cardPaddingMd
    case cardPaddingLg
    case cardRadiusSm
    case cardRadiusMd
    case cardRadiusLg
    case cardRadiusXl
    case cardGapSm
    case cardGapMd
    case cardGapLg
    case cardElevation
    case inputHeightSm
    case inputHeightMd
    case inputHeightLg
    case inputHeightXl
    case inputPaddingHorizontalSm
    case inputPaddingHorizontalMd
    case inputPaddingHorizontalLg
    case inputRadiusSm
    case inputRadiusMd
    case inputRadiusLg
    case inputGap
    case chipHeightSm
    case chipHeightMd
    case chipPaddingHorizontalSm
    case chipPaddingHorizontalMd
    case chipRadius
    case chipGap
    case avatarSizeXs
    case avatarSizeSm
    case avatarSizeMd
    case avatarSizeLg
    case avatarSizeXl
    case avatarSizeTwoXl
    case avatarRadius
    case modalPaddingSm
    case modalPaddingMd
    case modalPaddingLg
    case modalRadiusSm
    case modalRadiusMd
    case modalRadiusLg
    case modalElevation
    case dividerThicknessThin
    case dividerThicknessMedium
    case dividerThicknessThick
    case dividerSpacing
    case listItemHeightSm
    case listItemHeightMd
    case listItemHeightLg
    case listItemHeightXl
    case listItemPaddingHorizontal
    case listItemGap
}

extension DodadaComponent {
    public var value: CGFloat {
        switch self {
        case .buttonHeightRegular: return CGFloat(48)
        case .buttonHeightMedium: return CGFloat(36)
        case .buttonHeightSmall: return CGFloat(34)
        case .buttonHeightLinkRegular: return CGFloat(40)
        case .buttonHeightLinkMedium: return CGFloat(24)
        case .buttonHeightLinkSmall: return CGFloat(22)
        case .buttonOnlyIconSize: return CGFloat(48)
        case .buttonPaddingHorizontalSm: return CGFloat(24)
        case .buttonPaddingHorizontalMd: return CGFloat(24)
        case .buttonPaddingHorizontalLg: return CGFloat(24)
        case .buttonPaddingHorizontalLink: return CGFloat(0)
        case .buttonPaddingVerticalSm: return CGFloat(8)
        case .buttonPaddingVerticalMd: return CGFloat(12)
        case .buttonPaddingVerticalLg: return CGFloat(16)
        case .buttonRadiusSm: return CGFloat(4)
        case .buttonRadiusMd: return CGFloat(8)
        case .buttonRadiusLg: return CGFloat(12)
        case .buttonRadiusFull: return CGFloat(9999)
        case .buttonGap: return CGFloat(8)
        case .buttonMinWidthSm: return CGFloat(64)
        case .buttonMinWidthMd: return CGFloat(80)
        case .buttonMinWidthLg: return CGFloat(120)
        case .cardPaddingSm: return CGFloat(12)
        case .cardPaddingMd: return CGFloat(16)
        case .cardPaddingLg: return CGFloat(24)
        case .cardRadiusSm: return CGFloat(4)
        case .cardRadiusMd: return CGFloat(8)
        case .cardRadiusLg: return CGFloat(12)
        case .cardRadiusXl: return CGFloat(16)
        case .cardGapSm: return CGFloat(8)
        case .cardGapMd: return CGFloat(12)
        case .cardGapLg: return CGFloat(16)
        case .cardElevation: return CGFloat(1)
        case .inputHeightSm: return CGFloat(32)
        case .inputHeightMd: return CGFloat(40)
        case .inputHeightLg: return CGFloat(48)
        case .inputHeightXl: return CGFloat(56)
        case .inputPaddingHorizontalSm: return CGFloat(8)
        case .inputPaddingHorizontalMd: return CGFloat(12)
        case .inputPaddingHorizontalLg: return CGFloat(16)
        case .inputRadiusSm: return CGFloat(4)
        case .inputRadiusMd: return CGFloat(8)
        case .inputRadiusLg: return CGFloat(12)
        case .inputGap: return CGFloat(8)
        case .chipHeightSm: return CGFloat(24)
        case .chipHeightMd: return CGFloat(32)
        case .chipPaddingHorizontalSm: return CGFloat(8)
        case .chipPaddingHorizontalMd: return CGFloat(12)
        case .chipRadius: return CGFloat(9999)
        case .chipGap: return CGFloat(4)
        case .avatarSizeXs: return CGFloat(24)
        case .avatarSizeSm: return CGFloat(32)
        case .avatarSizeMd: return CGFloat(40)
        case .avatarSizeLg: return CGFloat(48)
        case .avatarSizeXl: return CGFloat(64)
        case .avatarSizeTwoXl: return CGFloat(96)
        case .avatarRadius: return CGFloat(9999)
        case .modalPaddingSm: return CGFloat(16)
        case .modalPaddingMd: return CGFloat(24)
        case .modalPaddingLg: return CGFloat(32)
        case .modalRadiusSm: return CGFloat(8)
        case .modalRadiusMd: return CGFloat(12)
        case .modalRadiusLg: return CGFloat(16)
        case .modalElevation: return CGFloat(3)
        case .dividerThicknessThin: return CGFloat(1)
        case .dividerThicknessMedium: return CGFloat(2)
        case .dividerThicknessThick: return CGFloat(4)
        case .dividerSpacing: return CGFloat(12)
        case .listItemHeightSm: return CGFloat(40)
        case .listItemHeightMd: return CGFloat(48)
        case .listItemHeightLg: return CGFloat(56)
        case .listItemHeightXl: return CGFloat(64)
        case .listItemPaddingHorizontal: return CGFloat(16)
        case .listItemGap: return CGFloat(12)
        }
    }
}

public protocol DodadaComponentTokens {
    static var buttonHeightRegular: CGFloat { get }
    static var buttonHeightMedium: CGFloat { get }
    static var buttonHeightSmall: CGFloat { get }
    static var buttonHeightLinkRegular: CGFloat { get }
    static var buttonHeightLinkMedium: CGFloat { get }
    static var buttonHeightLinkSmall: CGFloat { get }
    static var buttonOnlyIconSize: CGFloat { get }
    static var buttonPaddingHorizontalSm: CGFloat { get }
    static var buttonPaddingHorizontalMd: CGFloat { get }
    static var buttonPaddingHorizontalLg: CGFloat { get }
    static var buttonPaddingHorizontalLink: CGFloat { get }
    static var buttonPaddingVerticalSm: CGFloat { get }
    static var buttonPaddingVerticalMd: CGFloat { get }
    static var buttonPaddingVerticalLg: CGFloat { get }
    static var buttonRadiusSm: CGFloat { get }
    static var buttonRadiusMd: CGFloat { get }
    static var buttonRadiusLg: CGFloat { get }
    static var buttonRadiusFull: CGFloat { get }
    static var buttonGap: CGFloat { get }
    static var buttonMinWidthSm: CGFloat { get }
    static var buttonMinWidthMd: CGFloat { get }
    static var buttonMinWidthLg: CGFloat { get }
    static var cardPaddingSm: CGFloat { get }
    static var cardPaddingMd: CGFloat { get }
    static var cardPaddingLg: CGFloat { get }
    static var cardRadiusSm: CGFloat { get }
    static var cardRadiusMd: CGFloat { get }
    static var cardRadiusLg: CGFloat { get }
    static var cardRadiusXl: CGFloat { get }
    static var cardGapSm: CGFloat { get }
    static var cardGapMd: CGFloat { get }
    static var cardGapLg: CGFloat { get }
    static var cardElevation: CGFloat { get }
    static var inputHeightSm: CGFloat { get }
    static var inputHeightMd: CGFloat { get }
    static var inputHeightLg: CGFloat { get }
    static var inputHeightXl: CGFloat { get }
    static var inputPaddingHorizontalSm: CGFloat { get }
    static var inputPaddingHorizontalMd: CGFloat { get }
    static var inputPaddingHorizontalLg: CGFloat { get }
    static var inputRadiusSm: CGFloat { get }
    static var inputRadiusMd: CGFloat { get }
    static var inputRadiusLg: CGFloat { get }
    static var inputGap: CGFloat { get }
    static var chipHeightSm: CGFloat { get }
    static var chipHeightMd: CGFloat { get }
    static var chipPaddingHorizontalSm: CGFloat { get }
    static var chipPaddingHorizontalMd: CGFloat { get }
    static var chipRadius: CGFloat { get }
    static var chipGap: CGFloat { get }
    static var avatarSizeXs: CGFloat { get }
    static var avatarSizeSm: CGFloat { get }
    static var avatarSizeMd: CGFloat { get }
    static var avatarSizeLg: CGFloat { get }
    static var avatarSizeXl: CGFloat { get }
    static var avatarSizeTwoXl: CGFloat { get }
    static var avatarRadius: CGFloat { get }
    static var modalPaddingSm: CGFloat { get }
    static var modalPaddingMd: CGFloat { get }
    static var modalPaddingLg: CGFloat { get }
    static var modalRadiusSm: CGFloat { get }
    static var modalRadiusMd: CGFloat { get }
    static var modalRadiusLg: CGFloat { get }
    static var modalElevation: CGFloat { get }
    static var dividerThicknessThin: CGFloat { get }
    static var dividerThicknessMedium: CGFloat { get }
    static var dividerThicknessThick: CGFloat { get }
    static var dividerSpacing: CGFloat { get }
    static var listItemHeightSm: CGFloat { get }
    static var listItemHeightMd: CGFloat { get }
    static var listItemHeightLg: CGFloat { get }
    static var listItemHeightXl: CGFloat { get }
    static var listItemPaddingHorizontal: CGFloat { get }
    static var listItemGap: CGFloat { get }
    func value(for token: DodadaComponent) -> CGFloat
}

public struct DodadaThemeComponentTokens: DodadaComponentTokens {
    public static var buttonHeightRegular: CGFloat { DodadaComponent.buttonHeightRegular.value }
    public static var buttonHeightMedium: CGFloat { DodadaComponent.buttonHeightMedium.value }
    public static var buttonHeightSmall: CGFloat { DodadaComponent.buttonHeightSmall.value }
    public static var buttonHeightLinkRegular: CGFloat { DodadaComponent.buttonHeightLinkRegular.value }
    public static var buttonHeightLinkMedium: CGFloat { DodadaComponent.buttonHeightLinkMedium.value }
    public static var buttonHeightLinkSmall: CGFloat { DodadaComponent.buttonHeightLinkSmall.value }
    public static var buttonOnlyIconSize: CGFloat { DodadaComponent.buttonOnlyIconSize.value }
    public static var buttonPaddingHorizontalSm: CGFloat { DodadaComponent.buttonPaddingHorizontalSm.value }
    public static var buttonPaddingHorizontalMd: CGFloat { DodadaComponent.buttonPaddingHorizontalMd.value }
    public static var buttonPaddingHorizontalLg: CGFloat { DodadaComponent.buttonPaddingHorizontalLg.value }
    public static var buttonPaddingHorizontalLink: CGFloat { DodadaComponent.buttonPaddingHorizontalLink.value }
    public static var buttonPaddingVerticalSm: CGFloat { DodadaComponent.buttonPaddingVerticalSm.value }
    public static var buttonPaddingVerticalMd: CGFloat { DodadaComponent.buttonPaddingVerticalMd.value }
    public static var buttonPaddingVerticalLg: CGFloat { DodadaComponent.buttonPaddingVerticalLg.value }
    public static var buttonRadiusSm: CGFloat { DodadaComponent.buttonRadiusSm.value }
    public static var buttonRadiusMd: CGFloat { DodadaComponent.buttonRadiusMd.value }
    public static var buttonRadiusLg: CGFloat { DodadaComponent.buttonRadiusLg.value }
    public static var buttonRadiusFull: CGFloat { DodadaComponent.buttonRadiusFull.value }
    public static var buttonGap: CGFloat { DodadaComponent.buttonGap.value }
    public static var buttonMinWidthSm: CGFloat { DodadaComponent.buttonMinWidthSm.value }
    public static var buttonMinWidthMd: CGFloat { DodadaComponent.buttonMinWidthMd.value }
    public static var buttonMinWidthLg: CGFloat { DodadaComponent.buttonMinWidthLg.value }
    public static var cardPaddingSm: CGFloat { DodadaComponent.cardPaddingSm.value }
    public static var cardPaddingMd: CGFloat { DodadaComponent.cardPaddingMd.value }
    public static var cardPaddingLg: CGFloat { DodadaComponent.cardPaddingLg.value }
    public static var cardRadiusSm: CGFloat { DodadaComponent.cardRadiusSm.value }
    public static var cardRadiusMd: CGFloat { DodadaComponent.cardRadiusMd.value }
    public static var cardRadiusLg: CGFloat { DodadaComponent.cardRadiusLg.value }
    public static var cardRadiusXl: CGFloat { DodadaComponent.cardRadiusXl.value }
    public static var cardGapSm: CGFloat { DodadaComponent.cardGapSm.value }
    public static var cardGapMd: CGFloat { DodadaComponent.cardGapMd.value }
    public static var cardGapLg: CGFloat { DodadaComponent.cardGapLg.value }
    public static var cardElevation: CGFloat { DodadaComponent.cardElevation.value }
    public static var inputHeightSm: CGFloat { DodadaComponent.inputHeightSm.value }
    public static var inputHeightMd: CGFloat { DodadaComponent.inputHeightMd.value }
    public static var inputHeightLg: CGFloat { DodadaComponent.inputHeightLg.value }
    public static var inputHeightXl: CGFloat { DodadaComponent.inputHeightXl.value }
    public static var inputPaddingHorizontalSm: CGFloat { DodadaComponent.inputPaddingHorizontalSm.value }
    public static var inputPaddingHorizontalMd: CGFloat { DodadaComponent.inputPaddingHorizontalMd.value }
    public static var inputPaddingHorizontalLg: CGFloat { DodadaComponent.inputPaddingHorizontalLg.value }
    public static var inputRadiusSm: CGFloat { DodadaComponent.inputRadiusSm.value }
    public static var inputRadiusMd: CGFloat { DodadaComponent.inputRadiusMd.value }
    public static var inputRadiusLg: CGFloat { DodadaComponent.inputRadiusLg.value }
    public static var inputGap: CGFloat { DodadaComponent.inputGap.value }
    public static var chipHeightSm: CGFloat { DodadaComponent.chipHeightSm.value }
    public static var chipHeightMd: CGFloat { DodadaComponent.chipHeightMd.value }
    public static var chipPaddingHorizontalSm: CGFloat { DodadaComponent.chipPaddingHorizontalSm.value }
    public static var chipPaddingHorizontalMd: CGFloat { DodadaComponent.chipPaddingHorizontalMd.value }
    public static var chipRadius: CGFloat { DodadaComponent.chipRadius.value }
    public static var chipGap: CGFloat { DodadaComponent.chipGap.value }
    public static var avatarSizeXs: CGFloat { DodadaComponent.avatarSizeXs.value }
    public static var avatarSizeSm: CGFloat { DodadaComponent.avatarSizeSm.value }
    public static var avatarSizeMd: CGFloat { DodadaComponent.avatarSizeMd.value }
    public static var avatarSizeLg: CGFloat { DodadaComponent.avatarSizeLg.value }
    public static var avatarSizeXl: CGFloat { DodadaComponent.avatarSizeXl.value }
    public static var avatarSizeTwoXl: CGFloat { DodadaComponent.avatarSizeTwoXl.value }
    public static var avatarRadius: CGFloat { DodadaComponent.avatarRadius.value }
    public static var modalPaddingSm: CGFloat { DodadaComponent.modalPaddingSm.value }
    public static var modalPaddingMd: CGFloat { DodadaComponent.modalPaddingMd.value }
    public static var modalPaddingLg: CGFloat { DodadaComponent.modalPaddingLg.value }
    public static var modalRadiusSm: CGFloat { DodadaComponent.modalRadiusSm.value }
    public static var modalRadiusMd: CGFloat { DodadaComponent.modalRadiusMd.value }
    public static var modalRadiusLg: CGFloat { DodadaComponent.modalRadiusLg.value }
    public static var modalElevation: CGFloat { DodadaComponent.modalElevation.value }
    public static var dividerThicknessThin: CGFloat { DodadaComponent.dividerThicknessThin.value }
    public static var dividerThicknessMedium: CGFloat { DodadaComponent.dividerThicknessMedium.value }
    public static var dividerThicknessThick: CGFloat { DodadaComponent.dividerThicknessThick.value }
    public static var dividerSpacing: CGFloat { DodadaComponent.dividerSpacing.value }
    public static var listItemHeightSm: CGFloat { DodadaComponent.listItemHeightSm.value }
    public static var listItemHeightMd: CGFloat { DodadaComponent.listItemHeightMd.value }
    public static var listItemHeightLg: CGFloat { DodadaComponent.listItemHeightLg.value }
    public static var listItemHeightXl: CGFloat { DodadaComponent.listItemHeightXl.value }
    public static var listItemPaddingHorizontal: CGFloat { DodadaComponent.listItemPaddingHorizontal.value }
    public static var listItemGap: CGFloat { DodadaComponent.listItemGap.value }
    public func value(for token: DodadaComponent) -> CGFloat {
        switch token {
        case .buttonHeightRegular: return Self.buttonHeightRegular
        case .buttonHeightMedium: return Self.buttonHeightMedium
        case .buttonHeightSmall: return Self.buttonHeightSmall
        case .buttonHeightLinkRegular: return Self.buttonHeightLinkRegular
        case .buttonHeightLinkMedium: return Self.buttonHeightLinkMedium
        case .buttonHeightLinkSmall: return Self.buttonHeightLinkSmall
        case .buttonOnlyIconSize: return Self.buttonOnlyIconSize
        case .buttonPaddingHorizontalSm: return Self.buttonPaddingHorizontalSm
        case .buttonPaddingHorizontalMd: return Self.buttonPaddingHorizontalMd
        case .buttonPaddingHorizontalLg: return Self.buttonPaddingHorizontalLg
        case .buttonPaddingHorizontalLink: return Self.buttonPaddingHorizontalLink
        case .buttonPaddingVerticalSm: return Self.buttonPaddingVerticalSm
        case .buttonPaddingVerticalMd: return Self.buttonPaddingVerticalMd
        case .buttonPaddingVerticalLg: return Self.buttonPaddingVerticalLg
        case .buttonRadiusSm: return Self.buttonRadiusSm
        case .buttonRadiusMd: return Self.buttonRadiusMd
        case .buttonRadiusLg: return Self.buttonRadiusLg
        case .buttonRadiusFull: return Self.buttonRadiusFull
        case .buttonGap: return Self.buttonGap
        case .buttonMinWidthSm: return Self.buttonMinWidthSm
        case .buttonMinWidthMd: return Self.buttonMinWidthMd
        case .buttonMinWidthLg: return Self.buttonMinWidthLg
        case .cardPaddingSm: return Self.cardPaddingSm
        case .cardPaddingMd: return Self.cardPaddingMd
        case .cardPaddingLg: return Self.cardPaddingLg
        case .cardRadiusSm: return Self.cardRadiusSm
        case .cardRadiusMd: return Self.cardRadiusMd
        case .cardRadiusLg: return Self.cardRadiusLg
        case .cardRadiusXl: return Self.cardRadiusXl
        case .cardGapSm: return Self.cardGapSm
        case .cardGapMd: return Self.cardGapMd
        case .cardGapLg: return Self.cardGapLg
        case .cardElevation: return Self.cardElevation
        case .inputHeightSm: return Self.inputHeightSm
        case .inputHeightMd: return Self.inputHeightMd
        case .inputHeightLg: return Self.inputHeightLg
        case .inputHeightXl: return Self.inputHeightXl
        case .inputPaddingHorizontalSm: return Self.inputPaddingHorizontalSm
        case .inputPaddingHorizontalMd: return Self.inputPaddingHorizontalMd
        case .inputPaddingHorizontalLg: return Self.inputPaddingHorizontalLg
        case .inputRadiusSm: return Self.inputRadiusSm
        case .inputRadiusMd: return Self.inputRadiusMd
        case .inputRadiusLg: return Self.inputRadiusLg
        case .inputGap: return Self.inputGap
        case .chipHeightSm: return Self.chipHeightSm
        case .chipHeightMd: return Self.chipHeightMd
        case .chipPaddingHorizontalSm: return Self.chipPaddingHorizontalSm
        case .chipPaddingHorizontalMd: return Self.chipPaddingHorizontalMd
        case .chipRadius: return Self.chipRadius
        case .chipGap: return Self.chipGap
        case .avatarSizeXs: return Self.avatarSizeXs
        case .avatarSizeSm: return Self.avatarSizeSm
        case .avatarSizeMd: return Self.avatarSizeMd
        case .avatarSizeLg: return Self.avatarSizeLg
        case .avatarSizeXl: return Self.avatarSizeXl
        case .avatarSizeTwoXl: return Self.avatarSizeTwoXl
        case .avatarRadius: return Self.avatarRadius
        case .modalPaddingSm: return Self.modalPaddingSm
        case .modalPaddingMd: return Self.modalPaddingMd
        case .modalPaddingLg: return Self.modalPaddingLg
        case .modalRadiusSm: return Self.modalRadiusSm
        case .modalRadiusMd: return Self.modalRadiusMd
        case .modalRadiusLg: return Self.modalRadiusLg
        case .modalElevation: return Self.modalElevation
        case .dividerThicknessThin: return Self.dividerThicknessThin
        case .dividerThicknessMedium: return Self.dividerThicknessMedium
        case .dividerThicknessThick: return Self.dividerThicknessThick
        case .dividerSpacing: return Self.dividerSpacing
        case .listItemHeightSm: return Self.listItemHeightSm
        case .listItemHeightMd: return Self.listItemHeightMd
        case .listItemHeightLg: return Self.listItemHeightLg
        case .listItemHeightXl: return Self.listItemHeightXl
        case .listItemPaddingHorizontal: return Self.listItemPaddingHorizontal
        case .listItemGap: return Self.listItemGap
        }
    }
}
