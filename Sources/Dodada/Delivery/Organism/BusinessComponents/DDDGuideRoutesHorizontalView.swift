//
//  DDDGuideRoutesHorizontalView.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDGuideRoutesHorizontalView<Item: Identifiable>: View {

    // MARK: - Properties

    private let items: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onItemTap: (Item) -> Void
    private let itemTitle: (Item) -> String
    private let itemScore: (Item) -> String
    private let itemPlaces: (Item) -> Int
    private let itemDistance: (Item) -> String
    private let itemTime: (Item) -> String
    private let itemImageURL: (Item) -> String

    // MARK: - Init

    public init(
        items: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onItemTap: @escaping (Item) -> Void,
        itemTitle: @escaping (Item) -> String,
        itemScore: @escaping (Item) -> String,
        itemPlaces: @escaping (Item) -> Int,
        itemDistance: @escaping (Item) -> String,
        itemTime: @escaping (Item) -> String,
        itemImageURL: @escaping (Item) -> String
    ) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onItemTap = onItemTap
        self.itemTitle = itemTitle
        self.itemScore = itemScore
        self.itemPlaces = itemPlaces
        self.itemDistance = itemDistance
        self.itemTime = itemTime
        self.itemImageURL = itemImageURL
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: .zero) {
            DDDSection(
                title: sectionTitle,
                subtitle: sectionSubtitle,
                buttonTitle: sectionButtonTitle,
                action: onSeeAllTap
            )

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: .spacingMd) {
                    ForEach(items) { item in
                        DDDGuideRouteCard(
                            title: itemTitle(item),
                            score: itemScore(item),
                            places: itemPlaces(item),
                            distance: itemDistance(item),
                            time: itemTime(item),
                            imageURL: itemImageURL(item)
                        )
                        .onTapGesture { onItemTap(item) }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, .spacingLg)
                .padding(.vertical, .spacingSm)
            }
        }
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDGuideRoutesHorizontalView(
        items: [
            PreviewRoute(id: 1, title: "Noche en Barranco", score: "4.2", places: 4, distance: "2.3 km", time: "2h", imageURL:  "https://picsum.photos/seed/barranco/400/500")
        ],
        sectionTitle: "Mis rutas",
        sectionButtonTitle: "Ver todos",
        onSeeAllTap: {},
        onItemTap: { _ in },
        itemTitle: { $0.title },
        itemScore: { $0.score },
        itemPlaces: { $0.places },
        itemDistance: { $0.distance },
        itemTime: { $0.time },
        itemImageURL: { $0.imageURL }
    )
}

private struct PreviewRoute: Identifiable {
    let id: Int
    let title: String
    let score: String
    let places: Int
    let distance: String
    let time: String
    let imageURL: String
}
#endif
