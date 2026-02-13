//
//  DDDVerticalNav.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/02/25.
//

import Foundation
import SwiftUI

public struct DDDVerticalNav<LeadingIcon: View, TrailingIcon: View>: View {
    var title: String
    var description: String?
    var action: () -> Void
    var leadingIcon: () -> LeadingIcon
    var trailingIcon: () -> TrailingIcon
    
    public init(
        title: String,
        description: String? = nil,
        @ViewBuilder leadingIcon: @escaping () -> LeadingIcon,
        @ViewBuilder trailingIcon: @escaping () -> TrailingIcon,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.description = description
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.action = action
    }
    
    public init(
        title: String,
        description: String? = nil,
        leadingIcon: DodadaIconToken? = nil,
        trailingIcon: DodadaIconToken? = .chevronsRight,
        action: @escaping () -> Void
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.init(title: title, description: description) {
            DDDIcon(leadingIcon)
        } trailingIcon: {
            DDDIcon(trailingIcon)
        } action: {
            action()
        }
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            VStack{
                HStack {
                    leadingIcon()
                    
                    VStack(alignment: .leading, spacing: .spacingXs) {
                        Text(title)
                            .textStyle(.calloutBold)
                        
                        if let description = description {
                            Text(description)
                                .textStyle(.footnoteRegular)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    trailingIcon()
                    
                }.padding(.vertical, .spacingMd)
                
                Divider()
            }
            .padding(.horizontal, .spacingMd)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        DDDVerticalNav(
            title: "Mi número de celular",
            description: "+51 9999 99999",
            leadingIcon: .timeAgend) {
            print("Número de celular presionado")
        }
        
        DDDVerticalNav(
            title: "Mis datos personales",
            leadingIcon: .specialAquisito,
            trailingIcon: .socialGoogle
        ) {
            print("Datos personales presionados")
        }
    }
    .environment(\.colorTheme, DDDThemeDefault())
}
