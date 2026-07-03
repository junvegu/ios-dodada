//
//  DDDSavedPlacesHorizontalView.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDSavedPlacesHorizontalView<Item: Identifiable>: View {

    // MARK: - Properties

    private let items: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onItemTap: (Item) -> Void
    private let itemTitle: (Item) -> String
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
        itemImageURL: @escaping (Item) -> String
    ) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onItemTap = onItemTap
        self.itemTitle = itemTitle
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
                HStack(spacing: .spacingXl) {
                    ForEach(items) { item in
                        DDDPlaceThumbnail(
                            imageURL: itemImageURL(item),
                            title: itemTitle(item)
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
    DDDSavedPlacesHorizontalView(
        items: [
            PreviewPlace(id: 1, name: "Sabor a mar", imageURL:  "https://picsum.photos/seed/sabor/200/200")
        ],
        sectionTitle: "Lugares guardados",
        sectionButtonTitle: "Ver todos",
        onSeeAllTap: {},
        onItemTap: { _ in },
        itemTitle: { $0.name },
        itemImageURL: { $0.imageURL }
    )
}

private struct PreviewPlace: Identifiable {
    let id: Int
    let name: String
    let imageURL: String
}
#endif
