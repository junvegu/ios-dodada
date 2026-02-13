//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import SwiftUI
public struct DDDDesignSystem {
    public static func installGlobally() -> some ViewModifier {
        DesignSystemModifier()
    }

    struct DesignSystemModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .environment(\.colorTheme, ColorThemeEnvironmentKey.defaultValue) // si usas colores también
        }
    }
}
