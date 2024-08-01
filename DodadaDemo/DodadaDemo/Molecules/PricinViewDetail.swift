//
//  PricinViewDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import SwiftUI
import Dodada
struct PricinViewDetail: View {
    var body: some View {
        VStack {
            Text("Price High").apply()
            DDDPriceIndicatorView(level: .high)
            Text("Price Medium").apply()
            DDDPriceIndicatorView(level: .medium)
            Text("Price Low").apply()
            DDDPriceIndicatorView(level: .low)
        }.padding()
    }
}

#Preview {
    PricinViewDetail()
}
