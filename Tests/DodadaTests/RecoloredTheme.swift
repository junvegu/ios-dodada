//
//  RecoloredTheme.swift
//
//  Test double: the default Dodada theme with a few color tokens replaced, so a test can tell the
//  theme it passes in apart from the global `DDDThemeManager.shared.main`.
//
//  The color tokens below are generated from `DodadaTokenColorTokens`; regenerate if the protocol changes.
//

import SwiftUI
@testable import Dodada

struct RecoloredTheme: DDDTheme {
    let overrides: [String: Color]

    var name: String { "Recolored" }
    var colors: DodadaTokenColorTokens { RecoloredColorTokens(overrides: overrides) }
    var typography: DodadaThemeTypographyTokens { DodadaThemeTypographyTokensDefault() }
    var foundation: DDDFoundationTokens { FoundationDefault() }
    var components: DodadaComponentTheme { ComponentThemeDefault() }

    var defaultButton: Color { .clear }
    var disabledTextButton: Color { .clear }
    var borderRoundButton: CGFloat { 8 }
    var disabledButton: Color { .clear }
    var hoverButton: Color { .clear }
}

struct RecoloredColorTokens: DodadaTokenColorTokens {
    let overrides: [String: Color]
    private let base = DodadaThemeColorTokensDefault()

    private func color(_ name: String, _ fallback: Color) -> Color {
        overrides[name] ?? fallback
    }

