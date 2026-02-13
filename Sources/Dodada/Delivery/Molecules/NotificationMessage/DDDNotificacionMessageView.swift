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
            DDDIcon(.feedbackInfo, size: .iconXl)
                .padding(.leading)
            
            Group {
                Text(text + " " ).textStyle(.footnoteRegular) +
                Text(highligh).textStyle(.footnoteBoldUnderline)
            }
            .padding([.top, .bottom])
            .onTapGesture {
                action?()
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipShape(
            RoundedRectangle(cornerRadius: .radiusMd)
            
        )
        .background(Color.secondaryValue100.clipShape(RoundedRectangle(cornerRadius:.radiusMd)))
        .padding(.horizontal, 12)
        
    }
}

#Preview {
    DDDNotificacionMessageView("Este es un texto de ejemplo demasiado largo como para que entiendan que esto es gozuuuuu", highligh: "Haz Click Aqui")
}
