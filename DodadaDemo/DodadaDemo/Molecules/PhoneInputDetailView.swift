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
    @FocusState private var keyIsFocused: Bool

    var body: some View {
        VStack(spacing: .zero) {
            DDDPhoneNumberView(
                mobPhoneNumber: $phoneNumber,
                isValidPhoneNumber: $isPhoneNumberValid
            )
        }
    }
}

#Preview {
    PhoneInputDetailView()
}
