//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/04/24.
//

import Foundation
import SwiftUI

public struct DDDIcon: View {
    @Environment(\.iconColor) private var iconColor
    @Environment(\.isEnabled) private var isEnabled: Bool
    @Environment(\.colorTheme) private var colorTheme: DDDTheme

    private let imageResource: SwiftUI.Image?

    public init(_ imageResource: SwiftUI.Image?) {
        self.imageResource = imageResource
    }
    public var body: some View {
        if let imageResource = imageResource {
            if let safeIconColor = iconColor {
                imageResource
                    .renderingMode(.template)
                    .foregroundColor(!isEnabled ? colorTheme.disabledTextButton :  iconColor)
                
            } else {
                imageResource
            }
        } else {
            EmptyView()
        }

    }
}
