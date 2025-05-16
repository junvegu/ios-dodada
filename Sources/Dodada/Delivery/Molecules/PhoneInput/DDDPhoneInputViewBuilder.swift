//
//  PhoneNumberViewBuilder.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import Foundation
import SwiftUI

public struct DDDPhoneNumberView: View {
    @State private var presentSheet = false
    @State private var countryFlag: String = ""
    @State private var countryPattern: String = ""
    @State private var countryLimit: Int = 9
    @Binding private var countryCode: String
    @Binding private var mobPhoneNumber: String
    @Binding private var isValidPhoneNumber: Bool
    @FocusState private var keyIsFocused: Bool

    private let countries: [DDDCountryData]
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let cornerRadius: CGFloat

    public init(
        backgroundColor: Color = .gray.opacity(0.2),
        foregroundColor: Color = .gray,
        cornerRadius: CGFloat = 10,
        mobPhoneNumber: Binding<String>,
        isValidPhoneNumber: Binding<Bool>,
        countryCode: Binding<String>
    ) {
        self.countries = DDDCountryData.allCountry
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self._mobPhoneNumber = mobPhoneNumber
        self._isValidPhoneNumber = isValidPhoneNumber
        self._countryCode = countryCode
    }

    public var body: some View {
        FieldWrapper("") {
            HStack {
                CountryPickerView(
                    countryFlag: $countryFlag,
                    countryCode: $countryCode,
                    countryPattern: $countryPattern,
                    countryLimit: $countryLimit,
                    presentSheet: $presentSheet,
                    keyIsFocused: _keyIsFocused,
                    countries: countries,
                    backgroundColor: backgroundColor,
                    foregroundColor: foregroundColor,
                    cornerRadius: cornerRadius
                )

                PhoneNumberTextField(
                    phoneNumber: $mobPhoneNumber,
                    isValidPhoneNumber: $isValidPhoneNumber,
                    countryPattern: countryPattern,
                    countryLimit: countryLimit,
                    backgroundColor: backgroundColor,
                    cornerRadius: cornerRadius,
                    foregroundColor: foregroundColor,
                    keyIsFocused: _keyIsFocused
                )
            }
            .onAppear {
                setDefaultCountry()
            }
            .overlay(
                RoundedRectangle(cornerRadius: .regularCornerRadius)
                    .stroke(Color.secondary200.swiftUIColor, lineWidth: 2)
            )
        }
        .ignoresSafeArea(.keyboard)
    }

    private func setDefaultCountry() {
        

        let regionCode = Locale.current.region?.identifier
        if let defaultCountry = countries.first(where: { $0.code == regionCode }) {
             print("🌍 Found country: \(defaultCountry.name)")
             countryFlag = defaultCountry.flag
             countryCode = defaultCountry.dial_code
             countryPattern = defaultCountry.pattern
             countryLimit = defaultCountry.limit
         }else if let fallback = countries.first(where: { $0.code == "PE" }) {
             // Fallback a Perú si no se encuentra el país actual
             countryFlag = fallback.flag
             countryCode = fallback.dial_code
             countryPattern = fallback.pattern
             countryLimit = fallback.limit
         }
    }
}


#Preview {
    DDDPhoneNumberView(
        mobPhoneNumber: .constant(""),
        isValidPhoneNumber: .constant(false),
        countryCode: .constant("+51")
    )
}
