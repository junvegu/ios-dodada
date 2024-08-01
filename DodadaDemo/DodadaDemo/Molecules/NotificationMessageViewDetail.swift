//
//  NotificationMessageViewDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import SwiftUI
import Dodada

struct NotificationMessageViewDetail: View {
    @State private var showingAlert = false

    var body: some View {
        VStack {
            DDDNotificacionMessageView("El contenido de este restaurante es supervisado por el mismo propietario.", highligh: "Conoce más aquí") {
                showingAlert = true

            }
            DDDNotificacionMessageView("Este restaurante es supervisado por el mismo propietario.")
            DDDNotificacionMessageView("El contenido de .", highligh: "Clickea esta") {
                showingAlert = true

            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}

#Preview {
    NotificationMessageViewDetail()
}
