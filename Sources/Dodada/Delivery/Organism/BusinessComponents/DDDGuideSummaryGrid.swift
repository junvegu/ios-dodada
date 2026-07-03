//
//  DDDGuideSummaryGrid.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI
public struct DDDGuideSummaryGrid: View {

    // MARK: - Item Model

    public struct Item: Identifiable {
        public let id = UUID()
        public let value: String
        public let title: String
        public let icon: DodadaIconToken
        public let type: DDDStatCard.CardType

        public init(
            value: String,
            title: String,
            icon: DodadaIconToken,
            type: DDDStatCard.CardType = .default
        ) {
            self.value = value
            self.title = title
            self.icon = icon
            self.type = type
        }
    }

    // MARK: - Properties

    public let title: String
    public let items: [Item]

    public init(title: String, items: [Item]) {
        self.title = title
        self.items = items
    }

    // MARK: - Layout

    private let columns = [
        GridItem(.flexible(), spacing: .spacingMd),
        GridItem(.flexible(), spacing: .spacingMd)
    ]

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: .spacingMd) {
            Text(title)
                .textStyle(.headlineBold)
                .foregroundStyle(Color.secondaryValue500)
                .padding(.horizontal, .spacingLg)

            LazyVGrid(columns: columns, spacing: .spacingMd) {
                ForEach(items) { item in
                    DDDStatCard(
                        value: item.value,
                        title: item.title,
                        icon: item.icon,
                        type: item.type
                    )
                }
            }
            .padding(.horizontal, .spacingLg)
        }
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDGuideSummaryGrid(
        title: "Tu resumen",
        items: [
            .init(value: "4", title: "Colecciones", icon: .navigationCollections),
            .init(value: "3", title: "Rutas", icon: .locationNavigation, type: .warning),
            .init(value: "27", title: "Guardados", icon: .contentHeartOutline, type: .success),
            .init(value: "-", title: "Platos (pronto)", icon: .restaurantFood, type: .disabled)
        ]
    )
    .padding(.vertical, .spacingLg)
}
#endif
