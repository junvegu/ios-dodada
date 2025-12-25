//
//  DDDBadge.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 9/04/25.
//

import SwiftUI

public struct DDDBadge: View {
    public var text: String
    public var icon: DDDIcon.Images
    public var type: TagType
    public var state: TagState

    public init(text: String, icon: DDDIcon.Images, type: TagType, state: TagState) {
        self.text = text
        self.icon = icon
        self.type = type
        self.state = state
    }

    public var body: some View {
        HStack(spacing: 4) {
            DDDIcon(icon, iconColor: state.iconColor(for: type))
                .iconSize(custom: .small)

            Text(text)
                .apply(token: .caption2, weight: .bold)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(type.background(for: state))
        .foregroundColor(type.foreground(for: state))
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(type.border(for: state), lineWidth: (type == .outline || type == .filled) ? 1 : 0)
        )
        .cornerRadius(6)
    }
}

struct DDDBadge_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            VStack {
                DDDBadge(
                    text: "Activo",
                    icon: .zap,
                    type: .outline,
                    state: .default
                )
                
                DDDBadge(
                    text: "Pasivo",
                    icon: .zap,
                    type: .outline,
                    state: .info
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .outline,
                    state: .success
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .outline,
                    state: .warning
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .outline,
                    state: .alert
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .outline,
                    state: .secondary
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .outline,
                    state: .ghost
                )
            }
            
            VStack{
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .filled,
                    state: .default
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .filled,
                    state: .info
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .filled,
                    state: .success
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .filled,
                    state: .warning
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .filled,
                    state: .alert
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .filled,
                    state: .secondary
                )
            }
            
            VStack{
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .opacity,
                    state: .default
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .opacity,
                    state: .info
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .opacity,
                    state: .success
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .opacity,
                    state: .warning
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .opacity,
                    state: .alert
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .zap,
                    type: .opacity,
                    state: .secondary
                )
            }
        }
    }
}


