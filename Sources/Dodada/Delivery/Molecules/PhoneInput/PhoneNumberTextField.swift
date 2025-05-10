//
//  PhoneNumberTextField.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import SwiftUI
import Combine

public struct PhoneNumberTextField: View {
    @Binding var phoneNumber: String
    @Binding var isValidPhoneNumber: Bool
    @Environment(\.colorTheme) private var theme: DDDTheme
    let countryPattern: String
    let countryLimit: Int
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let foregroundColor: Color
    
    @FocusState var keyIsFocused: Bool
    
    
    public var body: some View {
        TextField("", text: $phoneNumber)
            .placeholder(when: phoneNumber.isEmpty) {
                Text("Phone number")
                    .foregroundColor(foregroundColor)
            }
            .focused($keyIsFocused)
            .keyboardType(.numbersAndPunctuation)
            .onReceive(Just(phoneNumber)) { _ in
                applyPatternOnNumbers(&phoneNumber, pattern: countryPattern, replacementCharacter: "#")
                isValidPhoneNumber = validatePhoneNumber(phoneNumber)
            }
            .padding(.medium)
            .frame(minWidth: 80, minHeight: 47)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
    
    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
    }
    
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        let pureNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        return pureNumber.count == countryLimit
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


struct PhoneNumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberTextField(
            phoneNumber: .constant("987654321"),
            isValidPhoneNumber: .constant(false),
            countryPattern: "PE",
            countryLimit: 9,
            backgroundColor: .clear,
            cornerRadius: .regularCornerRadius,
            foregroundColor: .accentColor
        )
    }
}
