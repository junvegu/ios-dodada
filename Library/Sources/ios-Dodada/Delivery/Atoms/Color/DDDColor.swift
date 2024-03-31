//
//  File.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 28/03/24.
//

import SwiftUI

public extension Color {
    static let designSystem: DDDTheme = Environment(\.colorTheme).wrappedValue
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