    var primaryValue100: Color { color("primaryValue100", base.primaryValue100) }
    var primaryValue200: Color { color("primaryValue200", base.primaryValue200) }
    var primaryValue300: Color { color("primaryValue300", base.primaryValue300) }
    var primaryValue400: Color { color("primaryValue400", base.primaryValue400) }
    var primaryValue500: Color { color("primaryValue500", base.primaryValue500) }
    var primaryValue600: Color { color("primaryValue600", base.primaryValue600) }
    var primaryValue700: Color { color("primaryValue700", base.primaryValue700) }
    var primaryValue800: Color { color("primaryValue800", base.primaryValue800) }
    var primaryValue900: Color { color("primaryValue900", base.primaryValue900) }
    var secondaryValue100: Color { color("secondaryValue100", base.secondaryValue100) }
    var secondaryValue200: Color { color("secondaryValue200", base.secondaryValue200) }
    var secondaryValue300: Color { color("secondaryValue300", base.secondaryValue300) }
    var secondaryValue400: Color { color("secondaryValue400", base.secondaryValue400) }
    var secondaryValue500: Color { color("secondaryValue500", base.secondaryValue500) }
    var secondaryValue600: Color { color("secondaryValue600", base.secondaryValue600) }
    var secondaryValue700: Color { color("secondaryValue700", base.secondaryValue700) }
    var secondaryValue800: Color { color("secondaryValue800", base.secondaryValue800) }
    var secondaryValue900: Color { color("secondaryValue900", base.secondaryValue900) }
    var successValue100: Color { color("successValue100", base.successValue100) }
    var successValue200: Color { color("successValue200", base.successValue200) }
    var successValue300: Color { color("successValue300", base.successValue300) }
    var successValue400: Color { color("successValue400", base.successValue400) }
    var successValue500: Color { color("successValue500", base.successValue500) }
    var successValue600: Color { color("successValue600", base.successValue600) }
    var successValue700: Color { color("successValue700", base.successValue700) }
    var successValue800: Color { color("successValue800", base.successValue800) }
    var successValue900: Color { color("successValue900", base.successValue900) }
    var warningValue100: Color { color("warningValue100", base.warningValue100) }
    var warningValue200: Color { color("warningValue200", base.warningValue200) }
    var warningValue300: Color { color("warningValue300", base.warningValue300) }
    var warningValue400: Color { color("warningValue400", base.warningValue400) }
    var warningValue500: Color { color("warningValue500", base.warningValue500) }
    var warningValue600: Color { color("warningValue600", base.warningValue600) }
    var warningValue700: Color { color("warningValue700", base.warningValue700) }
    var warningValue800: Color { color("warningValue800", base.warningValue800) }
    var warningValue900: Color { color("warningValue900", base.warningValue900) }
    var errorValue100: Color { color("errorValue100", base.errorValue100) }
    var errorValue200: Color { color("errorValue200", base.errorValue200) }
    var errorValue300: Color { color("errorValue300", base.errorValue300) }
    var errorValue400: Color { color("errorValue400", base.errorValue400) }
    var errorValue500: Color { color("errorValue500", base.errorValue500) }
    var errorValue600: Color { color("errorValue600", base.errorValue600) }
    var errorValue700: Color { color("errorValue700", base.errorValue700) }
    var errorValue800: Color { color("errorValue800", base.errorValue800) }
    var errorValue900: Color { color("errorValue900", base.errorValue900) }
    var infoValue100: Color { color("infoValue100", base.infoValue100) }
    var infoValue200: Color { color("infoValue200", base.infoValue200) }
    var infoValue300: Color { color("infoValue300", base.infoValue300) }
    var infoValue400: Color { color("infoValue400", base.infoValue400) }
    var infoValue500: Color { color("infoValue500", base.infoValue500) }
    var infoValue600: Color { color("infoValue600", base.infoValue600) }
    var infoValue700: Color { color("infoValue700", base.infoValue700) }
    var infoValue800: Color { color("infoValue800", base.infoValue800) }
    var infoValue900: Color { color("infoValue900", base.infoValue900) }
    var neutralZero: Color { color("neutralZero", base.neutralZero) }
    var neutralValue50: Color { color("neutralValue50", base.neutralValue50) }
    var neutralValue100: Color { color("neutralValue100", base.neutralValue100) }
    var neutralValue200: Color { color("neutralValue200", base.neutralValue200) }
    var neutralValue300: Color { color("neutralValue300", base.neutralValue300) }
    var neutralValue400: Color { color("neutralValue400", base.neutralValue400) }
    var neutralValue500: Color { color("neutralValue500", base.neutralValue500) }
    var neutralValue600: Color { color("neutralValue600", base.neutralValue600) }
    var neutralValue700: Color { color("neutralValue700", base.neutralValue700) }
    var neutralValue800: Color { color("neutralValue800", base.neutralValue800) }
    var neutralValue900: Color { color("neutralValue900", base.neutralValue900) }
    var neutralValue1000: Color { color("neutralValue1000", base.neutralValue1000) }
    var textPrimary: Color { color("textPrimary", base.textPrimary) }
    var textSecondary: Color { color("textSecondary", base.textSecondary) }
    var textTertiary: Color { color("textTertiary", base.textTertiary) }
    var textDisabled: Color { color("textDisabled", base.textDisabled) }
    var textInverse: Color { color("textInverse", base.textInverse) }
    var textOnPrimary: Color { color("textOnPrimary", base.textOnPrimary) }
    var textOnSecondary: Color { color("textOnSecondary", base.textOnSecondary) }
    var textError: Color { color("textError", base.textError) }
    var textSuccess: Color { color("textSuccess", base.textSuccess) }
    var textWarning: Color { color("textWarning", base.textWarning) }
    var textInfo: Color { color("textInfo", base.textInfo) }
    var surfaceBackground: Color { color("surfaceBackground", base.surfaceBackground) }
    var surfaceElevated: Color { color("surfaceElevated", base.surfaceElevated) }
    var surfaceOverlay: Color { color("surfaceOverlay", base.surfaceOverlay) }
    var surfaceCardDefault: Color { color("surfaceCardDefault", base.surfaceCardDefault) }
    var surfaceCardElevated: Color { color("surfaceCardElevated", base.surfaceCardElevated) }
    var surfaceCardSubtle: Color { color("surfaceCardSubtle", base.surfaceCardSubtle) }
    var surfaceInputDefault: Color { color("surfaceInputDefault", base.surfaceInputDefault) }
    var surfaceInputDisabled: Color { color("surfaceInputDisabled", base.surfaceInputDisabled) }
    var surfaceInputFocus: Color { color("surfaceInputFocus", base.surfaceInputFocus) }
    var borderDefault: Color { color("borderDefault", base.borderDefault) }
    var borderSubtle: Color { color("borderSubtle", base.borderSubtle) }
    var borderStrong: Color { color("borderStrong", base.borderStrong) }
    var borderInteractive: Color { color("borderInteractive", base.borderInteractive) }
    var borderFocus: Color { color("borderFocus", base.borderFocus) }
    var borderError: Color { color("borderError", base.borderError) }
    var borderSuccess: Color { color("borderSuccess", base.borderSuccess) }
    var borderWarning: Color { color("borderWarning", base.borderWarning) }
    var buttonPrimaryBackgroundDefault: Color { color("buttonPrimaryBackgroundDefault", base.buttonPrimaryBackgroundDefault) }
    var buttonPrimaryBackgroundHover: Color { color("buttonPrimaryBackgroundHover", base.buttonPrimaryBackgroundHover) }
    var buttonPrimaryBackgroundPressed: Color { color("buttonPrimaryBackgroundPressed", base.buttonPrimaryBackgroundPressed) }
    var buttonPrimaryBackgroundDisabled: Color { color("buttonPrimaryBackgroundDisabled", base.buttonPrimaryBackgroundDisabled) }
    var buttonPrimaryTextDefault: Color { color("buttonPrimaryTextDefault", base.buttonPrimaryTextDefault) }
    var buttonPrimaryTextHover: Color { color("buttonPrimaryTextHover", base.buttonPrimaryTextHover) }
    var buttonPrimaryTextPressed: Color { color("buttonPrimaryTextPressed", base.buttonPrimaryTextPressed) }
    var buttonPrimaryTextDisabled: Color { color("buttonPrimaryTextDisabled", base.buttonPrimaryTextDisabled) }
    var buttonPrimaryIconDefault: Color { color("buttonPrimaryIconDefault", base.buttonPrimaryIconDefault) }
    var buttonPrimaryIconHover: Color { color("buttonPrimaryIconHover", base.buttonPrimaryIconHover) }
    var buttonPrimaryIconPressed: Color { color("buttonPrimaryIconPressed", base.buttonPrimaryIconPressed) }
    var buttonPrimaryIconDisabled: Color { color("buttonPrimaryIconDisabled", base.buttonPrimaryIconDisabled) }
    var buttonPrimaryBorder: Color { color("buttonPrimaryBorder", base.buttonPrimaryBorder) }
    var buttonSecondaryBackgroundDefault: Color { color("buttonSecondaryBackgroundDefault", base.buttonSecondaryBackgroundDefault) }
    var buttonSecondaryBackgroundHover: Color { color("buttonSecondaryBackgroundHover", base.buttonSecondaryBackgroundHover) }
    var buttonSecondaryBackgroundPressed: Color { color("buttonSecondaryBackgroundPressed", base.buttonSecondaryBackgroundPressed) }
    var buttonSecondaryBackgroundDisabled: Color { color("buttonSecondaryBackgroundDisabled", base.buttonSecondaryBackgroundDisabled) }
    var buttonSecondaryTextDefault: Color { color("buttonSecondaryTextDefault", base.buttonSecondaryTextDefault) }
    var buttonSecondaryTextHover: Color { color("buttonSecondaryTextHover", base.buttonSecondaryTextHover) }
    var buttonSecondaryTextPressed: Color { color("buttonSecondaryTextPressed", base.buttonSecondaryTextPressed) }
    var buttonSecondaryTextDisabled: Color { color("buttonSecondaryTextDisabled", base.buttonSecondaryTextDisabled) }
    var buttonSecondaryIconDefault: Color { color("buttonSecondaryIconDefault", base.buttonSecondaryIconDefault) }
    var buttonSecondaryIconHover: Color { color("buttonSecondaryIconHover", base.buttonSecondaryIconHover) }
    var buttonSecondaryIconPressed: Color { color("buttonSecondaryIconPressed", base.buttonSecondaryIconPressed) }
    var buttonSecondaryIconDisabled: Color { color("buttonSecondaryIconDisabled", base.buttonSecondaryIconDisabled) }
    var buttonSecondaryBorderDefault: Color { color("buttonSecondaryBorderDefault", base.buttonSecondaryBorderDefault) }
    var buttonSecondaryBorderHover: Color { color("buttonSecondaryBorderHover", base.buttonSecondaryBorderHover) }
    var buttonSecondaryBorderPressed: Color { color("buttonSecondaryBorderPressed", base.buttonSecondaryBorderPressed) }
    var buttonSecondaryBorderDisabled: Color { color("buttonSecondaryBorderDisabled", base.buttonSecondaryBorderDisabled) }
    var buttonTertiaryBackgroundDefault: Color { color("buttonTertiaryBackgroundDefault", base.buttonTertiaryBackgroundDefault) }
    var buttonTertiaryBackgroundHover: Color { color("buttonTertiaryBackgroundHover", base.buttonTertiaryBackgroundHover) }
    var buttonTertiaryBackgroundPressed: Color { color("buttonTertiaryBackgroundPressed", base.buttonTertiaryBackgroundPressed) }
    var buttonTertiaryBackgroundDisabled: Color { color("buttonTertiaryBackgroundDisabled", base.buttonTertiaryBackgroundDisabled) }
    var buttonTertiaryTextDefault: Color { color("buttonTertiaryTextDefault", base.buttonTertiaryTextDefault) }
    var buttonTertiaryTextHover: Color { color("buttonTertiaryTextHover", base.buttonTertiaryTextHover) }
    var buttonTertiaryTextPressed: Color { color("buttonTertiaryTextPressed", base.buttonTertiaryTextPressed) }
    var buttonTertiaryTextDisabled: Color { color("buttonTertiaryTextDisabled", base.buttonTertiaryTextDisabled) }
    var buttonTertiaryIconDefault: Color { color("buttonTertiaryIconDefault", base.buttonTertiaryIconDefault) }
    var buttonTertiaryIconHover: Color { color("buttonTertiaryIconHover", base.buttonTertiaryIconHover) }
    var buttonTertiaryIconPressed: Color { color("buttonTertiaryIconPressed", base.buttonTertiaryIconPressed) }
    var buttonTertiaryIconDisabled: Color { color("buttonTertiaryIconDisabled", base.buttonTertiaryIconDisabled) }
    var buttonTertiaryBorder: Color { color("buttonTertiaryBorder", base.buttonTertiaryBorder) }
    var buttonQuaternaryBackgroundDefault: Color { color("buttonQuaternaryBackgroundDefault", base.buttonQuaternaryBackgroundDefault) }
    var buttonQuaternaryBackgroundHover: Color { color("buttonQuaternaryBackgroundHover", base.buttonQuaternaryBackgroundHover) }
    var buttonQuaternaryBackgroundPressed: Color { color("buttonQuaternaryBackgroundPressed", base.buttonQuaternaryBackgroundPressed) }
    var buttonQuaternaryBackgroundDisabled: Color { color("buttonQuaternaryBackgroundDisabled", base.buttonQuaternaryBackgroundDisabled) }
    var buttonQuaternaryTextDefault: Color { color("buttonQuaternaryTextDefault", base.buttonQuaternaryTextDefault) }
    var buttonQuaternaryTextHover: Color { color("buttonQuaternaryTextHover", base.buttonQuaternaryTextHover) }
    var buttonQuaternaryTextPressed: Color { color("buttonQuaternaryTextPressed", base.buttonQuaternaryTextPressed) }
    var buttonQuaternaryTextDisabled: Color { color("buttonQuaternaryTextDisabled", base.buttonQuaternaryTextDisabled) }
    var buttonQuaternaryIconDefault: Color { color("buttonQuaternaryIconDefault", base.buttonQuaternaryIconDefault) }
    var buttonQuaternaryIconHover: Color { color("buttonQuaternaryIconHover", base.buttonQuaternaryIconHover) }
    var buttonQuaternaryIconPressed: Color { color("buttonQuaternaryIconPressed", base.buttonQuaternaryIconPressed) }
    var buttonQuaternaryIconDisabled: Color { color("buttonQuaternaryIconDisabled", base.buttonQuaternaryIconDisabled) }
    var buttonQuaternaryBorderDefault: Color { color("buttonQuaternaryBorderDefault", base.buttonQuaternaryBorderDefault) }
    var buttonQuaternaryBorderHover: Color { color("buttonQuaternaryBorderHover", base.buttonQuaternaryBorderHover) }
    var buttonQuaternaryBorderPressed: Color { color("buttonQuaternaryBorderPressed", base.buttonQuaternaryBorderPressed) }
    var buttonQuaternaryBorderDisabled: Color { color("buttonQuaternaryBorderDisabled", base.buttonQuaternaryBorderDisabled) }
    var buttonOnlyIconFilledBackgroundDefault: Color { color("buttonOnlyIconFilledBackgroundDefault", base.buttonOnlyIconFilledBackgroundDefault) }
    var buttonOnlyIconFilledBackgroundHover: Color { color("buttonOnlyIconFilledBackgroundHover", base.buttonOnlyIconFilledBackgroundHover) }
    var buttonOnlyIconFilledBackgroundPressed: Color { color("buttonOnlyIconFilledBackgroundPressed", base.buttonOnlyIconFilledBackgroundPressed) }
    var buttonOnlyIconFilledBackgroundDisabled: Color { color("buttonOnlyIconFilledBackgroundDisabled", base.buttonOnlyIconFilledBackgroundDisabled) }
    var buttonOnlyIconFilledIconDefault: Color { color("buttonOnlyIconFilledIconDefault", base.buttonOnlyIconFilledIconDefault) }
    var buttonOnlyIconFilledIconHover: Color { color("buttonOnlyIconFilledIconHover", base.buttonOnlyIconFilledIconHover) }
    var buttonOnlyIconFilledIconPressed: Color { color("buttonOnlyIconFilledIconPressed", base.buttonOnlyIconFilledIconPressed) }
    var buttonOnlyIconFilledIconDisabled: Color { color("buttonOnlyIconFilledIconDisabled", base.buttonOnlyIconFilledIconDisabled) }
    var buttonOnlyIconFilledBorder: Color { color("buttonOnlyIconFilledBorder", base.buttonOnlyIconFilledBorder) }
    var buttonOnlyIconOutlineBackgroundDefault: Color { color("buttonOnlyIconOutlineBackgroundDefault", base.buttonOnlyIconOutlineBackgroundDefault) }
    var buttonOnlyIconOutlineBackgroundHover: Color { color("buttonOnlyIconOutlineBackgroundHover", base.buttonOnlyIconOutlineBackgroundHover) }
    var buttonOnlyIconOutlineBackgroundPressed: Color { color("buttonOnlyIconOutlineBackgroundPressed", base.buttonOnlyIconOutlineBackgroundPressed) }
    var buttonOnlyIconOutlineBackgroundDisabled: Color { color("buttonOnlyIconOutlineBackgroundDisabled", base.buttonOnlyIconOutlineBackgroundDisabled) }
    var buttonOnlyIconOutlineIconDefault: Color { color("buttonOnlyIconOutlineIconDefault", base.buttonOnlyIconOutlineIconDefault) }
    var buttonOnlyIconOutlineIconHover: Color { color("buttonOnlyIconOutlineIconHover", base.buttonOnlyIconOutlineIconHover) }
    var buttonOnlyIconOutlineIconPressed: Color { color("buttonOnlyIconOutlineIconPressed", base.buttonOnlyIconOutlineIconPressed) }
    var buttonOnlyIconOutlineIconDisabled: Color { color("buttonOnlyIconOutlineIconDisabled", base.buttonOnlyIconOutlineIconDisabled) }
    var buttonOnlyIconOutlineBorderDefault: Color { color("buttonOnlyIconOutlineBorderDefault", base.buttonOnlyIconOutlineBorderDefault) }
    var buttonOnlyIconOutlineBorderHover: Color { color("buttonOnlyIconOutlineBorderHover", base.buttonOnlyIconOutlineBorderHover) }
    var buttonOnlyIconOutlineBorderPressed: Color { color("buttonOnlyIconOutlineBorderPressed", base.buttonOnlyIconOutlineBorderPressed) }
    var buttonOnlyIconOutlineBorderDisabled: Color { color("buttonOnlyIconOutlineBorderDisabled", base.buttonOnlyIconOutlineBorderDisabled) }
    var buttonOnlyIconGhostBackgroundDefault: Color { color("buttonOnlyIconGhostBackgroundDefault", base.buttonOnlyIconGhostBackgroundDefault) }
    var buttonOnlyIconGhostBackgroundHover: Color { color("buttonOnlyIconGhostBackgroundHover", base.buttonOnlyIconGhostBackgroundHover) }
    var buttonOnlyIconGhostBackgroundPressed: Color { color("buttonOnlyIconGhostBackgroundPressed", base.buttonOnlyIconGhostBackgroundPressed) }
    var buttonOnlyIconGhostBackgroundDisabled: Color { color("buttonOnlyIconGhostBackgroundDisabled", base.buttonOnlyIconGhostBackgroundDisabled) }
    var buttonOnlyIconGhostIconDefault: Color { color("buttonOnlyIconGhostIconDefault", base.buttonOnlyIconGhostIconDefault) }
    var buttonOnlyIconGhostIconHover: Color { color("buttonOnlyIconGhostIconHover", base.buttonOnlyIconGhostIconHover) }
    var buttonOnlyIconGhostIconPressed: Color { color("buttonOnlyIconGhostIconPressed", base.buttonOnlyIconGhostIconPressed) }
    var buttonOnlyIconGhostIconDisabled: Color { color("buttonOnlyIconGhostIconDisabled", base.buttonOnlyIconGhostIconDisabled) }
    var buttonOnlyIconGhostBorder: Color { color("buttonOnlyIconGhostBorder", base.buttonOnlyIconGhostBorder) }
    var buttonLinkBackgroundDefault: Color { color("buttonLinkBackgroundDefault", base.buttonLinkBackgroundDefault) }
    var buttonLinkBackgroundHover: Color { color("buttonLinkBackgroundHover", base.buttonLinkBackgroundHover) }
    var buttonLinkBackgroundPressed: Color { color("buttonLinkBackgroundPressed", base.buttonLinkBackgroundPressed) }
    var buttonLinkBackgroundDisabled: Color { color("buttonLinkBackgroundDisabled", base.buttonLinkBackgroundDisabled) }
    var buttonLinkTextDefault: Color { color("buttonLinkTextDefault", base.buttonLinkTextDefault) }
    var buttonLinkTextHover: Color { color("buttonLinkTextHover", base.buttonLinkTextHover) }
    var buttonLinkTextPressed: Color { color("buttonLinkTextPressed", base.buttonLinkTextPressed) }
    var buttonLinkTextDisabled: Color { color("buttonLinkTextDisabled", base.buttonLinkTextDisabled) }
    var buttonLinkIconDefault: Color { color("buttonLinkIconDefault", base.buttonLinkIconDefault) }
    var buttonLinkIconHover: Color { color("buttonLinkIconHover", base.buttonLinkIconHover) }
    var buttonLinkIconPressed: Color { color("buttonLinkIconPressed", base.buttonLinkIconPressed) }
    var buttonLinkIconDisabled: Color { color("buttonLinkIconDisabled", base.buttonLinkIconDisabled) }
    var buttonLinkBorder: Color { color("buttonLinkBorder", base.buttonLinkBorder) }
    var buttonGhostBackgroundDefault: Color { color("buttonGhostBackgroundDefault", base.buttonGhostBackgroundDefault) }
    var buttonGhostBackgroundHover: Color { color("buttonGhostBackgroundHover", base.buttonGhostBackgroundHover) }
    var buttonGhostBackgroundPressed: Color { color("buttonGhostBackgroundPressed", base.buttonGhostBackgroundPressed) }
    var buttonGhostTextDefault: Color { color("buttonGhostTextDefault", base.buttonGhostTextDefault) }
    var buttonGhostTextHover: Color { color("buttonGhostTextHover", base.buttonGhostTextHover) }
    var buttonGhostTextDisabled: Color { color("buttonGhostTextDisabled", base.buttonGhostTextDisabled) }
    var buttonSuccessBackgroundDefault: Color { color("buttonSuccessBackgroundDefault", base.buttonSuccessBackgroundDefault) }
    var buttonSuccessBackgroundHover: Color { color("buttonSuccessBackgroundHover", base.buttonSuccessBackgroundHover) }
    var buttonSuccessText: Color { color("buttonSuccessText", base.buttonSuccessText) }
    var buttonErrorBackgroundDefault: Color { color("buttonErrorBackgroundDefault", base.buttonErrorBackgroundDefault) }
    var buttonErrorBackgroundHover: Color { color("buttonErrorBackgroundHover", base.buttonErrorBackgroundHover) }
    var buttonErrorText: Color { color("buttonErrorText", base.buttonErrorText) }
    var feedbackSuccessBackground: Color { color("feedbackSuccessBackground", base.feedbackSuccessBackground) }
    var feedbackSuccessBorder: Color { color("feedbackSuccessBorder", base.feedbackSuccessBorder) }
    var feedbackSuccessText: Color { color("feedbackSuccessText", base.feedbackSuccessText) }
    var feedbackSuccessIcon: Color { color("feedbackSuccessIcon", base.feedbackSuccessIcon) }
    var feedbackErrorBackground: Color { color("feedbackErrorBackground", base.feedbackErrorBackground) }
    var feedbackErrorBorder: Color { color("feedbackErrorBorder", base.feedbackErrorBorder) }
    var feedbackErrorText: Color { color("feedbackErrorText", base.feedbackErrorText) }
    var feedbackErrorIcon: Color { color("feedbackErrorIcon", base.feedbackErrorIcon) }
    var feedbackWarningBackground: Color { color("feedbackWarningBackground", base.feedbackWarningBackground) }
    var feedbackWarningBorder: Color { color("feedbackWarningBorder", base.feedbackWarningBorder) }
    var feedbackWarningText: Color { color("feedbackWarningText", base.feedbackWarningText) }
    var feedbackWarningIcon: Color { color("feedbackWarningIcon", base.feedbackWarningIcon) }
    var feedbackInfoBackground: Color { color("feedbackInfoBackground", base.feedbackInfoBackground) }
    var feedbackInfoBorder: Color { color("feedbackInfoBorder", base.feedbackInfoBorder) }
    var feedbackInfoText: Color { color("feedbackInfoText", base.feedbackInfoText) }
    var feedbackInfoIcon: Color { color("feedbackInfoIcon", base.feedbackInfoIcon) }

    func toColor(for token: DodadaColorToken) -> Color {
        overrides[token.assetName] ?? base.toColor(for: token)
    }
}
