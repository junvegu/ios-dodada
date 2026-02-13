//
//  DDDLabel.swift
//  Dodada UI Component
//
//  Created by Junior Quevedo Gutiérrez on 20/01/24.
//

import Foundation
import SwiftUI

// MARK: - DDDLabel

/// Label component with optional leading and trailing icons.
public struct DDDLabel<LeadingIcon: View, TrailingIcon: View>: View {

    // MARK: - Configuration
    private let text: String
    private let token: DodadaTypographyToken
    @ViewBuilder private let leadingIcon: LeadingIcon
    @ViewBuilder private let trailingIcon: TrailingIcon

    // MARK: - Body
    public var body: some View {
        HStack(spacing: .spacingTwoXs) {
            leadingIcon
            Text(text).textStyle(token)
            trailingIcon
        }
    }
}

// MARK: - Initializers

public extension DDDLabel {

    init(
        _ text: String = "",
        token: DodadaTypographyToken = .caption2Regular,
        @ViewBuilder icon: () -> LeadingIcon,
        @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.text = text
        self.token = token
        self.leadingIcon = icon()
        self.trailingIcon = disclosureIcon()
    }

    init(
        _ text: String = "",
        token: DodadaTypographyToken = .caption2Regular,
        icon: DodadaIconToken? = nil,
        disclosureIcon: DodadaIconToken? = nil
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.init(text, token: token, icon: {
            DDDIcon(icon, size: .iconSm)
        }, disclosureIcon: {
            DDDIcon(disclosureIcon, size: .iconSm)
        })
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        DDDLabel("Esternocleidomastoideo", icon: .actionsAdd)
    }
    .onAppear {
        Dodada.registerFonts()
    }
}
