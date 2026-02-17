//
//  DDDFont.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI

public extension View {
    func textStyles(
        _ token: DodadaTypographyToken = .caption1Regular
    ) -> some View {
       
        self.modifier(DDDThemeTypographyModifier(token: token))
    }
}

public extension Text {
    func textStyle(_ token: DodadaTypographyToken, color: DodadaColorToken = .textPrimary) -> Text {
        let theme = DDDThemeManager.shared.main
        let font = theme.typography.font(for: token)
        return self
            .font(font.toFont())
            .underline(font.underline)
            .kerning(font.letterSpacing ?? 0)
        
           // .foregroundStyle(Color(color.assetName))
            //.lineSpacing(max(0, lineSpacing))
            //.kerning(font.letterSpacing ?? 0)
            //.underline(font.underline) as! Text
    }
}


// MARK: - Theme typography modifier (uses DDDTheme from environment)

private struct DDDThemeTypographyModifier: ViewModifier {
    let token: DodadaTypographyToken
    @Environment(\.colorTheme) private var theme

    func body(content: Content) -> some View {
        // Always uses current theme: theme.typography is the theme's typography tokens
        // (default = DodadaThemeTypographyTokens; custom theme = its own DodadaTokenTextTokens).
        let font = theme.typography.font(for: token)
        let lineSpacing = font.size * font.lineHeight - font.size
        return content
            .font(font.toFont())
            .lineSpacing(max(0, lineSpacing))
            .kerning(font.letterSpacing ?? 0)
            .underline(font.underline)
    }
}

// MARK: - SwiftUI Font conversion

public extension DodadaFont {
    /// Converts this design token font to a SwiftUI `Font`.
    /// Uses the custom family and size; weight is applied via the font name suffix when common (e.g. "Quicksand-Bold").
    func toFont() -> SwiftUI.Font {
        let weightSuffix = Self.weightSuffix(for: weight)
        let fontName = weightSuffix.isEmpty ? family : "\(family)-\(weightSuffix)"
        return SwiftUI.Font.custom(fontName, size: size)
    }

    private static func weightSuffix(for weight: CGFloat) -> String {
        switch weight {
        case 100: return "Thin"
        case 200: return "ExtraLight"
        case 300: return "Light"
        case 400: return "Regular"
        case 500: return "Medium"
        case 600: return "SemiBold"
        case 700: return "Bold"
        case 800: return "ExtraBold"
        case 900: return "Black"
        default: return weight >= 600 ? "Bold" : ""
        }
    }
}


#Preview {
    NavigationView {
        VStack {
            Text("Caption1Regular")
                .textStyle(.caption1Regular)
            Text("Caption1Regular")
                .textStyle(.caption2BoldUnderline)
        }
        .environment(\.colorTheme, DDDThemeManager.shared.main)
    }
    .onAppear {
        Dodada.registerFonts()
    }
}
