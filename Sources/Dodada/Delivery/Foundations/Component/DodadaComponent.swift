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
    var buttonHeightRegular: CGFloat { get }
    var buttonHeightMedium: CGFloat { get }
    var buttonHeightSmall: CGFloat { get }
    var buttonHeightLinkRegular: CGFloat { get }
    var buttonHeightLinkMedium: CGFloat { get }
    var buttonHeightLinkSmall: CGFloat { get }
    var buttonOnlyIconSize: CGFloat { get }
    var buttonPaddingHorizontalSm: CGFloat { get }
    var buttonPaddingHorizontalMd: CGFloat { get }
    var buttonPaddingHorizontalLg: CGFloat { get }
    var buttonPaddingHorizontalLink: CGFloat { get }
    var buttonPaddingVerticalSm: CGFloat { get }
    var buttonPaddingVerticalMd: CGFloat { get }
    var buttonPaddingVerticalLg: CGFloat { get }
    var buttonRadiusSm: CGFloat { get }
    var buttonRadiusMd: CGFloat { get }
    var buttonRadiusLg: CGFloat { get }
    var buttonRadiusFull: CGFloat { get }
    var buttonGap: CGFloat { get }
    var buttonMinWidthSm: CGFloat { get }
    var buttonMinWidthMd: CGFloat { get }
    var buttonMinWidthLg: CGFloat { get }
    var cardPaddingSm: CGFloat { get }
    var cardPaddingMd: CGFloat { get }
    var cardPaddingLg: CGFloat { get }
    var cardRadiusSm: CGFloat { get }
    var cardRadiusMd: CGFloat { get }
    var cardRadiusLg: CGFloat { get }
    var cardRadiusXl: CGFloat { get }
    var cardGapSm: CGFloat { get }
    var cardGapMd: CGFloat { get }
    var cardGapLg: CGFloat { get }
    var cardElevation: CGFloat { get }
    var inputHeightSm: CGFloat { get }
    var inputHeightMd: CGFloat { get }
    var inputHeightLg: CGFloat { get }
    var inputHeightXl: CGFloat { get }
    var inputPaddingHorizontalSm: CGFloat { get }
    var inputPaddingHorizontalMd: CGFloat { get }
    var inputPaddingHorizontalLg: CGFloat { get }
    var inputRadiusSm: CGFloat { get }
    var inputRadiusMd: CGFloat { get }
    var inputRadiusLg: CGFloat { get }
    var inputGap: CGFloat { get }
    var chipHeightSm: CGFloat { get }
    var chipHeightMd: CGFloat { get }
    var chipPaddingHorizontalSm: CGFloat { get }
    var chipPaddingHorizontalMd: CGFloat { get }
    var chipRadius: CGFloat { get }
    var chipGap: CGFloat { get }
    var avatarSizeXs: CGFloat { get }
    var avatarSizeSm: CGFloat { get }
    var avatarSizeMd: CGFloat { get }
    var avatarSizeLg: CGFloat { get }
    var avatarSizeXl: CGFloat { get }
    var avatarSizeTwoXl: CGFloat { get }
    var avatarRadius: CGFloat { get }
    var modalPaddingSm: CGFloat { get }
    var modalPaddingMd: CGFloat { get }
    var modalPaddingLg: CGFloat { get }
    var modalRadiusSm: CGFloat { get }
    var modalRadiusMd: CGFloat { get }
    var modalRadiusLg: CGFloat { get }
    var modalElevation: CGFloat { get }
    var dividerThicknessThin: CGFloat { get }
    var dividerThicknessMedium: CGFloat { get }
    var dividerThicknessThick: CGFloat { get }
    var dividerSpacing: CGFloat { get }
    var listItemHeightSm: CGFloat { get }
    var listItemHeightMd: CGFloat { get }
    var listItemHeightLg: CGFloat { get }
    var listItemHeightXl: CGFloat { get }
    var listItemPaddingHorizontal: CGFloat { get }
    var listItemGap: CGFloat { get }
    func value(for token: DodadaComponent) -> CGFloat
}

