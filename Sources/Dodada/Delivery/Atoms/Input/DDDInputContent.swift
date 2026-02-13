//
//  DDDInputContent.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez on 31/01/25.
//

import Foundation
import SwiftUI

/// Visual container for a Dodada design system input field.
///
/// Lays out in a single row an optional prefix, a compact label, the main content (e.g. `TextField`),
/// and an optional suffix. Applies border, background, corner radius, and colors based on input state
/// using `DodadaInputTokens` and the current theme (`colorTheme`).
///
/// ## Visual states
/// Tokens are resolved with priority: **disabled** → **error** (message) → **focused** → **default**.
/// - Disabled: border and background use the disabled state.
/// - Error message: error border style.
/// - Focused: border and text use the focus state.
/// - Default: default style.
///
/// ## Theme
/// Uses `@Environment(\.colorTheme)` to resolve colors and layout values (radius, spacing, sizing).
///
/// - Note: Does not include the top label or footer message; use `FieldWrapper` or `DDDInputText` for that.
///
/// - Generic **Content**: Central view (typically a `TextField` or `SecureField`).
/// - Generic **Prefix**: Left-side view (e.g. an icon).
/// - Generic **Suffix**: Right-side view (e.g. icon or action button).
public struct DDDInputContent<Content: View, Prefix: View, Suffix: View>: View {

    // MARK: - Environment

    @Environment(\.idealSize) private var idealSize
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.colorTheme) private var theme: DDDTheme

    // MARK: - Model

    private let state: InputState
    private let label: String
    private let message: Message?
    private let isFocused: Bool
    @ViewBuilder private let content: Content
    @ViewBuilder private let prefix: Prefix
    @ViewBuilder private let suffix: Suffix
    @Binding private var value: String

    // MARK: - Token resolution

    private var inputTokens: DodadaInputTokens {
        DodadaInputTokens.tokens(isEnabled: isEnabled, isFocused: isFocused, message: message)
    }

    private var cornerRadius: CGFloat {
        guard let token = inputTokens.borderRadius else { return .radiusSm }
        return theme.foundation.radius.value(for: token)
    }

    private var horizontalPadding: CGFloat {
        guard let token = inputTokens.paddingHorizontal else { return .spacingSm }
        return theme.foundation.spacing.value(for: token)
    }

    private var contentHeight: CGFloat? {
        inputTokens.shapeHeight?.toCGFloat(using: theme)
    }

    private var labelGap: CGFloat {
        inputTokens.gap?.toCGFloat(using: theme) ?? .spacingSm
    }

    // MARK: - Resolved colors (theme + tokens)

    private var resolvedTextColor: Color {
        resolveColor(inputTokens.textColor, fallback: .secondaryValue500)
    }

    private var resolvedLabelColor: Color {
        resolveColor(inputTokens.labelColor, fallback: .secondaryValue500)
    }

    private var resolvedBorderColor: Color {
        resolveColor(inputTokens.borderColor, fallback: .secondaryValue200)
    }

    private var focusOutlineColor: Color {
        resolveColor(inputTokens.borderColor, fallback: .secondaryValue500)
    }

    private var resolvedBackgroundColor: Color {
        resolveColor(inputTokens.backgroundColor, fallback: .clear)
    }

    private func resolveColor(_ token: DodadaColorToken?, fallback: Color) -> Color {
        token?.toColor(using: theme) ?? fallback
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: .zero) {
            Spacer().frame(width: horizontalPadding)
            prefix

            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text(label)
                    .textStyle(.calloutRegular)
                    .foregroundStyle(resolvedLabelColor)
                    .padding(.horizontal, labelGap)
                    .accessibility(hidden: true)
                    .accessibility(removeTraits: .isStaticText)
                content
            }

            if idealSize.horizontal != true {
                Spacer(minLength: 0)
            }

            suffix
            Spacer().frame(width: horizontalPadding)
        }
        .frame(height: contentHeight)
        .foregroundStyle(resolvedTextColor)
        .background(resolvedBackgroundColor.animation(.default, value: message))
        .cornerRadius(cornerRadius)
        .overlay(focusBorder)
        .overlay(border)
    }

    // MARK: - Overlays

    @ViewBuilder private var border: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(resolvedBorderColor, lineWidth: isFocused ? 1 : 2)
    }

    @ViewBuilder private var focusBorder: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .trim(from: 0, to: showBorderFocus ? 1 : 0)
            .stroke(focusOutlineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
            .animation(.easeInOut(duration: 0.4), value: showBorderFocus)
    }

    private var showBorderFocus: Bool {
        !value.isEmpty || isFocused
    }

    // MARK: - Init

    /// Creates the input container with optional content, prefix, and suffix.
    ///
    /// - Parameters:
    ///   - state: Input state (`.default`, `.modified`). Affects token resolution when combined with message/focus.
    ///   - label: Compact label text shown to the left of the content.
    ///   - message: Associated message (error, warning, help). When `.error`, error border/token style is applied.
    ///   - isFocused: Whether the field has focus; enables the focus state for tokens.
    ///   - value: Binding to the field value; used to decide whether to show the focus ring when unfocused but with text.
    ///   - content: Main field view (e.g. `TextField` or `SecureField`).
    ///   - prefix: Optional left-side view (e.g. `DDDIcon`).
    ///   - suffix: Optional right-side view (e.g. action icon or toggle).
    public init(
        state: InputState = .default,
        label: String = "",
        message: Message? = nil,
        isFocused: Bool = false,
        value: Binding<String>,
        @ViewBuilder content: () -> Content,
        @ViewBuilder prefix: () -> Prefix = { EmptyView() },
        @ViewBuilder suffix: () -> Suffix = { EmptyView() }
    ) {
        self.state = state
        self.label = label
        self.message = message
        self.isFocused = isFocused
        self.content = content()
        self.prefix = prefix()
        self.suffix = suffix()
        self._value = value
    }
}


#Preview {
    
    NavigationView {
        VStack {
            
            DDDInputContent(label: "Label", value: .constant("")) {
                EmptyView()
            }.padding()
            
            DDDInputContent(label: "Label", value: .constant("")) {
                EmptyView()
            } prefix: {
                DDDIcon(.specialAquisito)
            } suffix: {
                DDDIcon(.socialGoogle)
            }.padding()
            
            DDDInputContent(label: "Label", isFocused: true, value: .constant("")) {
                TextField("", text: .constant("Value"))
            } prefix: {
                DDDIcon(.specialAquisito)
            } suffix: {
                DDDIcon(.socialGoogle)
            }.padding()
            
            DDDInputContent(label: "Label", isFocused: true, value: .constant("")) {
                TextField("", text: .constant("Value"))
            } prefix: {
                DDDIcon(.socialGoogle)
            } suffix: {
                DDDIcon(.socialGoogle)
            }.padding()
                .disabled(true)
            
            DDDInputContent(label: "Label", message: .error("Este es un error", icon: .feedbackAlertCircle), isFocused: true, value: .constant("")) {
                TextField("", text: .constant("Value"))
            } prefix: {
                DDDIcon(.specialAquisito)
            } suffix: {
                DDDIcon(.socialGoogle)
            }.padding()
        }
    }.onAppear {
        Dodada.registerFonts()
    }

}
