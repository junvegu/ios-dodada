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
        leadingIcon: DDDIcon.Images? = nil,
        trailingIcon: DDDIcon.Images? = .chevronRight,
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
                    
                    VStack(alignment: .leading, spacing: .xSmall) {
                        Text(title)
                            .apply(token: .callOut, weight: .bold)
                        
                        if let description = description {
                            Text(description)
                                .apply(token: .footNote, weight: .regular)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    trailingIcon()
                    
                }.padding(.vertical, .medium)
                
                Divider()
            }
            .padding(.horizontal, .medium)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        DDDVerticalNav(
            title: "Mi número de celular",
            description: "+51 9999 99999",
            leadingIcon: .agend) {
            print("Número de celular presionado")
        }
        
        DDDVerticalNav(
            title: "Mis datos personales",
            leadingIcon: .aquisito,
            trailingIcon: .google
        ) {
            print("Datos personales presionados")
        }
    }
    .environment(\.colorTheme, ColorThemeDefault())
}