public struct DodadaThemeComponentTokens: DodadaComponentTokens {
    public var buttonHeightRegular: CGFloat { DodadaComponent.buttonHeightRegular.value }
    public var buttonHeightMedium: CGFloat { DodadaComponent.buttonHeightMedium.value }
    public var buttonHeightSmall: CGFloat { DodadaComponent.buttonHeightSmall.value }
    public var buttonHeightLinkRegular: CGFloat { DodadaComponent.buttonHeightLinkRegular.value }
    public var buttonHeightLinkMedium: CGFloat { DodadaComponent.buttonHeightLinkMedium.value }
    public var buttonHeightLinkSmall: CGFloat { DodadaComponent.buttonHeightLinkSmall.value }
    public var buttonOnlyIconSize: CGFloat { DodadaComponent.buttonOnlyIconSize.value }
    public var buttonPaddingHorizontalSm: CGFloat { DodadaComponent.buttonPaddingHorizontalSm.value }
    public var buttonPaddingHorizontalMd: CGFloat { DodadaComponent.buttonPaddingHorizontalMd.value }
    public var buttonPaddingHorizontalLg: CGFloat { DodadaComponent.buttonPaddingHorizontalLg.value }
    public var buttonPaddingHorizontalLink: CGFloat { DodadaComponent.buttonPaddingHorizontalLink.value }
    public var buttonPaddingVerticalSm: CGFloat { DodadaComponent.buttonPaddingVerticalSm.value }
    public var buttonPaddingVerticalMd: CGFloat { DodadaComponent.buttonPaddingVerticalMd.value }
    public var buttonPaddingVerticalLg: CGFloat { DodadaComponent.buttonPaddingVerticalLg.value }
    public var buttonRadiusSm: CGFloat { DodadaComponent.buttonRadiusSm.value }
    public var buttonRadiusMd: CGFloat { DodadaComponent.buttonRadiusMd.value }
    public var buttonRadiusLg: CGFloat { DodadaComponent.buttonRadiusLg.value }
    public var buttonRadiusFull: CGFloat { DodadaComponent.buttonRadiusFull.value }
    public var buttonGap: CGFloat { DodadaComponent.buttonGap.value }
    public var buttonMinWidthSm: CGFloat { DodadaComponent.buttonMinWidthSm.value }
    public var buttonMinWidthMd: CGFloat { DodadaComponent.buttonMinWidthMd.value }
    public var buttonMinWidthLg: CGFloat { DodadaComponent.buttonMinWidthLg.value }
    public var cardPaddingSm: CGFloat { DodadaComponent.cardPaddingSm.value }
    public var cardPaddingMd: CGFloat { DodadaComponent.cardPaddingMd.value }
    public var cardPaddingLg: CGFloat { DodadaComponent.cardPaddingLg.value }
    public var cardRadiusSm: CGFloat { DodadaComponent.cardRadiusSm.value }
    public var cardRadiusMd: CGFloat { DodadaComponent.cardRadiusMd.value }
    public var cardRadiusLg: CGFloat { DodadaComponent.cardRadiusLg.value }
    public var cardRadiusXl: CGFloat { DodadaComponent.cardRadiusXl.value }
    public var cardGapSm: CGFloat { DodadaComponent.cardGapSm.value }
    public var cardGapMd: CGFloat { DodadaComponent.cardGapMd.value }
    public var cardGapLg: CGFloat { DodadaComponent.cardGapLg.value }
    public var cardElevation: CGFloat { DodadaComponent.cardElevation.value }
    public var inputHeightSm: CGFloat { DodadaComponent.inputHeightSm.value }
    public var inputHeightMd: CGFloat { DodadaComponent.inputHeightMd.value }
    public var inputHeightLg: CGFloat { DodadaComponent.inputHeightLg.value }
    public var inputHeightXl: CGFloat { DodadaComponent.inputHeightXl.value }
    public var inputPaddingHorizontalSm: CGFloat { DodadaComponent.inputPaddingHorizontalSm.value }
    public var inputPaddingHorizontalMd: CGFloat { DodadaComponent.inputPaddingHorizontalMd.value }
    public var inputPaddingHorizontalLg: CGFloat { DodadaComponent.inputPaddingHorizontalLg.value }
    public var inputRadiusSm: CGFloat { DodadaComponent.inputRadiusSm.value }
    public var inputRadiusMd: CGFloat { DodadaComponent.inputRadiusMd.value }
    public var inputRadiusLg: CGFloat { DodadaComponent.inputRadiusLg.value }
    public var inputGap: CGFloat { DodadaComponent.inputGap.value }
    public var chipHeightSm: CGFloat { DodadaComponent.chipHeightSm.value }
    public var chipHeightMd: CGFloat { DodadaComponent.chipHeightMd.value }
    public var chipPaddingHorizontalSm: CGFloat { DodadaComponent.chipPaddingHorizontalSm.value }
    public var chipPaddingHorizontalMd: CGFloat { DodadaComponent.chipPaddingHorizontalMd.value }
    public var chipRadius: CGFloat { DodadaComponent.chipRadius.value }
    public var chipGap: CGFloat { DodadaComponent.chipGap.value }
    public var avatarSizeXs: CGFloat { DodadaComponent.avatarSizeXs.value }
    public var avatarSizeSm: CGFloat { DodadaComponent.avatarSizeSm.value }
    public var avatarSizeMd: CGFloat { DodadaComponent.avatarSizeMd.value }
    public var avatarSizeLg: CGFloat { DodadaComponent.avatarSizeLg.value }
    public var avatarSizeXl: CGFloat { DodadaComponent.avatarSizeXl.value }
    public var avatarSizeTwoXl: CGFloat { DodadaComponent.avatarSizeTwoXl.value }
    public var avatarRadius: CGFloat { DodadaComponent.avatarRadius.value }
    public var modalPaddingSm: CGFloat { DodadaComponent.modalPaddingSm.value }
    public var modalPaddingMd: CGFloat { DodadaComponent.modalPaddingMd.value }
    public var modalPaddingLg: CGFloat { DodadaComponent.modalPaddingLg.value }
    public var modalRadiusSm: CGFloat { DodadaComponent.modalRadiusSm.value }
    public var modalRadiusMd: CGFloat { DodadaComponent.modalRadiusMd.value }
    public var modalRadiusLg: CGFloat { DodadaComponent.modalRadiusLg.value }
    public var modalElevation: CGFloat { DodadaComponent.modalElevation.value }
    public var dividerThicknessThin: CGFloat { DodadaComponent.dividerThicknessThin.value }
    public var dividerThicknessMedium: CGFloat { DodadaComponent.dividerThicknessMedium.value }
    public var dividerThicknessThick: CGFloat { DodadaComponent.dividerThicknessThick.value }
    public var dividerSpacing: CGFloat { DodadaComponent.dividerSpacing.value }
    public var listItemHeightSm: CGFloat { DodadaComponent.listItemHeightSm.value }
    public var listItemHeightMd: CGFloat { DodadaComponent.listItemHeightMd.value }
    public var listItemHeightLg: CGFloat { DodadaComponent.listItemHeightLg.value }
    public var listItemHeightXl: CGFloat { DodadaComponent.listItemHeightXl.value }
    public var listItemPaddingHorizontal: CGFloat { DodadaComponent.listItemPaddingHorizontal.value }
    public var listItemGap: CGFloat { DodadaComponent.listItemGap.value }
    public func value(for token: DodadaComponent) -> CGFloat {
        switch token {
        case .buttonHeightRegular: return buttonHeightRegular
        case .buttonHeightMedium: return buttonHeightMedium
        case .buttonHeightSmall: return buttonHeightSmall
        case .buttonHeightLinkRegular: return buttonHeightLinkRegular
        case .buttonHeightLinkMedium: return buttonHeightLinkMedium
        case .buttonHeightLinkSmall: return buttonHeightLinkSmall
        case .buttonOnlyIconSize: return buttonOnlyIconSize
        case .buttonPaddingHorizontalSm: return buttonPaddingHorizontalSm
        case .buttonPaddingHorizontalMd: return buttonPaddingHorizontalMd
        case .buttonPaddingHorizontalLg: return buttonPaddingHorizontalLg
        case .buttonPaddingHorizontalLink: return buttonPaddingHorizontalLink
        case .buttonPaddingVerticalSm: return buttonPaddingVerticalSm
        case .buttonPaddingVerticalMd: return buttonPaddingVerticalMd
        case .buttonPaddingVerticalLg: return buttonPaddingVerticalLg
        case .buttonRadiusSm: return buttonRadiusSm
        case .buttonRadiusMd: return buttonRadiusMd
        case .buttonRadiusLg: return buttonRadiusLg
        case .buttonRadiusFull: return buttonRadiusFull
        case .buttonGap: return buttonGap
        case .buttonMinWidthSm: return buttonMinWidthSm
        case .buttonMinWidthMd: return buttonMinWidthMd
        case .buttonMinWidthLg: return buttonMinWidthLg
        case .cardPaddingSm: return cardPaddingSm
        case .cardPaddingMd: return cardPaddingMd
        case .cardPaddingLg: return cardPaddingLg
        case .cardRadiusSm: return cardRadiusSm
        case .cardRadiusMd: return cardRadiusMd
        case .cardRadiusLg: return cardRadiusLg
        case .cardRadiusXl: return cardRadiusXl
        case .cardGapSm: return cardGapSm
        case .cardGapMd: return cardGapMd
        case .cardGapLg: return cardGapLg
        case .cardElevation: return cardElevation
        case .inputHeightSm: return inputHeightSm
        case .inputHeightMd: return inputHeightMd
        case .inputHeightLg: return inputHeightLg
        case .inputHeightXl: return inputHeightXl
        case .inputPaddingHorizontalSm: return inputPaddingHorizontalSm
        case .inputPaddingHorizontalMd: return inputPaddingHorizontalMd
        case .inputPaddingHorizontalLg: return inputPaddingHorizontalLg
        case .inputRadiusSm: return inputRadiusSm
        case .inputRadiusMd: return inputRadiusMd
        case .inputRadiusLg: return inputRadiusLg
        case .inputGap: return inputGap
        case .chipHeightSm: return chipHeightSm
        case .chipHeightMd: return chipHeightMd
        case .chipPaddingHorizontalSm: return chipPaddingHorizontalSm
        case .chipPaddingHorizontalMd: return chipPaddingHorizontalMd
        case .chipRadius: return chipRadius
        case .chipGap: return chipGap
        case .avatarSizeXs: return avatarSizeXs
        case .avatarSizeSm: return avatarSizeSm
        case .avatarSizeMd: return avatarSizeMd
        case .avatarSizeLg: return avatarSizeLg
        case .avatarSizeXl: return avatarSizeXl
        case .avatarSizeTwoXl: return avatarSizeTwoXl
        case .avatarRadius: return avatarRadius
        case .modalPaddingSm: return modalPaddingSm
        case .modalPaddingMd: return modalPaddingMd
        case .modalPaddingLg: return modalPaddingLg
        case .modalRadiusSm: return modalRadiusSm
        case .modalRadiusMd: return modalRadiusMd
        case .modalRadiusLg: return modalRadiusLg
        case .modalElevation: return modalElevation
        case .dividerThicknessThin: return dividerThicknessThin
        case .dividerThicknessMedium: return dividerThicknessMedium
        case .dividerThicknessThick: return dividerThicknessThick
        case .dividerSpacing: return dividerSpacing
        case .listItemHeightSm: return listItemHeightSm
        case .listItemHeightMd: return listItemHeightMd
        case .listItemHeightLg: return listItemHeightLg
        case .listItemHeightXl: return listItemHeightXl
        case .listItemPaddingHorizontal: return listItemPaddingHorizontal
        case .listItemGap: return listItemGap
        }
    }
}
