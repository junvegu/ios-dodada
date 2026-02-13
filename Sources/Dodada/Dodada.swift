// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct Dodada {
    
    public static func registerFonts() {
        registerFont(bundle: .module, fontName: "Quicksand-Bold", fontExtension: "ttf")
        registerFont(bundle: .module, fontName: "Quicksand-Light", fontExtension: "ttf")
        registerFont(bundle: .module, fontName: "Quicksand-Medium", fontExtension: "ttf")
        registerFont(bundle: .module, fontName: "Quicksand-Regular", fontExtension: "ttf")
        registerFont(bundle: .module, fontName: "Quicksand-SemiBold", fontExtension: "ttf")
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
    
    
}
