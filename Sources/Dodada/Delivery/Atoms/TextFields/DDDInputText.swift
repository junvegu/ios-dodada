//
//  InputField.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 1/03/25.
//

import Foundation
import SwiftUI

/// A customizable input field component for Dodada.
/// Supports optional prefix and suffix views, secure text entry, and password strength indication.
public struct DDDInputText<Prefix: View, Suffix: View>: View {
    // MARK: - Environment Variables
    @Environment(\.isEnabled) private var isEnabled
    
    // MARK: - Focus State
    @FocusState private var isFocused: Bool
    
    // MARK: - Properties
    private let label: String
    private let prompt: String
    private let state: InputState
    private let labelStyle: InputLabelStyle
    private let passwordStrength: PasswordStrengthIndicator.PasswordStrength?
    private let isSecure: Bool
    private let message: Message?
    
    @Binding private var value: String
    @Binding private var messageHeight: CGFloat
    
    var onBeginEditing: (() -> Void)?
    var onEndEditing: (() -> Void)?
    
    @ViewBuilder private var prefix: Prefix
    @ViewBuilder private var suffix: Suffix
    
    @State private var isSecureTextRedacted: Bool = true
    
    // MARK: - Text Field Configuration
    var autocapitalizationType: UITextAutocapitalizationType = .none
    var isAutocorrectionDisabled: Bool? = false
    var keyboardType: UIKeyboardType = .default
    var returnKeyType: SubmitLabel = .done
    var textContentType: UITextContentType?
    var shouldDeleteBackwardAction: (String) -> Bool = { _ in true }
    
    // MARK: - Body
    public var body: some View {
        FieldWrapper(labelText, message: message, messageHeight: $messageHeight) {
            DDDInputContent(state: state, label: compactLabel, message: message, isFocused: isFocused) {
                buildTextField()
            } prefix: {
                prefix
                    .accessibility(hidden: true)
            } suffix: {
                if !suffix.isEmpty || showSecureTextToggle {
                    HStack(spacing: .small) {
                        secureTextToggleButton
                        suffix
                    }
                }
            }
        }
    }
    
    // MARK: - Text Field Builder
    @ViewBuilder
    private func buildTextField() -> some View {
        Group {
            if isSecure && isSecureTextRedacted {
                SecureField(prompt, text: $value)
            } else {
                TextField(prompt, text: $value)
            }
        }
        .keyboardType(keyboardType)
        .textContentType(textContentType)
        .submitLabel(returnKeyType)
        .autocapitalization(autocapitalizationType)
        .autocorrectionDisabled(isAutocorrectionDisabled ?? false)
        .focused($isFocused)
        .onChange(of: isFocused) { newValue in
            if newValue {
                onBeginEditing?()
            } else {
                onEndEditing?()
            }
        }
        .foregroundStyle(Asset.Colors.secondary.swiftUIColor)
        .apply(token: .callOut, weight: .regular)
        .padding(.horizontal, .small)
    }
    
    // MARK: - Secure Text Toggle Button
    @ViewBuilder
    private var secureTextToggleButton: some View {
        if showSecureTextToggle {
            DDDIcon(isSecureTextRedacted ? .eye : .eyeOff).onTapGesture {
                isSecureTextRedacted.toggle()

            }
        }
    }
    
    // MARK: - Computed Properties
    private var showSecureTextToggle: Bool {
        isSecure && !value.isEmpty && isEnabled
    }
    
    private var labelText: String {
        labelStyle == .default ? label : ""
    }
    
    private var compactLabel: String {
        labelStyle == .compact ? label : ""
    }
}

// MARK: - Initializers
public extension DDDInputText {
    
    /// Creates an `InputField` with an optional prefix and suffix using predefined `DDDIcon` images.
    ///
    /// - Parameters:
    ///   - label: The label of the input field.
    ///   - value: A binding to the text value.
    ///   - prefix: An optional icon for the left side.
    ///   - suffix: An optional icon for the right side.
    ///   - prompt: The placeholder text.
    ///   - state: The input field state (e.g., default, error).
    ///   - labelStyle: The label display style.
    ///   - isSecure: Whether the field should mask input (for passwords).
    ///   - passwordStrength: Optional password strength indicator.
    ///   - message: Additional message below the field.
    ///   - messageHeight: Binding to message height.
    init(
        _ label: String = "",
        value: Binding<String>,
        prefix: DDDIcon.Images? = nil,
        suffix: DDDIcon.Images? = nil,
        prompt: String = "",
        state: InputState = .default,
        labelStyle: InputLabelStyle = .default,
        isSecure: Bool = false,
        passwordStrength: PasswordStrengthIndicator.PasswordStrength? = nil,
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0)
    ) where Prefix == DDDIcon, Suffix == DDDIcon {
        self.init(
            label,
            value: value,
            prompt: prompt,
            state: state,
            labelStyle: labelStyle,
            isSecure: isSecure,
            passwordStrength: passwordStrength,
            message: message,
            messageHeight: messageHeight
        ) {
            DDDIcon(prefix)
        } suffix: {
            DDDIcon(suffix)
        }
    }
    
    /// Creates an `InputField` with a customizable prefix and suffix views.
    ///
    /// - Parameters:
    ///   - label: The label of the input field.
    ///   - value: A binding to the text value.
    ///   - prompt: The placeholder text.
    ///   - state: The input field state (e.g., default, error).
    ///   - labelStyle: The label display style.
    ///   - isSecure: Whether the field should mask input (for passwords).
    ///   - passwordStrength: Optional password strength indicator.
    ///   - message: Additional message below the field.
    ///   - messageHeight: Binding to message height.
    ///   - prefix: A custom prefix view.
    ///   - suffix: A custom suffix view.
    init(
        _ label: String = "",
        value: Binding<String>,
        prompt: String = "",
        state: InputState = .default,
        labelStyle: InputLabelStyle = .default,
        isSecure: Bool = false,
        passwordStrength: PasswordStrengthIndicator.PasswordStrength? = nil,
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0),
        @ViewBuilder prefix: () -> Prefix,
        @ViewBuilder suffix: () -> Suffix = { EmptyView() }
    ) {
        self.label = label
        self._value = value
        self.prompt = prompt
        self.state = state
        self.labelStyle = labelStyle
        self.isSecure = isSecure
        self.passwordStrength = passwordStrength
        self.message = message
        self._messageHeight = messageHeight
        self.prefix = prefix()
        self.suffix = suffix()
    }
}

// MARK: - Preview
#Preview {
    VStack {
        DDDInputText(
            "Username",
            value: .constant("JohnDoe"),
            prefix: .user,
            suffix: .google,
            prompt: "Enter your username",
            state: .default,
            labelStyle: .default,
            isSecure: false,
            passwordStrength: nil,
            message: .help("Enter a valid username"),
            messageHeight: .constant(50)
        )
        .padding()
        
        DDDInputText(
            "Password",
            value: .constant("password123"),
            prefix: .lock,
            suffix: .eye,
            prompt: "Enter your password",
            state: .default,
            labelStyle: .default,
            isSecure: true,
            passwordStrength: .medium(title: "Medium strength"),
            message: .error("Weak password"),
            messageHeight: .constant(20)
        )
        .padding()
    }
}
