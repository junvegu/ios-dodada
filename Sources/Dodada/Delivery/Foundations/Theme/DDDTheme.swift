//
//  DDDTheme.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 5/02/26.
//
import SwiftUI

// MARK: - DDDTheme
/// When using `applyThemeTypography(_ token:)`, the font is resolved from the current theme:
/// `theme.typography.font(for: token)`. Default theme uses `DodadaThemeTypographyTokens`;
/// a custom theme returns its own type conforming to `DodadaTypographyToken` (e.g. different
/// `largeTitleRegular`, `bodyBold`, etc.) so changing the theme changes the typography.
public protocol DDDTheme {
    var colors: DodadaTokenColorTokens { get }
    var typography: DodadaThemeTypographyTokens { get }
    var foundation: DDDFoundationTokens { get }
    var components: DodadaComponentTheme { get }

    var name: String { get }

    // Legacy API (used by DDDButton, DDDTagView, DDDChipButton, DDDActionTextField, DDDIcon)
    var defaultButton: Color { get }
    var disabledTextButton: Color { get }
    var borderRoundButton: CGFloat { get }
    var disabledButton: Color { get }
    var hoverButton: Color { get }
}

// MARK: - DDDNavigationBarTheme
public protocol DDDNavigationBarTheme {
    var background: Color { get }
    var titleColor: Color { get }
    var tint: Color { get }
}

// MARK: - DDDTabBarTheme
public protocol DDDTabBarTheme {
    var background: Color { get }
    var tint: Color { get }
    var unselectedTint: Color { get }
}


// MARK: - DodadaComponentTheme
public protocol DodadaComponentTheme {
    var button: DDDButtonTheme { get }
    var navigationBar: DDDNavigationBarTheme { get }
    var tabBar: DDDTabBarTheme { get }
}

// MARK: - DDDFoundationTokens
public protocol DDDFoundationTokens {
    var spacing: DodadaThemeSpacingTokens { get }
    var radius: DodadaThemeRadiusTokens { get }
    var elevation: DodadaThemeElevationTokens { get }
    var sizing: DodadaThemeSizingTokens { get }
    var layout: DodadaThemeLayoutTokens { get }
}

// MARK: - ColorThemeEnvironmentKey
public struct ColorThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: DDDTheme = DDDThemeManager.shared.main
}

extension EnvironmentValues {
    public var colorTheme: DDDTheme {
        get { self[ColorThemeEnvironmentKey.self] }
        set { self[ColorThemeEnvironmentKey.self] = newValue }
    }
}

public final class DDDThemeManager {
    public static let shared = DDDThemeManager()
    private init() {}

    public var main: DDDTheme = DDDThemeDefault()
}

// MARK: - Tema alternativo (a nivel de protocolo)
// Tipografía con tamaños distintos. Uso: `.environment(\.colorTheme, DDDThemeAlternate())`

private struct AlternateTypographyTokens: DodadaThemeTypographyTokens {
    private func font(size: CGFloat, weight: CGFloat, lineHeight: CGFloat = 1.5, letterSpacing: CGFloat? = nil, underline: Bool = false) -> DodadaFont {
        DodadaFont(family: "ChalkboardSE", size: size, weight: weight, lineHeight: lineHeight, letterSpacing: letterSpacing, underline: underline)
    }

