//
//  PlacesHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct PlacesHorizontalView<Item: Identifiable>: View {
    private let places: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onPlaceTap: (Item) -> Void
    private let placeImageURL: (Item) -> URL?
    private let placeName: (Item) -> String
    private let placeRating: (Item) -> String
    private let placeLocation: (Item) -> String
    private let placeDistance: (Item) -> String
    private let placeCategories: (Item) -> [String]
    
    public init(
        places: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onPlaceTap: @escaping (Item) -> Void,
        placeImageURL: @escaping (Item) -> URL?,
        placeName: @escaping (Item) -> String,
        placeRating: @escaping (Item) -> String,
        placeLocation: @escaping (Item) -> String,
        placeDistance: @escaping (Item) -> String,
        placeCategories: @escaping (Item) -> [String]
    ) {
        self.places = places
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onPlaceTap = onPlaceTap
        self.placeImageURL = placeImageURL
        self.placeName = placeName
        self.placeRating = placeRating
        self.placeLocation = placeLocation
        self.placeDistance = placeDistance
        self.placeCategories = placeCategories
    }

    public var body: some View {
        VStack(spacing: .zero) {
            DDDSection(
                title: sectionTitle,
                subtitle: sectionSubtitle,
                buttonTitle: sectionButtonTitle,
                action: onSeeAllTap
            )
            .padding(.horizontal, .spacingLg)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: .spacingMd) {
                    ForEach(places) { place in
                        RecommendedPlaceView(
                            imageURL: placeImageURL(place),
                            name: placeName(place),
                            rating: placeRating(place),
                            location: placeLocation(place),
                            distance: placeDistance(place),
                            categories: placeCategories(place),
                            priceLevel: .low,
                            isFeatured: false
                        )
                        .frame(width: 320)
                        .onTapGesture {
                            onPlaceTap(place)
                        }
                        .padding(.top, .spacingXs)
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
/*

#Preview {
    struct MockPlace: Identifiable {
        let id: String
        let name: String
        let imageURL: URL?
        let rating: Double
        let location: String
        let distance: String
        let categories: [String]
    }
    
    let mockPlaces = [
        MockPlace(id: "1", name: "La Mar", imageURL: URL(string: "https://picsum.photos/seed/featured1/400/300"), rating: 4.9, location: "Av. La Mar 770, Miraflores", distance: "0.8km", categories: ["Mariscos", "Peruano", "Gourmet"]),
        MockPlace(id: "2", name: "Central Placee", imageURL: URL(string: "https://picsum.photos/seed/featured2/400/300"), rating: 4.8, location: "Av. Pedro de Osma 301, Barranco", distance: "2.1km", categories: ["Gourmet", "Peruano", "Fusión"])
    ]
    
    return PlacesHorizontalView(
        places: mockPlaces,
        sectionTitle: "Placees destacados",
        sectionSubtitle: nil,
        sectionButtonTitle: "Ver más",
        onSeeAllTap: {},
        onPlaceTap: { _ in },
        placeImageURL: { $0.imageURL },
        placeName: { $0.name },
        placeRating: { $0.rating },
        placeLocation: { $0.location },
        placeDistance: { $0.distance },
        placeCategories: { $0.categories }
    )
    
}

*/
