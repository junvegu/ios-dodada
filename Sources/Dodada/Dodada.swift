// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct Dodada {
    
    public static func registerFonts() {
        
        FontFamily.Quicksand.all.forEach {
            registerFont(bundle: .module, fontName: $0.name, fontExtension: "ttf")
        }
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


public struct ColorThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: DDDTheme = ColorThemeDefault()
}

extension EnvironmentValues {
    public var colorTheme: DDDTheme {
        get { self[ColorThemeEnvironmentKey.self] }
        set { self[ColorThemeEnvironmentKey.self] = newValue }
    }
}

public protocol DDDTheme {
    var navigationBackground: Color { get }
    var tintTabBar: Color { get }
    var titleNavigationBar: Color { get }
    var tintBarButton: Color { get }
    
    /// Fonts Colors
    ///
    var enabledText: Color { get }
    var disabledText: Color { get }
    
    /// Button Colors
    var disabledButton: Color { get }
    var disabledTextButton: Color { get }

    var hoverButton: Color { get }
    var defaultButton: Color { get }
    var pressedButton: Color { get }
    
    /// Semantic Colors
    var error: Color { get }
    var info: Color { get }
    var success: Color { get }
    var warning: Color { get }
    
    
    var borderRoundButton: CGFloat { get }
    var offBorderRoundButton: CGFloat { get }
    var linkBorderRoundButton: CGFloat { get }
}

struct ColorThemeDefault: DDDTheme {
    var linkBorderRoundButton: CGFloat = 24
    
    var offBorderRoundButton: CGFloat = 0
    
    var borderRoundButton: CGFloat = 8
    
    let navigationBackground: Color = .white
    
    var tintTabBar: Color = .white
    
    var titleNavigationBar: Color = .white
    
    var tintBarButton: Color = Color("Primary", bundle: .module)
    
    var enabledText: Color = Color("Secondary", bundle: .module)
    
    var disabledText: Color = Color("Secondary.400", bundle: .module)
    
    var disabledButton: Color = Color("Secondary.100", bundle: .module)
    
    var disabledTextButton: Color = Color("Secondary.300", bundle: .module)
    
    var hoverButton: Color = Color("Primary.700", bundle: .module)
    
    var defaultButton: Color = Color("Primary", bundle: .module)
    
    var pressedButton: Color = Color("Primary.400", bundle: .module)
    
    var error: Color = Color("Error", bundle: .module)
    
    var info: Color = Color("Info", bundle: .module)
    
    var success: Color = Color("Success", bundle: .module)
    
    var warning: Color = Color("Warning", bundle: .module)
    
    
}
