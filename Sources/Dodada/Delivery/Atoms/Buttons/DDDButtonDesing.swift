//
//  DDDButtonDesing.swift
//  Dodada
//
//  Design tokens for button variants. Uses DodadaButtonThemeTokens for token-based styling.
//

import SwiftUI

public enum DDDButtonSize {
    case regular
    case medium
    case small
}

public enum DDDButtonDesing {
    case primary
    case secondary
    case secondaryDark
    case tertiary
    case onlyIcon(inverted: Bool)
    case ghost
    case link

    // MARK: - Foreground (text) color

    public func getForegroundColor(by theme: DDDTheme, size: DDDButtonSize = .regular, isDisabled: Bool = false, isPressed: Bool) -> Color {
        switch (self, size) {
        case (.primary, .regular):
            let tokens = isDisabled ? DodadaButtonPrimaryRegularTokens.disabledState
                : isPressed ? DodadaButtonPrimaryRegularTokens.pressedState
                : DodadaButtonPrimaryRegularTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.primary, .medium):
            let tokens = isDisabled ? DodadaButtonPrimaryMediumTokens.disabledState
                : isPressed ? DodadaButtonPrimaryMediumTokens.pressedState
                : DodadaButtonPrimaryMediumTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.primary, .small):
            let tokens = isDisabled ? DodadaButtonPrimarySmallTokens.disabledState
                : isPressed ? DodadaButtonPrimarySmallTokens.pressedState
                : DodadaButtonPrimarySmallTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.secondary, .regular), (.secondaryDark, .regular):
            let tokens = isDisabled ? DodadaButtonSecondaryRegularTokens.disabledState
                : isPressed ? DodadaButtonSecondaryRegularTokens.pressedState
                : DodadaButtonSecondaryRegularTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.secondary, .medium), (.secondaryDark, .medium):
            let tokens = isDisabled ? DodadaButtonSecondaryMediumTokens.disabledState
                : isPressed ? DodadaButtonSecondaryMediumTokens.pressedState
                : DodadaButtonSecondaryMediumTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.secondary, .small), (.secondaryDark, .small):
            let tokens = isDisabled ? DodadaButtonSecondarySmallTokens.disabledState
                : isPressed ? DodadaButtonSecondarySmallTokens.pressedState
                : DodadaButtonSecondarySmallTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.tertiary, .regular):
            let tokens = isDisabled ? DodadaButtonTertiaryRegularTokens.disabledState
                : isPressed ? DodadaButtonTertiaryRegularTokens.pressedState
                : DodadaButtonTertiaryRegularTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.tertiary, .medium):
            let tokens = isDisabled ? DodadaButtonTertiaryMediumTokens.disabledState
                : isPressed ? DodadaButtonTertiaryMediumTokens.pressedState
                : DodadaButtonTertiaryMediumTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.tertiary, .small):
            let tokens = isDisabled ? DodadaButtonTertiarySmallTokens.disabledState
                : isPressed ? DodadaButtonTertiarySmallTokens.pressedState
                : DodadaButtonTertiarySmallTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.link, .regular):
            let tokens = isDisabled ? DodadaButtonLinkRegularTokens.disabledState
                : isPressed ? DodadaButtonLinkRegularTokens.pressedState
                : DodadaButtonLinkRegularTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.link, .medium):
            let tokens = isDisabled ? DodadaButtonLinkMediumTokens.disabledState
                : isPressed ? DodadaButtonLinkMediumTokens.pressedState
                : DodadaButtonLinkMediumTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.link, .small):
            let tokens = isDisabled ? DodadaButtonLinkSmallTokens.disabledState
                : isPressed ? DodadaButtonLinkSmallTokens.pressedState
                : DodadaButtonLinkSmallTokens.defaultState
            return tokens.textColor?.toColor(using: theme) ?? .clear
        case (.ghost, .regular):
            let tokens = isDisabled ? DodadaButtonGhostRegularTokens.disabledState
                : isPressed ? DodadaButtonGhostRegularTokens.pressedState
                : DodadaButtonGhostRegularTokens.defaultState
            if let textColor = tokens.textColor {
                return textColor.toColor(using: theme)
            }
            return isDisabled ? theme.disabledTextButton : (isPressed ? DodadaButtonGhostRegularTokens.hoverState.textColor?.toColor(using: theme) ?? theme.disabledTextButton : DodadaButtonGhostRegularTokens.defaultState.textColor?.toColor(using: theme) ?? .clear)
        case (.ghost, .medium):
            let tokens = isDisabled ? DodadaButtonGhostMediumTokens.disabledState
                : isPressed ? DodadaButtonGhostMediumTokens.pressedState
                : DodadaButtonGhostMediumTokens.defaultState
            if let textColor = tokens.textColor {
                return textColor.toColor(using: theme)
            }
            return isDisabled ? theme.disabledTextButton : (isPressed ? DodadaButtonGhostMediumTokens.hoverState.textColor?.toColor(using: theme) ?? theme.disabledTextButton : DodadaButtonGhostMediumTokens.defaultState.textColor?.toColor(using: theme) ?? .clear)
        case (.ghost, .small):
            let tokens = isDisabled ? DodadaButtonGhostSmallTokens.disabledState
                : isPressed ? DodadaButtonGhostSmallTokens.pressedState
                : DodadaButtonGhostSmallTokens.defaultState
            if let textColor = tokens.textColor {
                return textColor.toColor(using: theme)
            }
            return isDisabled ? theme.disabledTextButton : (isPressed ? DodadaButtonGhostSmallTokens.hoverState.textColor?.toColor(using: theme) ?? theme.disabledTextButton : DodadaButtonGhostSmallTokens.defaultState.textColor?.toColor(using: theme) ?? .clear)
        case (.onlyIcon(let inverted), _):
            if inverted {
                let tokens = isDisabled ? DodadaButtonOnlyIconOutlineTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconOutlineTokens.pressedState
                    : DodadaButtonOnlyIconOutlineTokens.defaultState
                return tokens.iconColor?.toColor(using: theme) ?? .clear
            } else {
                let tokens = isDisabled ? DodadaButtonOnlyIconFilledTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconFilledTokens.pressedState
                    : DodadaButtonOnlyIconFilledTokens.defaultState
                return tokens.iconColor?.toColor(using: theme) ?? .clear
            }
        }
    }

    // MARK: - Icon color

    public func getIconColor(by theme: DDDTheme, size: DDDButtonSize = .regular, isDisabled: Bool = false, isPressed: Bool) -> Color? {
        switch (self, size) {
        case (.primary, .regular):
            let tokens = isDisabled ? DodadaButtonPrimaryRegularTokens.disabledState
                : isPressed ? DodadaButtonPrimaryRegularTokens.pressedState
                : DodadaButtonPrimaryRegularTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.primary, .medium):
            let tokens = isDisabled ? DodadaButtonPrimaryMediumTokens.disabledState
                : isPressed ? DodadaButtonPrimaryMediumTokens.pressedState
                : DodadaButtonPrimaryMediumTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.primary, .small):
            let tokens = isDisabled ? DodadaButtonPrimarySmallTokens.disabledState
                : isPressed ? DodadaButtonPrimarySmallTokens.pressedState
                : DodadaButtonPrimarySmallTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.secondary, .regular):
            let tokens = isDisabled ? DodadaButtonSecondaryRegularTokens.disabledState
                : isPressed ? DodadaButtonSecondaryRegularTokens.pressedState
                : DodadaButtonSecondaryRegularTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.secondary, .medium):
            let tokens = isDisabled ? DodadaButtonSecondaryMediumTokens.disabledState
                : isPressed ? DodadaButtonSecondaryMediumTokens.pressedState
                : DodadaButtonSecondaryMediumTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.secondary, .small):
            let tokens = isDisabled ? DodadaButtonSecondarySmallTokens.disabledState
                : isPressed ? DodadaButtonSecondarySmallTokens.pressedState
                : DodadaButtonSecondarySmallTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.secondaryDark, _):
            let tokens = isDisabled ? DodadaButtonSecondaryRegularTokens.disabledState
                : isPressed ? DodadaButtonSecondaryRegularTokens.pressedState
                : DodadaButtonSecondaryRegularTokens.defaultState
            return isPressed ? tokens.iconColor?.toColor(using: theme) : nil
        case (.tertiary, .regular):
            let tokens = isDisabled ? DodadaButtonTertiaryRegularTokens.disabledState
                : isPressed ? DodadaButtonTertiaryRegularTokens.pressedState
                : DodadaButtonTertiaryRegularTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.tertiary, .medium):
            let tokens = isDisabled ? DodadaButtonTertiaryMediumTokens.disabledState
                : isPressed ? DodadaButtonTertiaryMediumTokens.pressedState
                : DodadaButtonTertiaryMediumTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.tertiary, .small):
            let tokens = isDisabled ? DodadaButtonTertiarySmallTokens.disabledState
                : isPressed ? DodadaButtonTertiarySmallTokens.pressedState
                : DodadaButtonTertiarySmallTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.link, .regular):
            let tokens = isDisabled ? DodadaButtonLinkRegularTokens.disabledState
                : isPressed ? DodadaButtonLinkRegularTokens.pressedState
                : DodadaButtonLinkRegularTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.link, .medium):
            let tokens = isDisabled ? DodadaButtonLinkMediumTokens.disabledState
                : isPressed ? DodadaButtonLinkMediumTokens.pressedState
                : DodadaButtonLinkMediumTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.link, .small):
            let tokens = isDisabled ? DodadaButtonLinkSmallTokens.disabledState
                : isPressed ? DodadaButtonLinkSmallTokens.pressedState
                : DodadaButtonLinkSmallTokens.defaultState
            return tokens.iconColor?.toColor(using: theme)
        case (.ghost, _):
            if isDisabled { return theme.disabledTextButton }
            return isPressed ? DodadaButtonGhostRegularTokens.hoverState.textColor?.toColor(using: theme) : DodadaButtonGhostRegularTokens.defaultState.textColor?.toColor(using: theme)
        case (.onlyIcon(let inverted), _):
            if inverted {
                let tokens = isDisabled ? DodadaButtonOnlyIconOutlineTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconOutlineTokens.pressedState
                    : DodadaButtonOnlyIconOutlineTokens.defaultState
                return tokens.iconColor?.toColor(using: theme)
            } else {
                let tokens = isDisabled ? DodadaButtonOnlyIconFilledTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconFilledTokens.pressedState
                    : DodadaButtonOnlyIconFilledTokens.defaultState
                return tokens.iconColor?.toColor(using: theme)
            }
        }
    }

    // MARK: - Background color

    public func getBackgroundColor(by themea: DDDTheme, size: DDDButtonSize = .regular, isDisabled: Bool = false, isPressed: Bool) -> Color {
        let theme = DDDThemeManager.shared.main
        switch (self, size) {
        case (.primary, .regular):
            let tokens = isDisabled ? DodadaButtonPrimaryRegularTokens.disabledState
                : isPressed ? DodadaButtonPrimaryRegularTokens.pressedState
                : DodadaButtonPrimaryRegularTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.primary, .medium):
            let tokens = isDisabled ? DodadaButtonPrimaryMediumTokens.disabledState
                : isPressed ? DodadaButtonPrimaryMediumTokens.pressedState
                : DodadaButtonPrimaryMediumTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.primary, .small):
            let tokens = isDisabled ? DodadaButtonPrimarySmallTokens.disabledState
                : isPressed ? DodadaButtonPrimarySmallTokens.pressedState
                : DodadaButtonPrimarySmallTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.secondary, .regular), (.secondaryDark, .regular):
            let tokens = isDisabled ? DodadaButtonSecondaryRegularTokens.disabledState
                : isPressed ? DodadaButtonSecondaryRegularTokens.pressedState
                : DodadaButtonSecondaryRegularTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.secondary, .medium), (.secondaryDark, .medium):
            let tokens = isDisabled ? DodadaButtonSecondaryMediumTokens.disabledState
                : isPressed ? DodadaButtonSecondaryMediumTokens.pressedState
                : DodadaButtonSecondaryMediumTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.secondary, .small), (.secondaryDark, .small):
            let tokens = isDisabled ? DodadaButtonSecondarySmallTokens.disabledState
                : isPressed ? DodadaButtonSecondarySmallTokens.pressedState
                : DodadaButtonSecondarySmallTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.tertiary, .regular):
            let tokens = isDisabled ? DodadaButtonTertiaryRegularTokens.disabledState
                : isPressed ? DodadaButtonTertiaryRegularTokens.pressedState
                : DodadaButtonTertiaryRegularTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.tertiary, .medium):
            let tokens = isDisabled ? DodadaButtonTertiaryMediumTokens.disabledState
                : isPressed ? DodadaButtonTertiaryMediumTokens.pressedState
                : DodadaButtonTertiaryMediumTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.tertiary, .small):
            let tokens = isDisabled ? DodadaButtonTertiarySmallTokens.disabledState
                : isPressed ? DodadaButtonTertiarySmallTokens.pressedState
                : DodadaButtonTertiarySmallTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.link, .regular):
            let tokens = isDisabled ? DodadaButtonLinkRegularTokens.disabledState
                : isPressed ? DodadaButtonLinkRegularTokens.pressedState
                : DodadaButtonLinkRegularTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.link, .medium):
            let tokens = isDisabled ? DodadaButtonLinkMediumTokens.disabledState
                : isPressed ? DodadaButtonLinkMediumTokens.pressedState
                : DodadaButtonLinkMediumTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.link, .small):
            let tokens = isDisabled ? DodadaButtonLinkSmallTokens.disabledState
                : isPressed ? DodadaButtonLinkSmallTokens.pressedState
                : DodadaButtonLinkSmallTokens.defaultState
            return tokens.surfaceColor?.toColor(using: theme) ?? .clear
        case (.ghost, .regular):
            if isDisabled { return theme.disabledButton }
            return isPressed ? DodadaButtonGhostRegularTokens.hoverState.surfaceColor?.toColor(using: theme) ?? .clear : .clear
        case (.ghost, .medium):
            if isDisabled { return theme.disabledButton }
            return isPressed ? DodadaButtonGhostMediumTokens.hoverState.surfaceColor?.toColor(using: theme) ?? .clear : .clear
        case (.ghost, .small):
            if isDisabled { return theme.disabledButton }
            return isPressed ? DodadaButtonGhostSmallTokens.hoverState.surfaceColor?.toColor(using: theme) ?? .clear : .clear
        case (.onlyIcon(let inverted), _):
            if inverted {
                let tokens = isDisabled ? DodadaButtonOnlyIconOutlineTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconOutlineTokens.pressedState
                    : DodadaButtonOnlyIconOutlineTokens.defaultState
                return tokens.surfaceColor?.toColor(using: theme) ?? .clear
            } else {
                let tokens = isDisabled ? DodadaButtonOnlyIconFilledTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconFilledTokens.pressedState
                    : DodadaButtonOnlyIconFilledTokens.defaultState
                return tokens.surfaceColor?.toColor(using: theme) ?? .clear
            }
        }
    }

    // MARK: - Border color

    public func getBorderColor(by theme: DDDTheme, size: DDDButtonSize = .regular, isDisabled: Bool = false, isPressed: Bool) -> Color {
        switch (self, size) {
        case (.primary, _):
            return DodadaButtonPrimaryRegularTokens.defaultState.borderColor?.toColor() ?? .clear
        case (.secondary, .regular), (.secondaryDark, .regular):
            let tokens = isDisabled ? DodadaButtonSecondaryRegularTokens.disabledState
                : isPressed ? DodadaButtonSecondaryRegularTokens.pressedState
                : DodadaButtonSecondaryRegularTokens.defaultState
            return tokens.borderColor?.toColor(using: theme) ?? .clear
        case (.secondary, .medium), (.secondaryDark, .medium):
            let tokens = isDisabled ? DodadaButtonSecondaryMediumTokens.disabledState
                : isPressed ? DodadaButtonSecondaryMediumTokens.pressedState
                : DodadaButtonSecondaryMediumTokens.defaultState
            return tokens.borderColor?.toColor(using: theme) ?? .clear
        case (.secondary, .small), (.secondaryDark, .small):
            let tokens = isDisabled ? DodadaButtonSecondarySmallTokens.disabledState
                : isPressed ? DodadaButtonSecondarySmallTokens.pressedState
                : DodadaButtonSecondarySmallTokens.defaultState
            return tokens.borderColor?.toColor(using: theme) ?? .clear
        case (.tertiary, _):
            return DodadaButtonTertiaryRegularTokens.defaultState.borderColor?.toColor() ?? .clear
        case (.link, _):
            return DodadaButtonLinkRegularTokens.defaultState.borderColor?.toColor() ?? .clear
        case (.ghost, _):
            return DodadaButtonOnlyIconGhostTokens.defaultState.borderColor?.toColor() ?? .clear
        case (.onlyIcon(let inverted), _):
            if !inverted {
                return DodadaButtonOnlyIconFilledTokens.defaultState.borderColor?.toColor() ?? .clear
            } else {
                let tokens = isDisabled ? DodadaButtonOnlyIconOutlineTokens.disabledState
                    : isPressed ? DodadaButtonOnlyIconOutlineTokens.pressedState
                    : DodadaButtonOnlyIconOutlineTokens.defaultState
                return tokens.borderColor?.toColor(using: theme) ?? .clear
            }
        }
    }

    // MARK: - Border width (theme has no token; 1 when border visible, 0 otherwise)

    public func getBorderWidth(by theme: DDDTheme) -> CGFloat {
        switch self {
        case .primary, .tertiary, .link, .ghost:
            return 0
        case .secondary, .secondaryDark, .onlyIcon:
            return 1
        }
    }

    // MARK: - Height
    public func getHeight(by theme: DDDTheme, size: DDDButtonSize) -> CGFloat {
        switch (self, size) {
        case (.primary, .regular):
            return DodadaButtonPrimaryRegularTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.primary, .medium):
            return DodadaButtonPrimaryMediumTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.primary, .small):
            return DodadaButtonPrimarySmallTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.secondary, .regular), (.secondaryDark, .regular):
            return DodadaButtonSecondaryRegularTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.secondary, .medium), (.secondaryDark, .medium):
            return DodadaButtonSecondaryMediumTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.secondary, .small), (.secondaryDark, .small):
            return DodadaButtonSecondarySmallTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.tertiary, .regular):
            return DodadaButtonTertiaryRegularTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.tertiary, .medium):
            return DodadaButtonTertiaryMediumTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.tertiary, .small):
            return DodadaButtonTertiarySmallTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.link, .regular):
            return DodadaButtonLinkRegularTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.link, .medium):
            return DodadaButtonLinkMediumTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.link, .small):
            return DodadaButtonLinkSmallTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.ghost, .regular):
            return DodadaButtonGhostRegularTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.ghost, .medium):
            return DodadaButtonGhostMediumTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.ghost, .small):
            return DodadaButtonGhostSmallTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        case (.onlyIcon, _):
            return DodadaButtonOnlyIconFilledTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        }
    }

    // MARK: - Width (nil = flexible; non-nil for icon-only / ghost square)

    public func getWidth(by theme: DDDTheme) -> CGFloat? {
        switch self {
        case .primary, .secondary, .secondaryDark, .tertiary, .link:
            return nil
        case .onlyIcon(let inverted):
            if inverted {
                return DodadaButtonOnlyIconOutlineTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
            } else {
                return DodadaButtonOnlyIconFilledTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
            }
        case .ghost:
            return DodadaButtonOnlyIconGhostTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
        }
    }

    // MARK: - Corner radius

    public func getCornerRadius(by theme: DDDTheme) -> CGFloat {
        switch self {
        case .primary:
            return DodadaButtonPrimaryRegularTokens.defaultState.borderRadius?.toCGFloat(using: theme) ?? 0
        case .secondary, .secondaryDark:
            return DodadaButtonSecondaryRegularTokens.defaultState.borderRadius?.toCGFloat(using: theme) ?? 0
        case .tertiary:
            return DodadaButtonTertiaryRegularTokens.defaultState.borderRadius?.toCGFloat(using: theme) ?? 0
        case .onlyIcon(let inverted):
            if inverted {
                let size = DodadaButtonOnlyIconOutlineTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
                return size / 2
            } else {
                let size = DodadaButtonOnlyIconFilledTokens.defaultState.shapeHeight?.toCGFloat(using: theme) ?? 0
                return size / 2
            }
        case .ghost:
            return DodadaButtonGhostRegularTokens.defaultState.borderRadius?.toCGFloat(using: theme) ?? 0
        case .link:
            return DodadaButtonLinkRegularTokens.defaultState.borderRadius?.toCGFloat(using: theme) ?? 0
        }
    }

    public var gap: CGFloat {
        let theme = DDDThemeManager.shared.main
        return DodadaButtonPrimaryRegularTokens.defaultState.gap?.toCGFloat(using: theme) ?? 0
    }
}

// MARK: - Button state (for future use: hover, pressed, disabled)

public enum DDDButtonStyle {
    case normal
    case hover
    case pressed
    case disable
}
