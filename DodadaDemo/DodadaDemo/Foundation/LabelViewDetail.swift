//
//  LabelViewDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import SwiftUI
import Dodada
struct LabelViewDetail: View {
    var body: some View {
        VStack {
            DDDLabel("Hola")
            DDDLabel("Como Estas", token: .title1, disclosureIcon: .aquisito)
            DDDLabel("YO muy bien", token: .headline, icon: .apple)
            DDDLabel("El Peluca SAPEEEEEE", token: .caption1, icon: .agend, disclosureIcon: .alertCircle)
        }
    }
}

#Preview {
    LabelViewDetail()
}
