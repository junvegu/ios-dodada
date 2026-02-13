//
//  DDDButtonStyleViews.swift
//  Dodada
//
//  Internal style views for each button variant (fill, secondary, tertiary, icon, link, ghost).
//

import SwiftUI

// MARK: - Fill (Primary)

struct DDDButtonFillStyleView<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon
    let state: DDDIconState

    private var isDisabled: Bool { state.isDisabled }
    private var isPressed: Bool { state.isPressed }
    private var theme: DDDTheme { state.theme }

    var body: some View {
        HStack(spacing: desing.gap) {
            iconBuilder(state)
            configuration.label
                .textStyles(.calloutBold)
                .layoutPriority(1)
            disclosureIconBuilder(state)
        }
        .foregroundColor(desing.getForegroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        .padding()
        .frame(maxWidth: fullWidth ? .infinity : desing.getWidth(by: theme))
        .frame(height: desing.getHeight(by: theme, size: size))
        .background(
            Rectangle()
                .fill(desing.getBackgroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
                .animation(.easeOut(duration: 0.3), value: isPressed)
        )
        .cornerRadius(desing.getCornerRadius(by: theme))
        .transition(.opacity)
    }
}

// MARK: - Secondary / Secondary Dark

struct DDDButtonSecondaryStyleView<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon
    let state: DDDIconState

    private var isDisabled: Bool { state.isDisabled }
    private var isPressed: Bool { state.isPressed }
    private var theme: DDDTheme { state.theme }

    var body: some View {
        let radius = desing.getCornerRadius(by: theme)
        let borderWidth = desing.getBorderWidth(by: theme)
        HStack(spacing: desing.gap) {
            iconBuilder(state)
            configuration.label
                .textStyles(.calloutBold)
                .layoutPriority(1)
            disclosureIconBuilder(state)
        }
        .foregroundColor(desing.getForegroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        .padding()
        .frame(maxWidth: fullWidth ? .infinity : desing.getWidth(by: theme), maxHeight: desing.getHeight(by: theme, size: size))
        .background(
            RoundedRectangle(cornerRadius: radius)
                .fill(desing.getBackgroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        )
        .overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(
                    desing.getBorderColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed),
                    lineWidth: borderWidth
                )
        )
    }
}

// MARK: - Tertiary

struct DDDButtonTertiaryStyleView<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon
    let state: DDDIconState

    private var isDisabled: Bool { state.isDisabled }
    private var isPressed: Bool { state.isPressed }
    private var theme: DDDTheme { state.theme }

    var body: some View {
        HStack(spacing: desing.gap) {
            iconBuilder(state)
            configuration.label
                .textStyles(.calloutBold)
                .layoutPriority(1)
            disclosureIconBuilder(state)
        }
        .foregroundColor(desing.getForegroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        .padding()
        .frame(maxWidth: fullWidth ? .infinity : desing.getWidth(by: theme), maxHeight: desing.getHeight(by: theme, size: size))
        .background(desing.getBackgroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        .cornerRadius(desing.getCornerRadius(by: theme))
    }
}

// MARK: - Icon only (onlyIcon variant)

struct DDDButtonIconStyleView<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon
    let state: DDDIconState

    private var isDisabled: Bool { state.isDisabled }
    private var isPressed: Bool { state.isPressed }
    private var theme: DDDTheme { state.theme }

    var body: some View {
        let radius = desing.getCornerRadius(by: theme)
        let borderWidth = desing.getBorderWidth(by: theme)
        HStack {
            iconBuilder(state)
        }
        .foregroundColor(desing.getForegroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        .padding()
        .frame(maxWidth: fullWidth ? .infinity : desing.getWidth(by: theme), maxHeight: desing.getHeight(by: theme, size: size))
        .background(desing.getBackgroundColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed))
        .cornerRadius(radius)
        .overlay(
            Circle()
                .stroke(
                    desing.getBorderColor(by: theme, size: size, isDisabled: isDisabled, isPressed: isPressed),
                    lineWidth: borderWidth
                )
        )
        .clipShape(Circle())
    }
}

// MARK: - Link

struct DDDButtonLinkStyleView<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon
    let state: DDDIconState

    private var isDisabled: Bool { state.isDisabled }
    private var isPressed: Bool { state.isPressed }
    private var theme: DDDTheme { state.theme }

    var body: some View {
        HStack(spacing: desing.gap) {
            iconBuilder(state)
            configuration.label
                .textStyles(.calloutBold)
                .layoutPriority(1)
            disclosureIconBuilder(state)
        }
        .foregroundColor(desing.getForegroundColor(by: theme, isDisabled: isDisabled, isPressed: isPressed))
        .padding()
        .frame(maxHeight: desing.getHeight(by: theme, size: size))
        .background(desing.getBackgroundColor(by: theme, isDisabled: isDisabled, isPressed: isPressed))
    }
}

// MARK: - Ghost

struct DDDButtonGhostStyleView<LeadingIcon: View, TrailingIcon: View>: View {
    let configuration: ButtonStyle.Configuration
    let desing: DDDButtonDesing
    let size: DDDButtonSize
    let fullWidth: Bool
    let iconBuilder: (DDDIconState) -> LeadingIcon
    let disclosureIconBuilder: (DDDIconState) -> TrailingIcon
    let state: DDDIconState

    private var isDisabled: Bool { state.isDisabled }
    private var isPressed: Bool { state.isPressed }
    private var theme: DDDTheme { state.theme }

    var body: some View {
        HStack {
            iconBuilder(state)
        }
        .foregroundColor(desing.getForegroundColor(by: theme, isDisabled: isDisabled, isPressed: isPressed))
        .padding()
        .frame(width: desing.getHeight(by: theme, size: size), height: desing.getHeight(by: theme, size: size))
        .background(desing.getBackgroundColor(by: theme, isDisabled: isDisabled, isPressed: isPressed))
        .cornerRadius(desing.getCornerRadius(by: theme))
        .clipShape(Circle())
    }
}
