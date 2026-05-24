//
//  RecommendedPlacesHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct RecommendedPlacesHorizontalView<Item: Identifiable>: View {
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
    private let placePriceLevel: (Item) -> LevelPrice
    private let placeIsFeatured: (Item) -> Bool
    
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
        placeCategories: @escaping (Item) -> [String],
        placePriceLevel: @escaping (Item) -> LevelPrice,
        placeIsFeatured: @escaping (Item) -> Bool
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
        self.placePriceLevel = placePriceLevel
        self.placeIsFeatured = placeIsFeatured
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
                HStack(spacing: .spacingSm) {
                    ForEach(places) { place in
                        RecommendedPlaceView(
                            imageURL: placeImageURL(place),
                            name: placeName(place),
                            rating: placeRating(place),
                            location: placeLocation(place),
                            distance: placeDistance(place),
                            categories: placeCategories(place),
                            priceLevel: placePriceLevel(place),
                            isFeatured: placeIsFeatured(place)
                        )
                            .frame(width: 320)
                            .onTapGesture {
                                onPlaceTap(place)
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
/*
#Preview {
    struct MockPlace: Identifiable {
        let id: String
        let imageURL: URL?
        let name: String
        let rating: Stri
        let location: String
        let distance: String
        let categories: [String]
        let priceLevel: LevelPrice
        let isFeatured: Bool
    }
    
    let mockPlaces = [
        MockPlace(id: "1", imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"), name: "Anticuchos Bran", rating: 4.1, location: "San Pedro 308, Surquillo 15047", distance: "2.3km", categories: ["Criolla", "Tradicional", "Peruano"], priceLevel: .low, isFeatured: true),
        MockPlace(id: "2", imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"), name: "Pollitos Pio", rating: 5.0, location: "A la vuelta de tu casa", distance: "0km", categories: ["Criolla", "Tradicional"], priceLevel: .medium, isFeatured: false)
    ]
    
    return RecommendedPlacesHorizontalView(
        places: mockPlaces,
        sectionTitle: "Placees recomendados",
        sectionSubtitle: nil,
        sectionButtonTitle: "Ver más",
        onSeeAllTap: {},
        onPlaceTap: { _ in },
        placeImageURL: { $0.imageURL },
        placeName: { $0.name },
        placeRating: { $0.rating },
        placeLocation: { $0.location },
        placeDistance: { $0.distance },
        placeCategories: { $0.categories },
        placePriceLevel: { $0.priceLevel },
        placeIsFeatured: { $0.isFeatured }
    )
}
*/
