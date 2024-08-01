//
//  DDDIconView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 12/04/24.
//

import SwiftUI
import Dodada
struct DDDIconFoundationView: View {
    let columns = [
        GridItem(.adaptive(minimum: 20))
    ]

    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(DDDIcon.Images.allCases, id: \.id) { item in
                    DDDIcon(item)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DDDIconFoundationView()
}
