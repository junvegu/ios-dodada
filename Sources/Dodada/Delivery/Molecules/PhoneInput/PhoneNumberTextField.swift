//
//  PhoneNumberTextField.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import SwiftUI
import Combine


/// A phone number input field that formats the number as the user types and validates its length.
public struct PhoneNumberTextField: View {
    @Binding var phoneNumber: String
    @Binding var isValidPhoneNumber: Bool
    
    @Environment(\.colorTheme) private var theme: DDDTheme
    
    /// The formatting pattern using `#` as a digit placeholder, e.g., "### ### ####".
    let countryPattern: String
    
    /// Maximum number of digits (not counting separators).
    let countryLimit: Int
    
    let validationRegex: String
    
    /// Customization
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let foregroundColor: Color
    let placeHolder: String

    @FocusState var keyIsFocused: Bool
    
    public var body: some View {
        TextField(placeHolder, text: $phoneNumber)
            .focused($keyIsFocused)
            .keyboardType(.numberPad)
            .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Aceptar") {
                            keyIsFocused = false
                        }
                    }
                }
            .onChange(of: phoneNumber) { newValue in
                formatPhoneNumber()
            }
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
    
    /// Applies the pattern and validates the number.
    private func formatPhoneNumber() {
        let rawDigits = phoneNumber.filter(\.isNumber).prefix(countryLimit)
        phoneNumber = applyPattern(to: String(rawDigits), using: countryPattern)
        isValidPhoneNumber = validatePhoneNumber(String(rawDigits))
    }

    /// Replaces each `#` in the pattern with digits from the input.
    private func applyPattern(to input: String, using pattern: String) -> String {
        let digitsOnly = input.filter("0123456789".contains)
        var result = ""
        var index = digitsOnly.startIndex
        print("DIGITS \(digitsOnly)")
        for ch in pattern {
            if index == digitsOnly.endIndex { break }
            if ch == "#" {
                result.append(digitsOnly[index])
                index = digitsOnly.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    private func validatePhoneNumber(_ digits: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", validationRegex)
        print("REGEX \(validationRegex)")

        return predicate.evaluate(with: digits)
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


#Preview {
    struct PhoneNumberTextFieldPreviewWrapper: View {
        @State private var phoneNumber: String = "987654321"
        @State private var isValid: Bool = false

        var body: some View {
            PhoneNumberTextField(
                phoneNumber: $phoneNumber,
                isValidPhoneNumber: $isValid,
                countryPattern: "### ### ####",
                countryLimit: 9,
                validationRegex: "^9[0-9]{8}sssssdsds$",
                backgroundColor: .clear,
                cornerRadius: .regularCornerRadius,
                foregroundColor: .accentColor,
                placeHolder: "mmm"
            )
        }
    }

    return PhoneNumberTextFieldPreviewWrapper()
}
