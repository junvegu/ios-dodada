//
//  DDDText.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI
public enum DDDLabelToken {
    static let gap: CGFloat = 2
}

public struct DDDLabel<LeadingIcon: View, TrailingIcon: View>: View {
    
    @ViewBuilder private let leadingIcon: LeadingIcon
    @ViewBuilder private let trailingIcon: TrailingIcon
    private let text: String
    private let token: DDDFontToken
    private let weight: DDDFontToken.Weigth
    
    public var body: some View {
        HStack(spacing: DDDLabelToken.gap) {
            leadingIcon
            Text(text).apply(token: token, weight: weight)
            trailingIcon
        }
    }
}
public extension DDDLabel {
    
    init(
        _ text: String = "",
        token: DDDFontToken = .caption2,
        weight: DDDFontToken.Weigth = .regular,
        @ViewBuilder icon: () -> LeadingIcon,
        @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.text = text
        self.token = token
        self.weight = weight
        self.leadingIcon = icon()
        self.trailingIcon = disclosureIcon()
    }
    
    init(
        _ text: String = "",
        token: DDDFontToken = .caption2,
        weight: DDDFontToken.Weigth = .regular,
        icon: DDDIcon.Images? = nil,
        disclosureIcon: DDDIcon.Images? = nil
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.init(text, token: token, weight: weight, icon: {
            DDDIcon(icon)
        }, disclosureIcon: {
            DDDIcon(disclosureIcon)
        })
    }
}
#Preview {
    DDDLabel("Esternocleidomastoideo", icon: .add)
}
