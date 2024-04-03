//
//  File.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 28/03/24.
//

import SwiftUI

public extension Color {
    static let designSystem: DDDTheme = Environment(\.colorTheme).wrappedValue
    
    static let black = ColorAsset(name: "Black")
    static let error = ColorAsset(name: "Error")
    static let info = ColorAsset(name: "Info")
    static let primary100 = ColorAsset(name: "Primary.100")
    static let primary200 = ColorAsset(name: "Primary.200")
    static let primary300 = ColorAsset(name: "Primary.300")
    static let primary400 = ColorAsset(name: "Primary.400")
    static let primary600 = ColorAsset(name: "Primary.600")
    static let primary700 = ColorAsset(name: "Primary.700")
    static let primary800 = ColorAsset(name: "Primary.800")
    static let primary900 = ColorAsset(name: "Primary.900")
    static let primary = ColorAsset(name: "Primary")
    static let secondary100 = ColorAsset(name: "Secondary.100")
    static let secondary200 = ColorAsset(name: "Secondary.200")
    static let secondary300 = ColorAsset(name: "Secondary.300")
    static let secondary400 = ColorAsset(name: "Secondary.400")
    static let secondary600 = ColorAsset(name: "Secondary.600")
    static let secondary700 = ColorAsset(name: "Secondary.700")
    static let secondary800 = ColorAsset(name: "Secondary.800")
    static let secondary900 = ColorAsset(name: "Secondary.900")
    static let secondary = ColorAsset(name: "Secondary")
    static let success = ColorAsset(name: "Success")
    static let warning = ColorAsset(name: "Warning")
    static let white = ColorAsset(name: "White")
}

private struct DSRectangle: View {
    @Environment(\.colorTheme) private var colorTheme
    let key: KeyPath<DDDTheme, Color>
    
    init(key: KeyPath<DDDTheme, Color>) {
        self.key = key
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(colorTheme[keyPath: key])
    }
}

struct Color_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Text("Colors!")
                .environment(\.colorScheme, .dark)
            HStack{
                DSRectangle(key: \.navigationBackground)
                DSRectangle(key: \.titleNavigationBar)
                DSRectangle(key: \.tintTabBar)
                DSRectangle(key: \.tintBarButton)
                
                DSRectangle(key: \.defaultButton)
                DSRectangle(key: \.disabledButton)
                DSRectangle(key: \.hoverButton)
                DSRectangle(key: \.pressedButton)
                
                DSRectangle(key: \.error)
                DSRectangle(key: \.info)
                DSRectangle(key: \.warning)
                DSRectangle(key: \.success)
            }
            
            HStack{
                DSRectangle(key: \.navigationBackground)
                DSRectangle(key: \.titleNavigationBar)
                DSRectangle(key: \.tintTabBar)
                DSRectangle(key: \.tintBarButton)

                DSRectangle(key: \.defaultButton)
                DSRectangle(key: \.disabledButton)
                DSRectangle(key: \.hoverButton)
                DSRectangle(key: \.pressedButton)
                
                DSRectangle(key: \.error)
                DSRectangle(key: \.info)
                DSRectangle(key: \.warning)
                DSRectangle(key: \.success)
            }
            .environment(\.colorTheme, ColorThemeDefault())
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
