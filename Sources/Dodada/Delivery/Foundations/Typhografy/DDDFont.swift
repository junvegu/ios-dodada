//
//  DDDFont.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI

public extension View {
    func apply(
        token: DDDFontToken = .caption2,
        weight: DDDFontToken.Weigth = .regular
    ) -> some View {
       
            self.modifier(DDDTypographyModifier(typography: token, weight: weight))
    }
}



public struct DDDTypographyModifier: ViewModifier {
    @Environment(\.dddFontProvider) private var fontProvider
    @Environment(\.colorTheme) private var colorTheme: DDDTheme
    
    var typography: DDDFontToken
    var weight: DDDFontToken.Weigth
    
    public func body(content: Content) -> some View {
        content
            .font(fontProvider.font(for: typography, weight: weight))
            .kerning(typography.letterSpacing)
            .lineSpacing(typography.lineSpacing)
    }
}
