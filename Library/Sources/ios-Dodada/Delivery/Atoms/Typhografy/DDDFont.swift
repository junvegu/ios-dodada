//
//  DDDFont.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI

public extension Text {
    func apply(
        token: DDDFontToken = .caption2,
        weight: DDDFontToken.Weigth = .regular
    ) -> some View {
       
            self.modifier(DDDTypographyModifier(typography: token, weight: weight))
    }
}

public struct DDDTypographyModifier: ViewModifier {

    @Environment(\.colorTheme) private var colorTheme: DDDTheme
    
    var typography: DDDFontToken
    var weight: DDDFontToken.Weigth
    
    public func body(content: Content) -> some View {
        
        if #available(iOS 16.0, *) {
            content
                .font(typography.font(weight))
                .kerning(typography.letterSpacing)
                .lineSpacing(typography.lineSpacing)
        } else {
            content
                .font(typography.font(weight))
                .lineSpacing(typography.lineSpacing)
        }
    }
}
