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
    @Environment(\.colorTheme) private var theme: DDDTheme

    private let icon: DodadaIconToken?
    private let color: DodadaColorToken?
    private let size: DodadaSizingToken
    private let overrideColor: Color?

    public init(
        _ icon: DodadaIconToken?,
        color: DodadaColorToken? = nil,
        size: DodadaSizingToken = .iconMd
    ) {
        self.icon = icon
        self.color = color
        self.size = size
        self.overrideColor = nil
    }

    internal init(
        _ icon: DodadaIconToken?,
        color: DodadaColorToken? = nil,
        size: DodadaSizingToken = .iconMd,
        overrideColor: Color? = nil
    ) {
        self.icon = icon
        self.color = color
        self.size = size
        self.overrideColor = overrideColor
    }

    public var body: some View {
         resolvedImage
             .frame(width: resolvedSize, height: resolvedSize)
             .opacity(isEnabled ? 1.0 : disabledOpacity)
             .accessibilityHidden(true)
     }

    /// Aplica un Color de SwiftUI al icono (sin token). Solo para uso directo en DDDIcon.
    public func iconColor(_ color: Color) -> DDDIcon {
        DDDIcon(icon, color: self.color, size: size, overrideColor: color)
    }
 }

 // MARK: - Image resolution

 private extension DDDIcon {
     
     @ViewBuilder
     var resolvedImage: some View {
         if let icon = icon {
             let tintColor: Color? = overrideColor ?? color.map { theme.colors.toColor(for: $0) }
             if let tint = tintColor {
                 Image(icon.assetName, bundle: .module)
                     .renderingMode(.template)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .foregroundColor(tint)
             } else {
                 Image(icon.assetName, bundle: .module)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
             }
         } else {
             EmptyView()
         }
     }
     
     var resolvedSize: CGFloat {
         size.toCGFloat(using: theme)
     }
     
     var disabledOpacity: Double {
         0.4
     }
 }


#Preview {
    VStack {
        DDDIcon(.restaurantAnticucho, color: nil, size: .iconLg)
        DDDIcon(.restaurantAnticucho, color: nil, size: .iconMd)
        DDDIcon(.restaurantAnticucho, color: nil, size: .iconTwoXl)
    }
}
