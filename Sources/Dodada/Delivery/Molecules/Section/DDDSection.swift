//
//  DDDSection.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 25/03/25.
//

import SwiftUI

public struct DDDSection: View {
    let title: String
    let subtitle: String?
    let action: (() -> Void)?
    let buttonTitle: String?
    
    public init(title: String, subtitle: String? = nil, buttonTitle: String? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    public var body: some View {
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
            
            if let buttonTitle = buttonTitle, let action = action {
                DDDButton(buttonTitle, desing: .link, action: action)
            }
        }
        .padding(.horizontal)
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
