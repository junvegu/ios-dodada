//
//  PhoneNumberViewBuilder.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import Foundation
import SwiftUI

/// A SwiftUI view that displays a formatted phone number input field with country picker,
/// validation support, and custom styling, integrated with reusable FieldWrapper and DDDInputContent components.
public struct DDDPhoneNumberView: View {
    // MARK: - Bindings

    /// Phone number text input.
    @Binding private var mobPhoneNumber: String

    /// Validation flag for the current phone number.
    @Binding private var isValidPhoneNumber: Bool

    /// Selected country dial code (e.g., "+51").
    @Binding private var countryCode: String

    // MARK: - State

    @State private var countryFlag: String = ""
    @State private var countryPattern: String = ""
    @State private var countryRegexValidation: String = ""
    @State private var countryLimit: Int = 9
    @State private var presentSheet = false
    @State private var messageHeight: CGFloat = 0
    @State private var hasLostFocus: Bool = false
    @FocusState private var keyIsFocused: Bool

    // MARK: - Configuration

    private let countries: [DDDCountryData]
    private let labelText: String
    private let placeHolder: String
    private let isRequired: Bool
    private let requiredMessage: String?
    private let state: InputState

    // MARK: - View

    public var body: some View {
        let effectiveMessage: Message? = computeValidationMessage()

        return FieldWrapper(
            labelText,
            message: effectiveMessage,
            messageHeight: $messageHeight
        ) {
            DDDInputContent(
                state: state,
                label: "",
                message: effectiveMessage,
                isFocused: keyIsFocused,
                value: $mobPhoneNumber
            ) {
                buildPhoneTextField()
            } prefix: {
                buildCountryPicker()
            } suffix: {
                EmptyView()
            }
        }
    }

    // MARK: - Components

    /// Builds the country picker view.
    private func buildCountryPicker() -> some View {
        CountryPickerView(
            countryFlag: $countryFlag,
            countryCode: $countryCode,
            countryPattern: $countryPattern,
            countryLimit: $countryLimit,
            presentSheet: $presentSheet,
            keyIsFocused: _keyIsFocused,
            countries: countries,
            backgroundColor: .clear,
            foregroundColor: .gray,
            cornerRadius: 0
        )
    }

    /// Builds the phone number input field.
    private func buildPhoneTextField() -> some View {
        PhoneNumberTextField(
            phoneNumber: $mobPhoneNumber,
            isValidPhoneNumber: $isValidPhoneNumber,
            countryPattern: countryPattern,
            countryLimit: countryLimit,
            validationRegex: countryRegexValidation,
            backgroundColor: .clear,
            cornerRadius: 0,
            foregroundColor: .gray,
            placeHolder: placeHolder,
            keyIsFocused: _keyIsFocused
        )
        .onChange(of: keyIsFocused) { focused in
            if !focused {
                hasLostFocus = true
            }
        }
        .onAppear {
            setDefaultCountry()
        }
        .onChange(of: countryCode) { newCode in
            if let region = countries.first(where: { $0.dial_code == newCode }) {
                applyCountry(region)
                mobPhoneNumber = ""
            }
        }
    }

    /// Computes the validation message depending on input and focus state.
    private func computeValidationMessage() -> Message? {
        let trimmedValue = mobPhoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)

        if isRequired && hasLostFocus {
            if trimmedValue.isEmpty {
                return .error(requiredMessage ?? "El \(labelText.lowercased()) es obligatorio")
            }
            if !isValidPhoneNumber {
                return .error("El formato de teléfono es inválido")
            }
        }

        return nil
    }

    /// Sets the default country based on the current region.
    private func setDefaultCountry() {
        let regionCode = Locale.current.region?.identifier
        if let defaultCountry = countries.first(where: { $0.code == regionCode }) {
            applyCountry(defaultCountry)
        } else if let fallback = countries.first(where: { $0.code == "US" }) {
            applyCountry(fallback)
        }
    }

    /// Applies the selected country information to the state.
    private func applyCountry(_ country: DDDCountryData) {
        countryFlag = country.flag
        countryCode = country.dial_code
        countryPattern = country.formatPattern
        countryLimit = country.limit
        countryRegexValidation = country.regex
    }
}

// MARK: - Public Initializer

public extension DDDPhoneNumberView {
    /// Initializes a phone number input view with all required bindings and configuration.
    init(
        label: String,
        placeholder: String = "Número de teléfono",
        mobPhoneNumber: Binding<String>,
        isValidPhoneNumber: Binding<Bool>,
        countryCode: Binding<String>,
        isRequired: Bool = false,
        requiredMessage: String? = nil,
        state: InputState = .default,
    ) {
        self.labelText = label
        self.placeHolder = placeholder
        self._mobPhoneNumber = mobPhoneNumber
        self._isValidPhoneNumber = isValidPhoneNumber
        self._countryCode = countryCode
        self.isRequired = isRequired
        self.requiredMessage = requiredMessage
        self.state = state
        self.countries = DDDCountryData.allCountry
    }
}


#Preview {
    struct DDDPhoneNumberView_PreviewWrapper: View {
        @State private var phoneNumber: String = ""
        @State private var isValid: Bool = false
        @State private var countryCode: String = "+51"

        var body: some View {
            VStack {
                DDDPhoneNumberView(
                    label: "Teléfono",
                    placeholder: "Ingrese su número",
                    mobPhoneNumber: $phoneNumber,
                    isValidPhoneNumber: $isValid,
                    countryCode: $countryCode,
                    isRequired: true
                )
                .padding()
                
                DDDInputText(value: .constant("asdasdasd"))
                    .padding()
                TextField.init("asdasd", text: .constant(""))
            }
            
        }
    }

    return DDDPhoneNumberView_PreviewWrapper()
}
