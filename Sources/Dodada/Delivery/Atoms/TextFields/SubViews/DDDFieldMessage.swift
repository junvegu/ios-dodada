//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

public struct FieldMessage: View {
    @Environment(\.sizeCategory) private var sizeCategory

    private let message: Message?
    private let spacing: CGFloat

    public var body: some View {
        if let message = message, message.isEmpty == false {
            HStack(alignment: .center, spacing: spacing) {
                if let icon = message.icon {
                    DDDIcon(icon, iconColor: message.color)
                        .accessibility(hidden: true)
                        .alignmentGuide(.firstTextBaseline) { $0.height * 0.82 }
                }

                Text(message.description)
                    .apply(token: .caption2, weight: .regular)
            }
            .iconSize(custom: .small)
            .foregroundStyle(message.color)
            .transition(.opacity.animation(.easeOut(duration: 0.2)))
            .accessibilityElement(children: .combine)
        }
    }

    public init(_ message: Message?, spacing: CGFloat = .xxSmall) {
        self.message = message
        self.spacing = spacing
    }
}
