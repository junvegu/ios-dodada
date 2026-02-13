//
//  DDDInputSearch.swift
//  Dodada UI Component
//
//  Created by Junior Quevedo Gutierrez on 1/03/25.
//

import SwiftUI

/// A search input field component for Dodada.
/// Features a fixed search icon on the left and a clear button (X) on the right
/// that appears when the user types more than one character.
/// Supports disabled and error states.
public struct DDDInputSearch: View {
    
    // MARK: - Environment
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - Focus
    @FocusState private var isFocused: Bool

    // MARK: - Internal Properties
    private let prompt: String
    private let message: Message?
    private let state: InputState

    @Binding private var value: String
    @Binding private var messageHeight: CGFloat

    var onBeginEditing: (() -> Void)?
    var onEndEditing: (() -> Void)?
    var onClear: (() -> Void)?

    // MARK: - Configuration
    var autocapitalizationType: UITextAutocapitalizationType = .none
    var isAutocorrectionDisabled: Bool = true
    var keyboardType: UIKeyboardType = .default
    var returnKeyType: SubmitLabel = .done
    var textContentType: UITextContentType?

    // MARK: - Body
    public var body: some View {
        FieldWrapper("", message: message, messageHeight: $messageHeight) {
            DDDInputContent(
                state: state,
                label: "",
                message: message,
                isFocused: isFocused,
                value: $value
            ) {
                buildTextField()
            } prefix: {
                DDDIcon(.navigationSearch)
                    .accessibility(hidden: true)
            } suffix: {
                if showClearButton {
                    clearButton
                        .transition(.opacity.combined(with: .scale))
                }
            }
            .animation(.easeInOut(duration: 0.2), value: showClearButton)
        }
    }

    // MARK: - TextField Builder
    @ViewBuilder
    private func buildTextField() -> some View {
        TextField(prompt, text: $value)
            .keyboardType(keyboardType)
            .textContentType(textContentType)
            .submitLabel(returnKeyType)
            .autocapitalization(autocapitalizationType)
            .autocorrectionDisabled(isAutocorrectionDisabled)
            .focused($isFocused)
            .onChange(of: isFocused) { newValue in
                if newValue {
                    onBeginEditing?()
                } else {
                    onEndEditing?()
                }
            }
            .foregroundStyle(Color.secondaryValue500)
            .textStyles(.calloutRegular)
    }

    // MARK: - Clear Button
    @ViewBuilder
    private var clearButton: some View {
        DDDIcon(.actionsCircleX)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    value = ""
                }
                onClear?()
            }
            .accessibilityLabel("Limpiar búsqueda")
    }

    // MARK: - Computed Properties
    private var showClearButton: Bool {
        value.count > 1 && isEnabled
    }
}

// MARK: - Initializers
public extension DDDInputSearch {
    
    /// Creates a `DDDInputSearch` field.
    ///
    /// - Parameters:
    ///   - value: A binding to the search value.
    ///   - prompt: Placeholder text shown when the field is empty.
    ///   - state: The visual state (e.g., `.default`, `.modified`).
    ///   - message: Additional field message (e.g., help or error).
    ///   - messageHeight: The binding used to calculate message height dynamically.
    ///   - onBeginEditing: Optional callback when editing begins.
    ///   - onEndEditing: Optional callback when editing ends.
    ///   - onClear: Optional callback when the clear button is tapped.
    ///   - autocapitalization: Text autocapitalization rule.
    ///   - autocorrectionDisabled: Whether autocorrection is enabled.
    ///   - keyboardType: The keyboard type to display.
    ///   - returnKeyType: The return key type for the keyboard.
    ///   - textContentType: The text content type for autofill.
    init(
        value: Binding<String>,
        prompt: String = "Placeholder...",
        state: InputState = .default,
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0),
        onBeginEditing: (() -> Void)? = nil,
        onEndEditing: (() -> Void)? = nil,
        onClear: (() -> Void)? = nil,
        autocapitalization: UITextAutocapitalizationType = .none,
        autocorrectionDisabled: Bool = true,
        keyboardType: UIKeyboardType = .default,
        returnKeyType: SubmitLabel = .done,
        textContentType: UITextContentType? = nil
    ) {
        self._value = value
        self.prompt = prompt
        self.state = state
        self.message = message
        self._messageHeight = messageHeight
        self.onBeginEditing = onBeginEditing
        self.onEndEditing = onEndEditing
        self.onClear = onClear
        self.autocapitalizationType = autocapitalization
        self.isAutocorrectionDisabled = autocorrectionDisabled
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.textContentType = textContentType
    }
}

// MARK: - Preview

#Preview {
    struct ContentView: View {
        @State private var search1: String = ""
        @State private var search2: String = ""
        @State private var search3: String = ""
        @State private var search4: String = ""

        var body: some View {
            NavigationView(content: {
                VStack(spacing: 16) {
                    // Variant 1: Default state without clear button
                    DDDInputSearch(
                        value: $search1,
                        prompt: "Placeholder..."
                    )
                    
                    // Variant 2: Default state with clear button (when text > 1 char)
                    DDDInputSearch(
                        value: $search2,
                        prompt: "Placeholder..."
                    )
                    .onAppear {
                        search2 = "test"
                    }
                    
                    // Variant 3: Error state with clear button
                    DDDInputSearch(
                        value: $search3,
                        prompt: "Placeholder...",
                        message: .error("Error message")
                    )
                    .onAppear {
                        search3 = "test"
                    }
                    
                    // Variant 4: Disabled state
                    DDDInputSearch(
                        value: $search4,
                        prompt: "Placeholder..."
                    )
                    .disabled(true)
                }
            })
            .onAppear(perform: {
                Dodada.registerFonts()
            })
            .padding(.horizontal, 12)
        }
    }

    return ContentView()
}

