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

    private let imageResource: SwiftUI.Image

    public init(_ imageResource: SwiftUI.Image) {
        self.imageResource = imageResource
    }
    public var body: some View {
        if let safeIconColor = iconColor {
            imageResource
                .renderingMode(.template)
                .foregroundColor(iconColor)
        } else {
            imageResource
        }
    }
}
