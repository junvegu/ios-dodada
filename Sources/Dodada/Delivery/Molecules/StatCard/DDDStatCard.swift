//
//  DDDStatCard.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDStatCard: View {
    private let value: String
    private let title: String
    private let icon: DodadaIconToken
    private let type: CardType

    public init(
        value: String,
        title: String,
        icon: DodadaIconToken,
        type: CardType = .default
    ) {
        self.value = value
        self.title = title
        self.icon = icon
        self.type = type
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: .spacingXs) {
                Text(value)
                    .textStyle(.title2Bold)
                    .foregroundStyle(Color.secondaryValue500)

                Text(title)
                    .textStyle(.footnoteRegular)
                    .foregroundStyle(Color.secondaryValue500)
            }
            .padding(.vertical, .spacingLg)
            .padding(.leading, .spacingLg)

            Spacer()
            
            VStack{
                DDDIcon(icon, color: type.iconColor, size: .iconMd)
            }
            .padding(.trailing, 20)
            
        }
        .frame(width: 175, height: 82)
        .background(
            RoundedRectangle(cornerRadius: .radiusXl, style: .continuous)
                .fill(type.backgroundColor)
        )
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDStatCard(
        value: "4",
        title: "Colecciones",
        icon: .servicesBooking,
        type: .default
    )
    DDDStatCard(
        value: "3",
        title: "Rutas",
        icon: .locationMap,
        type: .success
    )
    DDDStatCard(
        value: "-",
        title: "Platos",
        icon: .restaurantFork,
        type: .disabled
    )
    DDDStatCard(
        value: "5",
        title: "Rutas",
        icon: .restaurantFork,
        type: .warning
    )
}
#endif
