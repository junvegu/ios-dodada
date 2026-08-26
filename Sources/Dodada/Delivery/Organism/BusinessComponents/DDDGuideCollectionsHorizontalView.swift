//
//  DDDGuideCollectionsHorizontalView.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDGuideCollectionsHorizontalView<Item: Identifiable, Icon: View>: View {

    // MARK: - Properties

    private let items: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onItemTap: (Item) -> Void
    private let itemTitle: (Item) -> String
    private let itemPlacesCount: (Item) -> Int
    private let itemLikesCount: (Item) -> Int
    private let itemIsPrivate: (Item) -> Bool
    private let itemBackgroundHex: (Item) -> String
    private let itemIcon: (Item) -> Icon

    // MARK: - Init

    public init(
        items: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onItemTap: @escaping (Item) -> Void,
        itemTitle: @escaping (Item) -> String,
        itemPlacesCount: @escaping (Item) -> Int,
        itemLikesCount: @escaping (Item) -> Int,
        itemIsPrivate: @escaping (Item) -> Bool,
        itemBackgroundHex: @escaping (Item) -> String,
        @ViewBuilder itemIcon: @escaping (Item) -> Icon
    ) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onItemTap = onItemTap
        self.itemTitle = itemTitle
        self.itemPlacesCount = itemPlacesCount
        self.itemLikesCount = itemLikesCount
        self.itemIsPrivate = itemIsPrivate
        self.itemBackgroundHex = itemBackgroundHex
        self.itemIcon = itemIcon
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
                HStack(spacing: .spacingMd) {
                    ForEach(items) { item in
                        DDDCollectionCard(
                            title: itemTitle(item),
                            placesCount: itemPlacesCount(item),
                            likesCount: itemLikesCount(item),
                            isPrivate: itemIsPrivate(item),
                            backgroundHex: itemBackgroundHex(item),
                            icon: { itemIcon(item) }
                        )
                        .onTapGesture { onItemTap(item) }
                    }
                }
                .padding(.horizontal, .spacingLg)
                .padding(.vertical, .spacingSm)
            }
        }
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDGuideCollectionsHorizontalView(
        items: [
            PreviewCollection(id: 1, title: "Mi colección", count: 4, likes: 19, isPrivate: true, emoji: "❤️", hex: "#F5F0FF"),
            PreviewCollection(id: 1, title: "Mi colección", count: 4, likes: 19, isPrivate: true, emoji: "❤️", hex: "#F5F0FF")
        ],
        sectionTitle: "Mis Colecciones",
        sectionButtonTitle: "Ver todos",
        onSeeAllTap: {},
        onItemTap: { _ in },
        itemTitle: { $0.title },
        itemPlacesCount: { $0.count },
        itemLikesCount: { $0.likes },
        itemIsPrivate: { $0.isPrivate },
        itemBackgroundHex: { $0.hex },
        itemIcon: { item in
            Text(item.emoji).font(.system(size: 40))
        }
    )
}

private struct PreviewCollection: Identifiable {
    let id: Int
    let title: String
    let count: Int
    let likes: Int
    let isPrivate: Bool
    let emoji: String
    let hex: String
}
#endif
