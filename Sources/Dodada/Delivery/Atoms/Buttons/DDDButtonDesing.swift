//
//  DDDButtonDesing.swift
//  Dodada
//
//  Design tokens for button variants. Theme-based getters drive appearance from DDDButtonTheme.
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

    public func getForegroundColor(by theme: DDDTheme, isDisabled: Bool = false, isPressed: Bool) -> Color {
        let b = theme.components.button
        switch self {
        case .primary:
            if isDisabled { return b.primaryTextDisabled }
            return isPressed ? b.primaryTextPressed : b.primaryTextDefault
        case .secondary, .secondaryDark:
            if isDisabled { return b.secondaryTextDisabled }
            return isPressed ? b.secondaryTextPressed : b.secondaryTextDefault
        case .tertiary:
            if isDisabled { return b.tertiaryTextDisabled }
            return isPressed ? b.tertiaryTextPressed : b.tertiaryTextDefault
        case .onlyIcon(let inverted):
            if isDisabled {
                return !inverted ? b.onlyIconFilledIconDisabled : b.onlyIconOutlineIconDisabled
            }
            if isPressed {
                return !inverted ? b.onlyIconFilledIconPressed : b.onlyIconOutlineIconPressed
            }
            return !inverted ? b.onlyIconFilledIconDefault : b.onlyIconOutlineIconDefault
        case .ghost:
            if isDisabled { return theme.disabledTextButton }
            return isPressed ? b.ghostTextHover : b.ghostTextDefault
        case .link:
            if isDisabled { return b.linkTextDisabled }
            return isPressed ? b.linkTextPressed : b.linkTextDefault
        }
    }

    // MARK: - Icon color

    public func getIconColor(by theme: DDDTheme, isDisabled: Bool = false, isPressed: Bool) -> Color? {
        let b = theme.components.button
        switch self {
        case .primary:
            if isDisabled { return b.primaryIconDisabled }
            return isPressed ? b.primaryIconPressed : b.primaryIconDefault
        case .secondary:
            if isDisabled { return b.secondaryIconDisabled }
            return isPressed ? b.secondaryIconPressed : b.secondaryIconDefault
        case .secondaryDark:
            if isDisabled { return b.secondaryIconDisabled }
            return isPressed ? b.secondaryIconPressed : nil
        case .tertiary:
            if isDisabled { return b.tertiaryIconDisabled }
            return isPressed ? b.tertiaryIconPressed : b.tertiaryIconDefault
        case .onlyIcon(let inverted):
            if isDisabled {
                return !inverted ? b.onlyIconFilledIconDisabled : b.onlyIconOutlineIconDisabled
            }
            if isPressed {
                return !inverted ? b.onlyIconFilledIconPressed : b.onlyIconOutlineIconPressed
            }
            return inverted ? b.onlyIconOutlineIconDefault: b.onlyIconFilledIconDefault
        case .ghost:
            if isDisabled { return theme.disabledTextButton }
            return isPressed ? b.ghostTextHover : b.ghostTextDefault
        case .link:
            if isDisabled { return b.linkIconDisabled }
            return isPressed ? b.linkIconPressed : b.linkIconDefault
        }
    }

    // MARK: - Background color

    public func getBackgroundColor(by theme: DDDTheme, isDisabled: Bool = false, isPressed: Bool) -> Color {
        let b = theme.components.button
        switch self {
        case .primary:
            if isDisabled { return b.primaryBackgroundDisabled }
            return isPressed ? b.primaryBackgroundPressed : b.primaryBackgroundDefault
        case .secondary, .secondaryDark:
            if isDisabled { return b.secondaryBackgroundDisabled }
            return isPressed ? b.secondaryBackgroundPressed : b.secondaryBackgroundDefault
        case .tertiary:
            if isDisabled { return b.tertiaryBackgroundDisabled }
            return isPressed ? b.tertiaryBackgroundPressed : b.tertiaryBackgroundDefault
        case .onlyIcon(let inverted):
            if isDisabled {
                return inverted ? b.onlyIconOutlineBackgroundDisabled : b.onlyIconFilledBackgroundDisabled
            }
            if isPressed {
                return inverted ? b.onlyIconOutlineBackgroundPressed : b.onlyIconFilledBackgroundPressed
            }
            return inverted ? b.onlyIconOutlineBackgroundDefault : b.onlyIconFilledBackgroundDefault 
        case .ghost:
            if isDisabled { return theme.disabledButton }
            return isPressed ? b.ghostBackgroundHover : .clear
        case .link:
            if isDisabled { return b.linkBackgroundDisabled }
            return isPressed ? b.linkBackgroundPressed : b.linkBackgroundDefault
        }
    }

    // MARK: - Border color

    public func getBorderColor(by theme: DDDTheme, isDisabled: Bool = false, isPressed: Bool) -> Color {
        let b = theme.components.button
        switch self {
        case .primary:
            return b.primaryBorder
        case .secondary, .secondaryDark:
            if isDisabled { return b.secondaryBorderDisabled }
            return isPressed ? b.secondaryBorderPressed : b.secondaryBorderDefault
        case .tertiary:
            return b.tertiaryBorder
        case .onlyIcon(let inverted):
            if !inverted { return b.onlyIconFilledBorder }
            if isDisabled { return b.onlyIconOutlineBorderDisabled }
            return isPressed ? b.onlyIconOutlineBorderPressed : b.onlyIconOutlineBorderDefault
        case .ghost:
            return b.onlyIconGhostBorder
        case .link:
            return b.linkBorder
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
        let b = theme.components.button
        switch self {
        case .link:
            switch size {
            case .regular:
                return b.linkHeightRegular
            case .medium:
                return b.linkHeightMedium
            case .small:
                return b.linkHeightSmall
            }
        default :
            switch size {
            case .regular:
                return b.primaryHeightRegular
            case .medium:
                return b.primaryHeightMedium
            case .small:
                return b.primaryHeightSmall
            }
        }
    }

    // MARK: - Width (nil = flexible; non-nil for icon-only / ghost square)

    public func getWidth(by theme: DDDTheme) -> CGFloat? {
        let b = theme.components.button
        switch self {
        case .primary, .secondary, .secondaryDark, .tertiary, .link:
            return nil
        case .onlyIcon(let inverted):
            return !inverted ? b.onlyIconFilledSize : b.onlyIconOutlineSize
        case .ghost:
            return b.onlyIconGhostSize
        }
    }

    // MARK: - Corner radius

    public func getCornerRadius(by theme: DDDTheme) -> CGFloat {
        let b = theme.components.button
        switch self {
        case .primary: return b.primaryRadius
        case .secondary, .secondaryDark: return b.secondaryRadius
        case .tertiary: return b.tertiaryRadius
        case .onlyIcon(let inverted):
            let size = !inverted ? b.onlyIconFilledSize : b.onlyIconOutlineSize
            return size / 2
        case .ghost: return b.ghostRadius
        case .link: return b.linkRadius
        }
    }

    public var gap: CGFloat { 8 }
}

// MARK: - Button state (for future use: hover, pressed, disabled)

public enum DDDButtonStyle {
    case normal
    case hover
    case pressed
    case disable
}
