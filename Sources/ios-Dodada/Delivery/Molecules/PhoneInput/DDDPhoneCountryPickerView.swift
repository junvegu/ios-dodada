//
//  CountryPickerView.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import SwiftUI

struct CountryPickerView: View {
    @Binding var countryFlag: String
    @Binding var countryCode: String
    @Binding var countryPattern: String
    @Binding var countryLimit: Int
    @Binding var presentSheet: Bool
    @FocusState var keyIsFocused: Bool
    
    let countries: [DDDCountryData]
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: CGFloat
    
    var body: some View {
        Button {
            presentSheet = true
            keyIsFocused = false
        } label: {
            Text("\(countryFlag) \(countryCode)")
                .padding(.medium)
                .frame(minWidth: 80, minHeight: 47)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                .foregroundColor(foregroundColor)
        }
        .sheet(isPresented: $presentSheet) {
            NavigationView {
                List(filteredCountries) { country in
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                            .font(.headline)
                        Spacer()
                        Text(country.dial_code)
                    }
                    .onTapGesture {
                        self.countryFlag = country.flag
                        self.countryCode = country.dial_code
                        self.countryPattern = country.pattern
                        self.countryLimit = country.limit
                        presentSheet = false
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchCountry, prompt: "Seleccióna tú pais")
            }
            .presentationDetents([.medium, .large])
        }
    }
    
    @State private var searchCountry: String = ""
    
    var filteredCountries: [DDDCountryData] {
        if searchCountry.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name.contains(searchCountry) }
        }
    }
}

struct CountryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        
        CountryPickerView.init(
            countryFlag: .constant(""),
            countryCode: .constant("PE"),
            countryPattern: .constant("### ### ###"),
            countryLimit: .constant(9),
            presentSheet: .constant(true),
            countries: [],
            backgroundColor: .accentColor,
            foregroundColor: .gray,
            cornerRadius: 10
        )
    }
}