    var largeTitleRegular: DodadaFont { font(size: 32, weight: 400) }
     var largeTitleBold: DodadaFont { font(size: 32, weight: 700) }
     var largeTitleBoldUnderline: DodadaFont { font(size: 32, weight: 700, underline: true) }
     var title1Regular: DodadaFont { font(size: 24, weight: 400) }
     var title1Bold: DodadaFont { font(size: 24, weight: 700) }
     var title1BoldUnderline: DodadaFont { font(size: 24, weight: 700, underline: true) }
     var title2Regular: DodadaFont { font(size: 22, weight: 400) }
     var title2Bold: DodadaFont { font(size: 22, weight: 700) }
     var title2BoldUnderline: DodadaFont { font(size: 22, weight: 700, underline: true) }
     var title3Regular: DodadaFont { font(size: 20, weight: 400) }
     var title3Bold: DodadaFont { font(size: 20, weight: 700) }
     var title3BoldUnderline: DodadaFont { font(size: 20, weight: 700, underline: true) }
     var headlineRegular: DodadaFont { font(size: 19, weight: 400) }
     var headlineBold: DodadaFont { font(size: 19, weight: 700) }
     var headlineBoldUnderline: DodadaFont { font(size: 19, weight: 700, underline: true) }
     var bodyRegular: DodadaFont { font(size: 17, weight: 400) }
     var bodyBold: DodadaFont { font(size: 17, weight: 700) }
     var bodyBoldUnderline: DodadaFont { font(size: 17, weight: 700, underline: true) }
     var calloutRegular: DodadaFont { font(size: 15, weight: 400) }
     var calloutBold: DodadaFont { font(size: 15, weight: 700) }
     var calloutBoldUnderline: DodadaFont { font(size: 15, weight: 700, underline: true) }
     var subheadlineRegular: DodadaFont { font(size: 14, weight: 400) }
     var subheadlineBold: DodadaFont { font(size: 14, weight: 700) }
     var subheadlineBoldUnderline: DodadaFont { font(size: 14, weight: 700, underline: true) }
     var footnoteRegular: DodadaFont { font(size: 12, weight: 400) }
     var footnoteBold: DodadaFont { font(size: 12, weight: 700) }
     var footnoteBoldUnderline: DodadaFont { font(size: 12, weight: 700, underline: true) }
     var caption1Regular: DodadaFont { font(size: 13, weight: 400) }
     var caption1Bold: DodadaFont { font(size: 13, weight: 700) }
     var caption1BoldUnderline: DodadaFont { font(size: 13, weight: 700, underline: true) }
     var caption2Regular: DodadaFont { font(size: 12, weight: 400) }
     var caption2Bold: DodadaFont { font(size: 12, weight: 700) }
     var caption2BoldUnderline: DodadaFont { font(size: 12, weight: 700, underline: true) }

    func font(for token: DodadaTypographyToken) -> DodadaFont {
        switch token {
        case .largeTitleRegular: return self.largeTitleRegular
        case .largeTitleBold: return self.largeTitleBold
        case .largeTitleBoldUnderline: return self.largeTitleBoldUnderline
        case .title1Regular: return self.title1Regular
        case .title1Bold: return self.title1Bold
        case .title1BoldUnderline: return self.title1BoldUnderline
        case .title2Regular: return self.title2Regular
        case .title2Bold: return self.title2Bold
        case .title2BoldUnderline: return self.title2BoldUnderline
        case .title3Regular: return self.title3Regular
        case .title3Bold: return self.title3Bold
        case .title3BoldUnderline: return self.title3BoldUnderline
        case .headlineRegular: return self.headlineRegular
        case .headlineBold: return self.headlineBold
        case .headlineBoldUnderline: return self.headlineBoldUnderline
        case .bodyRegular: return self.bodyRegular
        case .bodyBold: return self.bodyBold
        case .bodyBoldUnderline: return self.bodyBoldUnderline
        case .calloutRegular: return self.calloutRegular
        case .calloutBold: return self.calloutBold
        case .calloutBoldUnderline: return self.calloutBoldUnderline
        case .subheadlineRegular: return self.subheadlineRegular
        case .subheadlineBold: return self.subheadlineBold
        case .subheadlineBoldUnderline: return self.subheadlineBoldUnderline
        case .footnoteRegular: return self.footnoteRegular
        case .footnoteBold: return self.footnoteBold
        case .footnoteBoldUnderline: return self.footnoteBoldUnderline
        case .caption1Regular: return self.caption1Regular
        case .caption1Bold: return self.caption1Bold
        case .caption1BoldUnderline: return self.caption1BoldUnderline
        case .caption2Regular: return self.caption2Regular
        case .caption2Bold: return self.caption2Bold
        case .caption2BoldUnderline: return self.caption2BoldUnderline
        }
    }
}

/// Tema alternativo: mismo contrato que el default, tipografía con tamaños distintos.
/// Uso: `.environment(\.colorTheme, DDDThemeAlternate())`
public struct DDDThemeAlternate: DDDTheme {
    public var name: String { "Alternate" }

    public var colors: DodadaTokenColorTokens { DodadaThemeColorTokensDefault() }
    public var typography: DodadaThemeTypographyTokens { AlternateTypographyTokens() }
    public var foundation: DDDFoundationTokens { FoundationDefault() }
    public var components: DodadaComponentTheme { ComponentThemeDefault() }

    public var defaultButton: Color { Color("Primary", bundle: .module) }
    public var disabledTextButton: Color { Color("Secondary.300", bundle: .module) }
    public var borderRoundButton: CGFloat { 8 }
    public var disabledButton: Color { Color("Secondary.100", bundle: .module) }
    public var hoverButton: Color { Color("Primary.700", bundle: .module) }
}
