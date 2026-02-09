//
//  DDDButton.swift
//  Dodada
//
//  Public API: single button component (DDDButton). Style logic in DDDButtonStyle + DDDButtonStyleViews.
//

import SwiftUI

/// Dodada button component. Use `desing:` to pick variant (primary, secondary, tertiary, link, ghost, onlyIcon).
public struct DDDButton<LeadingIcon: View, TrailingIcon: View>: View {
    private let label: String
    private let action: () -> Void
    private let desing: DDDButtonDesing
    private let size: DDDButtonSize
    private let fullWidth: Bool

    private let iconBuilder: (DDDIconState) -> LeadingIcon
    private let disclosureIconBuilder: (DDDIconState) -> TrailingIcon

    public var body: some View {
        button.buttonStyle(
            DDDButtonAppearanceStyle(
                desing: desing,
                size: size,
                fullWidth: fullWidth,
                iconBuilder: iconBuilder,
                disclosureIconBuilder: disclosureIconBuilder
            )
        )
    }

    @ViewBuilder private var button: some View {
        SwiftUI.Button {
            action()
        } label: {
            Text(label)
        }
    }

    /// Init with token-based icons. Icons receive `DDDIconState` (theme, isEnabled, isPressed) so they can render correct colors.
    public init(
        _ label: String = "",
        desing: DDDButtonDesing = .primary,
        size: DDDButtonSize = .regular,
        fullWidth: Bool = true,
        icon: DodadaIconToken? = nil,
        disclosureIcon: DodadaIconToken? = nil,
        action: @escaping () -> Void
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.label = label
        self.desing = desing
        self.size = size
        self.fullWidth = fullWidth
        self.action = action
        self.iconBuilder = { state in
            guard let token = icon else { return DDDIcon(nil) }
            let color = desing.getIconColor(by: state.theme, isDisabled: state.isDisabled, isPressed: state.isPressed)
            return color.map { DDDIcon(token).iconColor($0) } ?? DDDIcon(token)
        }
        self.disclosureIconBuilder = { state in
            guard let token = disclosureIcon else { return DDDIcon(nil) }
            let color = desing.getIconColor(by: state.theme, isDisabled: state.isDisabled, isPressed: state.isPressed)
            return color.map { DDDIcon(token).iconColor($0) } ?? DDDIcon(token)
        }
    }

    /// Init with custom icon builders that receive state (theme, isEnabled, isPressed).
    public init(
        _ label: String = "",
        desing: DDDButtonDesing = .primary,
        size: DDDButtonSize = .regular,
        fullWidth: Bool = false,
        action: @escaping () -> Void,
        @ViewBuilder icon: @escaping (DDDIconState) -> LeadingIcon,
        @ViewBuilder disclosureIcon: @escaping (DDDIconState) -> TrailingIcon = { _ in EmptyView() }
    ) {
        self.label = label
        self.desing = desing
        self.size = size
        self.fullWidth = fullWidth
        self.action = action
        self.iconBuilder = icon
        self.disclosureIconBuilder = disclosureIcon
    }

    /// Init with static icons (no state). Icons won't change color on pressed/disabled.
    public init(
        _ label: String = "",
        desing: DDDButtonDesing = .primary,
        size: DDDButtonSize = .regular,
        fullWidth: Bool = false,
        action: @escaping () -> Void,
        @ViewBuilder icon: @escaping () -> LeadingIcon,
        @ViewBuilder disclosureIcon: @escaping () -> TrailingIcon = { EmptyView() }
    ) {
        self.label = label
        self.desing = desing
        self.size = size
        self.fullWidth = fullWidth
        self.action = action
        self.iconBuilder = { _ in icon() }
        self.disclosureIconBuilder = { _ in disclosureIcon() }
    }
}

// MARK: - Button extension

extension Button {
    /// Applies Dodada button appearance (no icons).
    func d3StyleApply(design: DDDButtonDesing = .primary) -> some View {
        buttonStyle(DDDButtonAppearanceStyle(
            desing: design,
            size: .regular,
            fullWidth: false,
            iconBuilder: { _ in EmptyView() },
            disclosureIconBuilder: { _ in EmptyView() }
        ))
    }
}

// MARK: - Previews

#Preview {
    NavigationView {
        VStack(spacing: 4) {
            DDDButton(
                "Primary",
                desing: .primary,
                size: .regular,
                icon: .feedbackAlertCircle,
                disclosureIcon: .actionsAdd
            ) {
                print("tap")
            }.disabled(true)

            DDDButton("Primary No full", desing: .primary, fullWidth: false, icon: .actionsAdd, disclosureIcon: .feedbackAlertCircle) {
                print("tap")
            }

            DDDButton("Secondary", desing: .secondary, icon: .socialApple, disclosureIcon: .specialAquisito) {
                print("tap")
            }

            DDDButton("Secondary Dark", desing: .secondaryDark, icon: .socialGoogle, disclosureIcon: .specialAquisito) {
                print("tap")
            }

            DDDButton("Tertiary", desing: .tertiary, icon: .socialApple, disclosureIcon: .specialAquisito) {
                print("tap")
            }

            DDDButton("Link", desing: .link, icon: .actionsAdd, disclosureIcon: .feedbackAlertCircle) {
                print("tap")
            }

            DDDButton("Link", desing: .ghost, icon: .actionsAdd, disclosureIcon: .feedbackAlertCircle) {
                print("tap")
            }

            HStack {
                Spacer()
                DDDButton("Link", desing: .link) {
                    print("tap")
                }
            }
            .frame(maxWidth: .infinity)

            DDDButton("Only icon", desing: .onlyIcon(inverted: false), icon: .actionsAdd, disclosureIcon: .feedbackAlertCircle) {
                print("tap")
            }
            DDDButton("Only icon", desing: .onlyIcon(inverted: true), icon: .actionsAdd, disclosureIcon: .feedbackAlertCircle) {
                print("tap")
            }
        }
        .padding()
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }.onAppear {
        Dodada.registerFonts()
    }
   
}
