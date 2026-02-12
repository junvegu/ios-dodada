//
//  DDDInputText.swift
//  Dodada UI Component
//
//  Created by Junior Quevedo Gutierrez on 1/03/25.
//

import SwiftUI

/// A customizable input field component for Dodada.
/// Supports optional prefix and suffix views, secure text entry, password strength indication,
/// and validation for required fields.
public struct DDDInputText<Prefix: View, Suffix: View>: View {
    
    // MARK: - Environment
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - Focus
    @FocusState private var isFocused: Bool

    // MARK: - Internal Properties
    private let label: String
    private let prompt: String
    private let state: InputState
    private let labelStyle: InputLabelStyle
    private let passwordStrength: PasswordStrengthIndicator.PasswordStrength?
    private let isSecure: Bool
    private let message: Message?
    private let isRequired: Bool
    private let requiredMessage: String?

    @Binding private var value: String
    @Binding private var messageHeight: CGFloat

    var onBeginEditing: (() -> Void)?
    var onEndEditing: (() -> Void)?

    @ViewBuilder private var prefix: Prefix
    @ViewBuilder private var suffix: Suffix

    @State private var isSecureTextRedacted: Bool = true
    @State private var hasLostFocus: Bool = false

    // MARK: - Configuration
    var autocapitalizationType: UITextAutocapitalizationType = .none
    var isAutocorrectionDisabled: Bool? = false
    var keyboardType: UIKeyboardType = .default
    var returnKeyType: SubmitLabel = .done
    var textContentType: UITextContentType?
    var shouldDeleteBackwardAction: (String) -> Bool = { _ in true }

    // MARK: - Body
    public var body: some View {
        let effectiveMessage: Message? = {
            if isRequired && hasLostFocus && value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return .error(requiredMessage ?? "El \(label.lowercased()) es obligatorio")
            }
            return message
        }()

        return FieldWrapper(labelText, message: effectiveMessage, messageHeight: $messageHeight) {
            DDDInputContent(
                state: state,
                label: compactLabel,
                message: effectiveMessage,
                isFocused: isFocused,
                value: $value
            ) {
                buildTextField()
            } prefix: {
                prefix
                    .accessibility(hidden: true)
            } suffix: {
                if !suffix.isEmpty || showSecureTextToggle {
                    HStack(spacing: .spacingSm) {
                        secureTextToggleButton
                        suffix
                    }
                }
            }
        }
    }

    // MARK: - TextField Builder
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
                hasLostFocus = true
                onEndEditing?()
            }
        }
        .foregroundStyle(Color.secondaryValue500)
        .textStyles(.calloutRegular)
        .padding(.horizontal, .spacingSm)
    }

    // MARK: - Secure Text Toggle
    @ViewBuilder
    private var secureTextToggleButton: some View {
        if showSecureTextToggle {
            DDDIcon(isSecureTextRedacted ? .userEye : .userEyeOff).onTapGesture {
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
    
    /// Creates a `DDDInputText` field using standard prefix and suffix icons.
    ///
    /// - Parameters:
    ///   - label: The label of the input field.
    ///   - value: A binding to the input value.
    ///   - prefix: Optional left-side icon.
    ///   - suffix: Optional right-side icon.
    ///   - prompt: Placeholder text shown when the field is empty.
    ///   - state: The visual state (e.g., `.default`, `.error`).
    ///   - labelStyle: How the label is displayed (e.g., `.default`, `.compact`).
    ///   - isSecure: Whether to mask the input (for passwords).
    ///   - passwordStrength: Optional password strength indicator.
    ///   - message: Additional field message (e.g., help or error).
    ///   - messageHeight: The binding used to calculate message height dynamically.
    ///   - isRequired: Whether this field must be filled before proceeding.
    ///   - requiredMessage: Custom error message for required validation.
    ///   - autocapitalization: Text autocapitalization rule.
    ///   - autocorrectionDisabled: Whether autocorrection is enabled.
    init(
        _ label: String = "",
        value: Binding<String>,
        prefix: DodadaIconToken? = nil,
        suffix: DodadaIconToken? = nil,
        prompt: String = "",
        state: InputState = .default,
        labelStyle: InputLabelStyle = .default,
        isSecure: Bool = false,
        passwordStrength: PasswordStrengthIndicator.PasswordStrength? = nil,
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0),
        isRequired: Bool = false,
        requiredMessage: String? = nil,
        autocapitalization: UITextAutocapitalizationType = .none,
        autocorrectionDisabled: Bool = true
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
            messageHeight: messageHeight,
            isRequired: isRequired,
            requiredMessage: requiredMessage,
            autocapitalization: autocapitalization,
            autocorrectionDisabled: autocorrectionDisabled
        ) {
            DDDIcon(prefix, color: .secondaryValue500)
        } suffix: {
            DDDIcon(suffix, color: .secondaryValue500)
        }
    }

    /// Creates a `DDDInputText` field with custom prefix and suffix views.
    ///
    /// - Parameters:
    ///   - label: The label of the input field.
    ///   - value: A binding to the input value.
    ///   - prompt: Placeholder text shown when the field is empty.
    ///   - state: The visual state (e.g., `.default`, `.error`).
    ///   - labelStyle: How the label is displayed.
    ///   - isSecure: Whether to hide input text.
    ///   - passwordStrength: Optional password strength level.
    ///   - message: Field message for guidance or error.
    ///   - messageHeight: A binding to determine dynamic height of the message label.
    ///   - isRequired: Whether the field is mandatory.
    ///   - requiredMessage: Optional custom message if required and left empty.
    ///   - autocapitalization: Text autocapitalization setting.
    ///   - autocorrectionDisabled: Whether to disable autocorrect.
    ///   - prefix: A custom view shown to the left of the input.
    ///   - suffix: A custom view shown to the right of the input.
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
        isRequired: Bool = false,
        requiredMessage: String? = nil,
        autocapitalization: UITextAutocapitalizationType = .none,
        autocorrectionDisabled: Bool = true,
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
        self.isRequired = isRequired
        self.requiredMessage = requiredMessage
        self.autocapitalizationType = autocapitalization
        self.isAutocorrectionDisabled = autocorrectionDisabled
    }
}

// MARK: - Preview

#Preview {
    
    
    struct ContentView: View {
        @State private var username: String = ""
        @State private var password: String = ""
        @State private var isShow: Bool = false

        var body: some View {
            VStack(spacing: 8) {
                DDDInputText(
                    "Usuario",
                    value: $username,
                    prefix: .userUser,
                    suffix: .socialGoogle,
                    prompt: "Ingresa tu usuario",
                    isRequired: true
                )

                DDDInputText(
                    "Contraseña",
                    value: $password,
                    prefix: .userLock,
                    suffix: .userEye,
                    prompt: "Ingresa tu contraseña",
                    isSecure: true,
                    passwordStrength: .medium(title: "Seguridad media"),
                    message: .help("Debe tener al menos 8 caracteres"),
                    isRequired: true
                )

                DDDButton("Validar", desing: .primary) {
                    isShow.toggle()
                }
                .padding()
            }.padding(.horizontal, 12)
        }
    }

    return NavigationView {
        ContentView()
    }.onAppear {
        Dodada.registerFonts()
    }
}
