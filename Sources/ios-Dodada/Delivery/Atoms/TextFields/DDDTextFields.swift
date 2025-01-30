//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import SwiftUI

public struct DDDTextFields: View {
    @Binding var text: String
    @State var isSecure: Bool
    
    let label: String
    let placeholder: String
    let isOptional: Bool
    let icon: DDDIcon.Images?
    
    public init(
        text: Binding<String>,
        label: String,
        placeholder: String,
        isOptional: Bool = false,
        icon: DDDIcon.Images? = nil
    ) {
        self._text = text
        self.label = label
        self.placeholder = placeholder
        self.isOptional = isOptional
        self.icon = icon
        self._isSecure = State(initialValue: false)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Label con ícono de información
            HStack {
                Text(label)
                    .apply(token: .footNote, weight: .regular)
                    .foregroundStyle(Asset.Colors.secondary.swiftUIColor)
                
                DDDIcon(.info)
                    .iconSize(custom: .small)
                    .iconColor(Asset.Colors.secondary.swiftUIColor)
                Spacer()
                
                Text(isOptional ? "(opcional)" : "")
                    .apply(token: .footNote, weight: .regular)
                    .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
            }
            
            
            HStack {
                if let safeIcon = icon {
                    DDDIcon(safeIcon)
                        .iconSize(custom: .large)
                        .iconColor(Asset.Colors.secondary.swiftUIColor)
                }

                if isSecure {
                    SecureField(placeholder, text: $text)
                        .apply(token: .callOut, weight: .regular)
                        .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        DDDIcon( isSecure ? .eye : .eyeOff)
                            .iconSize(custom: .xLarge)
                            .iconColor(Asset.Colors.secondary.swiftUIColor)
                    }
                } else {
                    TextField(placeholder, text: $text)
                        .apply(token: .callOut, weight: .regular)
                        .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                
               
            }
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4), lineWidth: 1))
            
            
           /* HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 6, height: 6)
                    .iconColor(Asset.Colors.secondary.swiftUIColor)
                
                Text("Content text")
                    .apply(token: .caption2, weight: .regular)
                    .iconColor(Asset.Colors.secondary.swiftUIColor)
            }*/
        }
        .padding()
    }
}

#Preview {
    return DDDTextFields(
        text: .constant(""),
        label: "* Nombres",
        placeholder: "Escribe aqui...",
        isOptional: true,
        icon: .aquisito
    )
        .previewLayout(.sizeThatFits)
        .padding()
    
}
