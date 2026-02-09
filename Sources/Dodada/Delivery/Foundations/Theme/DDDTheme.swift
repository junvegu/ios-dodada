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
    private static func font(size: CGFloat, weight: CGFloat, lineHeight: CGFloat = 1.5, letterSpacing: CGFloat? = nil, underline: Bool = false) -> DodadaFont {
        DodadaFont(family: "ChalkboardSE", size: size, weight: weight, lineHeight: lineHeight, letterSpacing: letterSpacing, underline: underline)
    }

    static var largeTitleRegular: DodadaFont { font(size: 32, weight: 400) }
    static var largeTitleBold: DodadaFont { font(size: 32, weight: 700) }
    static var largeTitleBoldUnderline: DodadaFont { font(size: 32, weight: 700, underline: true) }
    static var title1Regular: DodadaFont { font(size: 24, weight: 400) }
    static var title1Bold: DodadaFont { font(size: 24, weight: 700) }
    static var title1BoldUnderline: DodadaFont { font(size: 24, weight: 700, underline: true) }
    static var title2Regular: DodadaFont { font(size: 22, weight: 400) }
    static var title2Bold: DodadaFont { font(size: 22, weight: 700) }
    static var title2BoldUnderline: DodadaFont { font(size: 22, weight: 700, underline: true) }
    static var title3Regular: DodadaFont { font(size: 20, weight: 400) }
    static var title3Bold: DodadaFont { font(size: 20, weight: 700) }
    static var title3BoldUnderline: DodadaFont { font(size: 20, weight: 700, underline: true) }
    static var headlineRegular: DodadaFont { font(size: 19, weight: 400) }
    static var headlineBold: DodadaFont { font(size: 19, weight: 700) }
    static var headlineBoldUnderline: DodadaFont { font(size: 19, weight: 700, underline: true) }
    static var bodyRegular: DodadaFont { font(size: 17, weight: 400) }
    static var bodyBold: DodadaFont { font(size: 17, weight: 700) }
    static var bodyBoldUnderline: DodadaFont { font(size: 17, weight: 700, underline: true) }
    static var calloutRegular: DodadaFont { font(size: 15, weight: 400) }
    static var calloutBold: DodadaFont { font(size: 15, weight: 700) }
    static var calloutBoldUnderline: DodadaFont { font(size: 15, weight: 700, underline: true) }
    static var subheadlineRegular: DodadaFont { font(size: 14, weight: 400) }
    static var subheadlineBold: DodadaFont { font(size: 14, weight: 700) }
    static var subheadlineBoldUnderline: DodadaFont { font(size: 14, weight: 700, underline: true) }
    static var footnoteRegular: DodadaFont { font(size: 12, weight: 400) }
    static var footnoteBold: DodadaFont { font(size: 12, weight: 700) }
    static var footnoteBoldUnderline: DodadaFont { font(size: 12, weight: 700, underline: true) }
    static var caption1Regular: DodadaFont { font(size: 13, weight: 400) }
    static var caption1Bold: DodadaFont { font(size: 13, weight: 700) }
    static var caption1BoldUnderline: DodadaFont { font(size: 13, weight: 700, underline: true) }
    static var caption2Regular: DodadaFont { font(size: 12, weight: 400) }
    static var caption2Bold: DodadaFont { font(size: 12, weight: 700) }
    static var caption2BoldUnderline: DodadaFont { font(size: 12, weight: 700, underline: true) }

    func font(for token: DodadaTypographyToken) -> DodadaFont {
        switch token {
        case .largeTitleRegular: return Self.largeTitleRegular
        case .largeTitleBold: return Self.largeTitleBold
        case .largeTitleBoldUnderline: return Self.largeTitleBoldUnderline
        case .title1Regular: return Self.title1Regular
        case .title1Bold: return Self.title1Bold
        case .title1BoldUnderline: return Self.title1BoldUnderline
        case .title2Regular: return Self.title2Regular
        case .title2Bold: return Self.title2Bold
        case .title2BoldUnderline: return Self.title2BoldUnderline
        case .title3Regular: return Self.title3Regular
        case .title3Bold: return Self.title3Bold
        case .title3BoldUnderline: return Self.title3BoldUnderline
        case .headlineRegular: return Self.headlineRegular
        case .headlineBold: return Self.headlineBold
        case .headlineBoldUnderline: return Self.headlineBoldUnderline
        case .bodyRegular: return Self.bodyRegular
        case .bodyBold: return Self.bodyBold
        case .bodyBoldUnderline: return Self.bodyBoldUnderline
        case .calloutRegular: return Self.calloutRegular
        case .calloutBold: return Self.calloutBold
        case .calloutBoldUnderline: return Self.calloutBoldUnderline
        case .subheadlineRegular: return Self.subheadlineRegular
        case .subheadlineBold: return Self.subheadlineBold
        case .subheadlineBoldUnderline: return Self.subheadlineBoldUnderline
        case .footnoteRegular: return Self.footnoteRegular
        case .footnoteBold: return Self.footnoteBold
        case .footnoteBoldUnderline: return Self.footnoteBoldUnderline
        case .caption1Regular: return Self.caption1Regular
        case .caption1Bold: return Self.caption1Bold
        case .caption1BoldUnderline: return Self.caption1BoldUnderline
        case .caption2Regular: return Self.caption2Regular
        case .caption2Bold: return Self.caption2Bold
        case .caption2BoldUnderline: return Self.caption2BoldUnderline
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
