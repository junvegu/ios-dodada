//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 14/06/24.
//

import SwiftUI

public struct DDDActionTextField: View {
    
     let placeholder: String
        @Binding public var text: String
     var action: () -> Void
    
    public init(placeholder: String, text: Binding<String>, action: @escaping () -> Void) {
        self.placeholder = placeholder
        self._text = text
        self.action = action
    }
    
    @Environment(\.colorTheme) private var colorTheme: DDDTheme

    public var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .apply(token: .subheadline, weight: .regular)
                .multilineTextAlignment(.center)

            Rectangle()
                .frame(width: 59, height: 48)
                .foregroundStyle(colorTheme.defaultButton)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 20, topTrailingRadius: 20, style: .continuous))
                .overlay {
                    Button {
                        action()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                }
        }
        .background {
            Capsule()
                .foregroundStyle(.black.opacity(0.15))
        }.overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(colorTheme.defaultButton, lineWidth: 1)
        )
    }
}

#Preview {
    DDDActionTextField(placeholder: "Nombre del Jugador", text: .constant("")) {
        print("Button Pressed")
    }
}
