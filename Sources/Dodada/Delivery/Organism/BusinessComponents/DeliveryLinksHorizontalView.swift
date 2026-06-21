//
//  DeliveryLinksHorizontalView.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 16/06/26.
//

import SwiftUI

public struct DeliveryLinksHorizontalView<Item: Identifiable>: View {

    private let title: String
    private let links: [Item]
    private let thumbnailURL: (Item) -> String?
    private let type: (Item) -> String
    private let onItemTap: (Item) -> Void

    public init(
        title: String,
        links: [Item],
        thumbnailURL: @escaping (Item) -> String?,
        type: @escaping (Item) -> String,
        onItemTap: @escaping (Item) -> Void
    ) {
        self.title = title
        self.links = links
        self.thumbnailURL = thumbnailURL
        self.type = type
        self.onItemTap = onItemTap
    }

    public var body: some View {
        VStack(spacing: 10) {
            DDDSection(
                title: title,
                subtitle: nil,
                buttonTitle: nil
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacingSm) {
                    ForEach(links) { link in
                        DDDDeliveryLinkButton(
                            thumbnailURL: thumbnailURL(link),
                            type: type(link),
                            action: { onItemTap(link) }
                        )
                    }
                }
                .padding(.horizontal, .spacingLg)
                .padding(.top, 6)
                .padding(.bottom, 4)
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
struct DeliveryLinksHorizontalView_Previews: PreviewProvider {

    struct MockLink: Identifiable {
        let id: Int
        let type: String
        let thumbnailUrl: String?
    }

    static var previews: some View {
        VStack{
            DeliveryLinksHorizontalView(
                title: "Disponible en",
                links: [
                    MockLink(id: 1622, type: "rappi",     thumbnailUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Rappi_textlogo.svg/1280px-Rappi_textlogo.svg.png"),
                    MockLink(id: 1623, type: "uber_eats", thumbnailUrl: "https://1000marcas.net/wp-content/uploads/2020/10/Uber-Eats-Logo-1.png"),
                ],
                thumbnailURL: { $0.thumbnailUrl },
                type: { $0.type },
                onItemTap: { print("Tapped \($0.type)") }
            )
            .previewDisplayName("Con thumbnails")
        }
        .padding(.vertical)
        .background(Color.white)
    }
}
#endif
