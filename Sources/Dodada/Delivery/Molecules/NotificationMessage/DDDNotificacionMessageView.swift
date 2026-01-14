//
//  SwiftUIView.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 19/04/24.
//

import SwiftUI

public struct DDDNotificacionMessageView: View {
    private let text: String
    private let highligh: String
    private let action: (() -> Void)?
    public init(_ text: String, highligh: String = "", action: (() -> Void)? = nil) {
        self.text = text
        self.highligh = highligh
        self.action = action
    }
    
    public var body: some View {
        HStack {
            DDDIcon(.info)
                .iconSize(custom: .xLarge)
                .padding(.leading)
            
            Group { Text(text + " " ).font(DDDFontToken.footNote.font(.regular)) + Text( highligh).font(DDDFontToken.footNote.font(.bold)).underline()
            }
            .padding([.top, .bottom])
            .onTapGesture {
                action?()
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(
            RoundedRectangle(cornerRadius: .regularCornerRadius)
            
        )
        .background(Color.secondary100.swiftUIColor.clipShape(RoundedRectangle(cornerRadius:.regularCornerRadius)))
        .padding(.horizontal, 12)
        
    }
}

#Preview {
    DDDNotificacionMessageView("Este es un texto de ejemplo demasiado largo como para que entiendan que esto es gozuuuuu", highligh: "Haz Click Aqui")
}
