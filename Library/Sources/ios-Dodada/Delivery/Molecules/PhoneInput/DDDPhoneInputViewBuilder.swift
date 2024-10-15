//
//  PhoneNumberViewBuilder.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import Foundation
import SwiftUI

public struct DDDPhoneNumberView: View {
    @State var presentSheet = false
    @State var countryCode: String
    @State var countryFlag: String
    @State var countryPattern: String
    @State var countryLimit: Int
    @Binding var mobPhoneNumber: String
    @Binding var isValidPhoneNumber: Bool
    @FocusState private var keyIsFocused: Bool
    
    let countries: [DDDCountryData]
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    
    
    public init(
        backgroundColor: Color = .gray.opacity(0.2),
        foregroundColor: Color = .gray,
        cornerRadius: CGFloat = 10,
        mobPhoneNumber: Binding<String>,
        isValidPhoneNumber: Binding<Bool>,
        countryCode: String = "+51",
        countryFlag: String = "🇵🇪",
        countryPattern: String = "### ### ###",
        countryLimit: Int = 9
    ) {
        self.countries = [
            DDDCountryData(
                id: "0001",
                name: "Perú",
                flag: "🇵🇪",
                code: "PE",
                dial_code: "+51",
                pattern: "### ### ###",
                limit: 9
            )]
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self._mobPhoneNumber = mobPhoneNumber
        self._isValidPhoneNumber = isValidPhoneNumber
        self.countryCode = countryCode
        self.countryFlag = countryFlag
        self.countryPattern = countryPattern
        self.countryLimit = countryLimit
    }
    
    public var body: some View {
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
        .padding()
        .ignoresSafeArea(.keyboard)
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        
        DDDPhoneNumberView(
            mobPhoneNumber: .constant(""),
            isValidPhoneNumber: .constant(false)
        )
    }
}
