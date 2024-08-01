//
//  DDDTagView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import Dodada
import SwiftUI

struct DDDTagViewDetail: View {
    var body: some View {
        VStack {
            DDDListTagView(data: ["Carne","Pollo","Cerdo","Carne","Huevos","Pescado","XD","Nose","Camavinga","Chicharito"])
        }.padding()
    }
}
#Preview {
    DDDTagViewDetail()
}
