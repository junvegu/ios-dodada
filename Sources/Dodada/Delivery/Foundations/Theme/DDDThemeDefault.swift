//
//  FoundationDefault.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 5/02/26.
//

import SwiftUI

struct FoundationDefault: DDDFoundationTokens {
    var sizing: DodadaThemeSizingTokens { DodadaThemeSizingTokensDefault()}
    var spacing: DodadaThemeSpacingTokens { DodadaThemeSpacingTokensDefault() }
    var radius: DodadaThemeRadiusTokens { DodadaThemeRadiusTokensDefault() }
    var elevation: DodadaThemeElevationTokens { DodadaThemeElevationTokens() }
    var layout: DodadaThemeLayoutTokens { DodadaThemeLayoutTokensDefault() }
}

struct NavigationBarThemeDefault: DDDNavigationBarTheme {
    var background: Color { .white }
    var titleColor: Color { Color("Secondary", bundle: .module) }
    var tint: Color { Color("Primary", bundle: .module) }
}

struct TabBarThemeDefault: DDDTabBarTheme {
    var background: Color { .white }
    var tint: Color { Color("Primary", bundle: .module) }
    var unselectedTint: Color { Color("Secondary.400", bundle: .module) }
}

struct ComponentThemeDefault: DodadaComponentTheme {
    var button: DDDButtonTheme { DDDButtonThemeDefault() }
    var navigationBar: DDDNavigationBarTheme { NavigationBarThemeDefault() }
    var tabBar: DDDTabBarTheme { TabBarThemeDefault() }
}



struct DDDThemeDefault: DDDTheme {
    var name: String { "Default" }

    var colors: DodadaTokenColorTokens { DodadaThemeColorTokensDefault() }
    var typography: DodadaThemeTypographyTokens { DodadaThemeTypographyTokensDefault() }
    var foundation: DDDFoundationTokens { FoundationDefault() }
    var components: DodadaComponentTheme { ComponentThemeDefault() }

    var defaultButton: Color { Color("Primary", bundle: .module) }
    var disabledTextButton: Color { Color("Secondary.300", bundle: .module) }
    var borderRoundButton: CGFloat { 8 }
    var disabledButton: Color { Color("Secondary.100", bundle: .module) }
    var hoverButton: Color { Color("Primary.700", bundle: .module) }
}
