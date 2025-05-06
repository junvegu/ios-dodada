//
//  DDDSubSections.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 6/05/25.
//

import SwiftUI

public struct DDDSubSections: View {
    
    let icon: DDDIcon.Images
    let title: String
    let subtitle: String
    
    public init(icon: DDDIcon.Images, title: String, subtitle: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        HStack{
            line
            
            VStack(spacing: 4){
                DDDIcon(icon)
                    .iconColor(.red)
                Text(title)
                    .apply(token: .subheadline,
                           weight: .bold)
                Text(subtitle)
                    .apply(token: .caption2,
                           weight: .regular)
            }.fixedSize(horizontal: true, vertical: false)
            
            line
        }
    }
    
    private var line: some View{
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color(asset: Color.secondary200))
    }
}


#Preview {
    DDDSubSections(icon: .chicken, title: "Nombre de la Lista", subtitle: "10 restaurantes")
}
