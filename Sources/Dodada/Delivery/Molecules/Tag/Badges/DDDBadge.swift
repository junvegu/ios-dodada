//
//  DDDBadge.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 9/04/25.
//

import SwiftUI

public struct DDDBadge: View {
    public var text: String
    public var icon: DodadaIconToken
    public var type: TagType
    public var state: TagState

    public init(text: String, icon: DodadaIconToken, type: TagType, state: TagState) {
        self.text = text
        self.icon = icon
        self.type = type
        self.state = state
    }

    public var body: some View {
        HStack(spacing: 4) {
            DDDIcon(icon, color: state.iconColorToken(for: type), size: .iconSm)

            Text(text)
                .textStyle(.caption2Bold)
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
                    icon: .trendingZap,
                    type: .outline,
                    state: .default
                )
                
                DDDBadge(
                    text: "Pasivo",
                    icon: .trendingZap,
                    type: .outline,
                    state: .info
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .outline,
                    state: .success
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .outline,
                    state: .warning
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .outline,
                    state: .alert
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .outline,
                    state: .secondary
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .outline,
                    state: .ghost
                )
            }
            
            VStack{
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .filled,
                    state: .default
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .filled,
                    state: .info
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .filled,
                    state: .success
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .filled,
                    state: .warning
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .filled,
                    state: .alert
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .filled,
                    state: .secondary
                )
            }
            
            VStack{
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .opacity,
                    state: .default
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .opacity,
                    state: .info
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .opacity,
                    state: .success
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .opacity,
                    state: .warning
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .opacity,
                    state: .alert
                )
                DDDBadge(
                    text: "Alerta",
                    icon: .trendingZap,
                    type: .opacity,
                    state: .secondary
                )
            }
        }
    }
}


