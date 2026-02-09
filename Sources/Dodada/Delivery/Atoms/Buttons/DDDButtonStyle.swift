//
//  DDDButtonStyle.swift
//  Dodada
//
//  ButtonStyle that applies DDDButton appearance by design variant (primary, secondary, etc.).
//

import SwiftUI

/// Internal ButtonStyle that renders DDDButton according to `DDDButtonDesing`.
/// Named to avoid confusion: the public component is `DDDButton` (singular); this is its style.
struct DDDButtonAppearanceStyle<LeadingIcon: View, TrailingIcon: View>: ButtonStyle {
    private var desing: DDDButtonDesing
    private let size: DDDButtonSize
    private let fullWidth: Bool
    private let iconBuilder: (DDDIconState) -> LeadingIcon
    private let disclosureIconBuilder: (DDDIconState) -> TrailingIcon

    init(
        desing: DDDButtonDesing,
        size: DDDButtonSize,
        fullWidth: Bool = false,
        iconBuilder: @escaping (DDDIconState) -> LeadingIcon,
        disclosureIconBuilder: @escaping (DDDIconState) -> TrailingIcon
    ) {
        self.desing = desing
        self.size = size
        self.fullWidth = fullWidth
        self.iconBuilder = iconBuilder
        self.disclosureIconBuilder = disclosureIconBuilder
    }

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        DDDButtonStyleContent(
            configuration: configuration,
            desing: desing,
            size: size,
            fullWidth: fullWidth,
            iconBuilder: iconBuilder,
            disclosureIconBuilder: disclosureIconBuilder
        )
    }
}

/// Wrapper to get theme/isEnabled from environment and pass to icon builders.
private struct DDDButtonStyleContent<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon

    @Environment(\.isEnabled) private var isEnabled: Bool
    @Environment(\.colorTheme) private var theme: DDDTheme

    var body: some View {
        let state = DDDIconState(theme: theme, isEnabled: isEnabled, isPressed: configuration.isPressed)
        switch desing {
        case .primary:
            AnyView(
                DDDButtonFillStyleView(
                    configuration: configuration,
                    desing: desing,
                    size: size,
                    fullWidth: fullWidth,
                    iconBuilder: iconBuilder,
                    disclosureIconBuilder: disclosureIconBuilder,
                    state: state
                )
            )
        case .secondary, .secondaryDark:
            AnyView(
                DDDButtonSecondaryStyleView(
                    configuration: configuration,
                    desing: desing,
                    size: size,
                    fullWidth: fullWidth,
                    iconBuilder: iconBuilder,
                    disclosureIconBuilder: disclosureIconBuilder,
                    state: state
                )
            )
        case .tertiary:
            AnyView(
                DDDButtonTertiaryStyleView(
                    configuration: configuration,
                    desing: desing,
                    size: size,
                    fullWidth: fullWidth,
                    iconBuilder: iconBuilder,
                    disclosureIconBuilder: disclosureIconBuilder,
                    state: state
                )
            )
        case .onlyIcon:
            AnyView(
                DDDButtonIconStyleView(
                    configuration: configuration,
                    desing: desing,
                    size: size,
                    fullWidth: fullWidth,
                    iconBuilder: iconBuilder,
                    disclosureIconBuilder: disclosureIconBuilder,
                    state: state
                )
            )
        case .link:
            AnyView(
                DDDButtonLinkStyleView(
                    configuration: configuration,
                    desing: desing,
                    size: size,
                    fullWidth: fullWidth,
                    iconBuilder: iconBuilder,
                    disclosureIconBuilder: disclosureIconBuilder,
                    state: state
                )
            )
        case .ghost:
            AnyView(
                DDDButtonGhostStyleView(
                    configuration: configuration,
                    desing: desing,
                    size: size,
                    fullWidth: fullWidth,
                    iconBuilder: iconBuilder,
                    disclosureIconBuilder: disclosureIconBuilder,
                    state: state
                )
            )
        }
    }
}
