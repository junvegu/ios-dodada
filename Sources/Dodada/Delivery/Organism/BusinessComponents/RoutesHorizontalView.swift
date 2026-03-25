//
//  RoutesHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

/// A horizontal scrolling view that displays a collection of routes with a section header.
public struct RoutesHorizontalView<Item: Identifiable>: View {
    private let routes: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onRouteTap: (Item) -> Void
    private let routeTitle: (Item) -> String
    private let routeStops: (Item) -> Int
    private let routeDistance: (Item) -> String
    private let routeDuration: (Item) -> String
    private let routeRating: (Item) -> Double
    private let routeImageURLs: (Item) -> [URL?]
    private let routeExtraCount: (Item) -> Int
    
    public init(
        routes: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onRouteTap: @escaping (Item) -> Void,
        routeTitle: @escaping (Item) -> String,
        routeStops: @escaping (Item) -> Int,
        routeDistance: @escaping (Item) -> String,
        routeDuration: @escaping (Item) -> String,
        routeRating: @escaping (Item) -> Double,
        routeImageURLs: @escaping (Item) -> [URL?],
        routeExtraCount: @escaping (Item) -> Int
    ) {
        self.routes = routes
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onRouteTap = onRouteTap
        self.routeTitle = routeTitle
        self.routeStops = routeStops
        self.routeDistance = routeDistance
        self.routeDuration = routeDuration
        self.routeRating = routeRating
        self.routeImageURLs = routeImageURLs
        self.routeExtraCount = routeExtraCount
    }

    public var body: some View {
        VStack(spacing: .zero) {
            DDDSection(
                title: sectionTitle,
                subtitle: sectionSubtitle,
                buttonTitle: sectionButtonTitle,
                action: onSeeAllTap
            )
            .padding(.horizontal, .spacingMd)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: .spacingSm) {
                    ForEach(routes) { route in
                        RouteCardItem(
                            title: routeTitle(route),
                            stops: routeStops(route),
                            distanceText: routeDistance(route),
                            durationText: routeDuration(route),
                            rating: routeRating(route),
                            imageURLs: routeImageURLs(route),
                            extraCount: routeExtraCount(route)
                        )
                        .padding(.vertical, .spacingMd)
                        .onTapGesture {
                            onRouteTap(route)
                        }
                        .padding(.top, .spacingTwoXs)
                        .padding(.bottom, .spacingSm)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, .spacingMd)
            }
            .background(Color.white)
        }
    }
}
#if PREVIEW
#Preview {
    struct MockRoute: Identifiable {
        let id: Int
        let title: String
        let stops: Int
        let distance: String
        let duration: String
        let rating: Double
        let imageURLs: [URL?]
        let extraCount: Int
    }
    
    return RoutesHorizontalView(
        routes: (0..<5).map { index in
            MockRoute(
                id: index,
                title: "Ruta del\nceviche",
                stops: 4,
                distance: "20Km",
                duration: "3h",
                rating: 4.2,
                imageURLs: (0..<4).compactMap { i in
                    URL(string: "https://picsum.photos/seed/\(index * 10 + i)/400/300")
                },
                extraCount: 4
            )
        },
        sectionTitle: "Rutas recomendadas",
        sectionSubtitle: "Explora rutas gastronómicas cerca de ti",
        sectionButtonTitle: "Ver más",
        onSeeAllTap: {},
        onRouteTap: { _ in },
        routeTitle: { $0.title },
        routeStops: { $0.stops },
        routeDistance: { $0.distance },
        routeDuration: { $0.duration },
        routeRating: { $0.rating },
        routeImageURLs: { $0.imageURLs },
        routeExtraCount: { $0.extraCount }
    )
}

#endif
