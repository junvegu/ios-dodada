//
//  DDDButtonIconState.swift
//  Dodada
//
//  State passed to icon builders so icons can render with correct colors (isPressed, isEnabled).
//

import SwiftUI

/// State available when building button icons. Passed to icon builders so they can render
/// with the correct colors for pressed/disabled.
public struct DDDIconState {
    public let theme: DDDTheme
    public let isEnabled: Bool
    public let isPressed: Bool

    public init(theme: DDDTheme, isEnabled: Bool, isPressed: Bool) {
        self.theme = theme
        self.isEnabled = isEnabled
        self.isPressed = isPressed
    }

    public var isDisabled: Bool { !isEnabled }
}
