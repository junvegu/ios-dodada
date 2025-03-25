//
//  DDDSection.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 25/03/25.
//

import SwiftUI

struct DDDSection: View {
    let title: String
    let subtitle: String?
    let action: (() -> Void)?
    let buttonTitle: String?
    
    init(title: String, subtitle: String? = nil, buttonTitle: String? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .apply(token: .title3, weight: .bold)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .apply(token: .caption2, weight: .regular)
                }
            }
            Spacer()
            
            //Corregir
            ///Cambiar en "design" el .primary por el .link
            if let buttonTitle = buttonTitle, let action = action {
                DDDButton(buttonTitle, desing: .primary, action: action)
                    .padding(.leading, 80)
            }
        }
        .padding()
    }
}

#Preview {
    VStack {
        DDDSection(title: "Detalles")
        DDDSection(title: "Detalles", subtitle: "12 Facilidades encontradas")
        DDDSection(title: "Detalles", subtitle: "12 Facilidades encontradas", buttonTitle: "Ver todos", action: {
            print("Ver todos presionado")
        })
    }
}
