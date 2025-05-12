//
//  DDDFontToken.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI

struct MyCustomFontProvider: DDDFontProviding {
    func font(for token: DDDFontToken, weight: DDDFontToken.Weigth) -> SwiftUI.Font {
        let fontName: String

        switch weight {
        case .regular:
            fontName = "Quicksand-Medium"
        case .bold:
            fontName = "Quicksand-Bold"
        case .light:
            fontName = "Quicksand-Light"
        }

        return SwiftUI.Font.custom(fontName, size: token.size)
    }
}


public protocol DDDFontProviding {
    func font(for token: DDDFontToken, weight: DDDFontToken.Weigth) -> SwiftUI.Font
}

public struct DDDFontProviderDefault: DDDFontProviding {
    public init() {}
    
    public func font(for token: DDDFontToken, weight: DDDFontToken.Weigth) -> SwiftUI.Font {
        weight.value.swiftUIFont(size: token.size)
    }
}

public enum DDDFontToken: String, CaseIterable {
    case caption2
    case caption1
    case footNote
    case subheadline
    case callOut
    case body
    case headline
    case title3
    case title2
    case title1
    case largeTitle
    
    public enum Weigth {
        case regular
        case bold
        case light
        
        var value: FontConvertible {
            switch self {
            case .regular:
                return FontFamily.Quicksand.regular
            case .bold:
                return FontFamily.Quicksand.bold
            case .light:
                return FontFamily.Quicksand.light
            }
        }
    }
    
    
    
    public var size: CGFloat {
        switch self {
        case .caption2:
            return 11
        case .caption1:
            return 11
        case .footNote:
            return 13
        case .subheadline:
            return 15
        case .callOut:
            return 16
        case .body:
            return 17
        case .headline:
            return 17
        case .title3:
            return 20
        case .title2:
            return 22
        case .title1:
            return 28
        case .largeTitle:
            return 34
        }
    }
    
    public var letterSpacing: CGFloat {
        switch self {
        case .caption2:
            return 0.07
        case .caption1:
            return 0
        case .footNote:
            return -0.08
        case .subheadline:
            return -0.24
        case .callOut:
            return -0.32
        case .body:
            return -0.41
        case .headline:
            return -0.41
        case .title3:
            return 0.38
        case .title2:
            return 0.35
        case .title1:
            return 0.36
        case .largeTitle:
            return 0.37
        }
    }
    
    public var lineSpacing: CGFloat {
        return 0
       /* switch self {
        case .caption2:
            return 13
        case .caption1:
            return 16
        case .footNote:
            return 18
        case .subheadline:
            return 20
        case .callOut:
            return 21
        case .body:
            return 22
        case .headline:
            return 22
        case .title3:
            return 25
        case .title2:
            return 28
        case .title1:
            return 34
        case .largeTitle:
            return 41
        }*/
    }
    
    public func font(_ weight: Weigth) -> SwiftUI.Font {
        return weight.value.swiftUIFont(size: size)
    }
}
