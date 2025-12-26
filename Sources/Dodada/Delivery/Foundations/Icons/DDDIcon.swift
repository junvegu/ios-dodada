//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/04/24.
//

import Foundation
import SwiftUI

public struct DDDIcon: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    @Environment(\.colorTheme) private var colorTheme: DDDTheme
    @Environment(\.iconSize) private var iconSize: DDDIconSize

    private let imageResource: SwiftUI.Image?
    private let iconColor: Color?

    public init(_ icon: DDDIcon.Images?, iconColor: Color? = nil) {
        self.imageResource = icon?.image.swiftUIImage
        self.iconColor = iconColor
    }
    
    public var body: some View {
        if let imageResource = imageResource {
            if let safeIconColor = iconColor {
                imageResource
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(!isEnabled ? colorTheme.disabledTextButton : safeIconColor)
                    .frame(width: iconSize.value, height: iconSize.value)
            } else {
                imageResource
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: iconSize.value, height: iconSize.value)
            }
        } else {
            EmptyView()
        }
    }
}
