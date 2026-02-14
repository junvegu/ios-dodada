//
//  RestaurantsHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct RestaurantsHorizontalView<Item: Identifiable>: View {
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
        restaurantCategories: @escaping (Item) -> [String]
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
                    ForEach(restaurants) { restaurant in
                        RecommendedRestaurantView(
                            imageURL: restaurantImageURL(restaurant),
                            name: restaurantName(restaurant),
                            rating: restaurantRating(restaurant),
                            location: restaurantLocation(restaurant),
                            distance: restaurantDistance(restaurant),
                            categories: restaurantCategories(restaurant),
                            priceLevel: .low,
                            isFeatured: false
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
        let name: String
        let imageURL: URL?
        let rating: Double
        let location: String
        let distance: String
        let categories: [String]
    }
    
    let mockRestaurants = [
        MockRestaurant(id: "1", name: "La Mar", imageURL: URL(string: "https://picsum.photos/seed/featured1/400/300"), rating: 4.9, location: "Av. La Mar 770, Miraflores", distance: "0.8km", categories: ["Mariscos", "Peruano", "Gourmet"]),
        MockRestaurant(id: "2", name: "Central Restaurante", imageURL: URL(string: "https://picsum.photos/seed/featured2/400/300"), rating: 4.8, location: "Av. Pedro de Osma 301, Barranco", distance: "2.1km", categories: ["Gourmet", "Peruano", "Fusión"])
    ]
    
    return RestaurantsHorizontalView(
        restaurants: mockRestaurants,
        sectionTitle: "Restaurantes destacados",
        sectionSubtitle: nil,
        sectionButtonTitle: "Ver más",
        onSeeAllTap: {},
        onRestaurantTap: { _ in },
        restaurantImageURL: { $0.imageURL },
        restaurantName: { $0.name },
        restaurantRating: { $0.rating },
        restaurantLocation: { $0.location },
        restaurantDistance: { $0.distance },
        restaurantCategories: { $0.categories }
    )
    
}

