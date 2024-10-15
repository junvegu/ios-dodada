//
//  PhoneInputDetailView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import SwiftUI
import Dodada

struct PhoneInputDetailView: View {
    
    @State private var phoneNumber: String = ""
    @State private var isPhoneNumberValid: Bool = false
    
    var body: some View {
        VStack(spacing: .zero) {
            DDDPhoneNumberView(
                countries: [
                    DDDCountryData(
                        id: "0001",
                        name: "Perú",
                        flag: "🇵🇪",
                        code: "PE",
                        dial_code: "+51",
                        pattern: "### ### ###",
                        limit: 9
                    ),
                ],
                mobPhoneNumber: $phoneNumber,
                isValidPhoneNumber: $isPhoneNumberValid
            )
        }
    }
}

#Preview {
    PhoneInputDetailView()
}
