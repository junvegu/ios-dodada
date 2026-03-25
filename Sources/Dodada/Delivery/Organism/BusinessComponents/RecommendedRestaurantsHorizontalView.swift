//
//  RecommendedRestaurantsHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct RecommendedRestaurantsHorizontalView<Item: Identifiable>: View {
    private let restaurants: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onRestaurantTap: (Item) -> Void
    private let restaurantImageURL: (Item) -> URL?
    private let restaurantName: (Item) -> String
    private let restaurantRating: (Item) -> Double
    private let restaurantLocation: (Item) -> String
    private let restaurantDistance: (Item) -> String
    private let restaurantCategories: (Item) -> [String]
    private let restaurantPriceLevel: (Item) -> LevelPrice
    private let restaurantIsFeatured: (Item) -> Bool
    
    public init(
        restaurants: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onRestaurantTap: @escaping (Item) -> Void,
        restaurantImageURL: @escaping (Item) -> URL?,
        restaurantName: @escaping (Item) -> String,
        restaurantRating: @escaping (Item) -> Double,
        restaurantLocation: @escaping (Item) -> String,
        restaurantDistance: @escaping (Item) -> String,
        restaurantCategories: @escaping (Item) -> [String],
        restaurantPriceLevel: @escaping (Item) -> LevelPrice,
        restaurantIsFeatured: @escaping (Item) -> Bool
    ) {
        self.restaurants = restaurants
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onRestaurantTap = onRestaurantTap
        self.restaurantImageURL = restaurantImageURL
        self.restaurantName = restaurantName
        self.restaurantRating = restaurantRating
        self.restaurantLocation = restaurantLocation
        self.restaurantDistance = restaurantDistance
        self.restaurantCategories = restaurantCategories
        self.restaurantPriceLevel = restaurantPriceLevel
        self.restaurantIsFeatured = restaurantIsFeatured
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
                    ForEach(restaurants) { restaurant in
                        RecommendedRestaurantView(
                            imageURL: restaurantImageURL(restaurant),
                            name: restaurantName(restaurant),
                            rating: restaurantRating(restaurant),
                            location: restaurantLocation(restaurant),
                            distance: restaurantDistance(restaurant),
                            categories: restaurantCategories(restaurant),
                            priceLevel: restaurantPriceLevel(restaurant),
                            isFeatured: restaurantIsFeatured(restaurant)
                        )
                            .frame(width: 320)
                            .onTapGesture {
                                onRestaurantTap(restaurant)
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

#Preview {
    struct MockRestaurant: Identifiable {
        let id: String
        let imageURL: URL?
        let name: String
        let rating: Double
        let location: String
        let distance: String
        let categories: [String]
        let priceLevel: LevelPrice
        let isFeatured: Bool
    }
    
    let mockRestaurants = [
        MockRestaurant(id: "1", imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"), name: "Anticuchos Bran", rating: 4.1, location: "San Pedro 308, Surquillo 15047", distance: "2.3km", categories: ["Criolla", "Tradicional", "Peruano"], priceLevel: .low, isFeatured: true),
        MockRestaurant(id: "2", imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"), name: "Pollitos Pio", rating: 5.0, location: "A la vuelta de tu casa", distance: "0km", categories: ["Criolla", "Tradicional"], priceLevel: .medium, isFeatured: false)
    ]
    
    return RecommendedRestaurantsHorizontalView(
        restaurants: mockRestaurants,
        sectionTitle: "Restaurantes recomendados",
        sectionSubtitle: nil,
        sectionButtonTitle: "Ver más",
        onSeeAllTap: {},
        onRestaurantTap: { _ in },
        restaurantImageURL: { $0.imageURL },
        restaurantName: { $0.name },
        restaurantRating: { $0.rating },
        restaurantLocation: { $0.location },
        restaurantDistance: { $0.distance },
        restaurantCategories: { $0.categories },
        restaurantPriceLevel: { $0.priceLevel },
        restaurantIsFeatured: { $0.isFeatured }
    )
}

