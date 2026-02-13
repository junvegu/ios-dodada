//
//  DDDSubSections.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 6/05/25.
//

import SwiftUI

public struct DDDSubSections: View {
    
    let icon: DodadaIconToken
    let title: String
    let subtitle: String
    
    public init(icon: DodadaIconToken, title: String, subtitle: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        HStack{
            line
            
            VStack(spacing: 4){
                DDDIcon(icon, color: .errorValue500)
                Text(title)
                    .textStyle(.subheadlineBold)
                Text(subtitle)
                    .textStyle(.caption2Regular)
            }.fixedSize(horizontal: true, vertical: false)
            
            line
        }
    }
    
    private var line: some View{
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color.secondaryValue200)
    }
}


#Preview {
    DDDSubSections(icon: .restaurantChicken, title: "Nombre de la Lista", subtitle: "10 restaurantes")
}
