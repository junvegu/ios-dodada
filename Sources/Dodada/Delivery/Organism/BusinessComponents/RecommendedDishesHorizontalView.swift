//
//  RecommendedDishesHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct RecommendedDishesHorizontalView<Item: Identifiable>: View {
    private let dishes: [Item]
    private let sectionTitle: String
    private let sectionSubtitle: String?
    private let sectionButtonTitle: String?
    private let onSeeAllTap: () -> Void
    private let onDishTap: (Item) -> Void
    private let dishImageURL: (Item) -> URL?
    private let dishName: (Item) -> String
    private let dishRating: (Item) -> Double
    private let dishLocation: (Item) -> String
    private let dishDistance: (Item) -> String
    private let dishCategories: (Item) -> [String]
    private let dishPriceLevel: (Item) -> LevelPrice
    private let dishIsFeatured: (Item) -> Bool
    
    public init(
        dishes: [Item],
        sectionTitle: String,
        sectionSubtitle: String? = nil,
        sectionButtonTitle: String? = nil,
        onSeeAllTap: @escaping () -> Void,
        onDishTap: @escaping (Item) -> Void,
        dishImageURL: @escaping (Item) -> URL?,
        dishName: @escaping (Item) -> String,
        dishRating: @escaping (Item) -> Double,
        dishLocation: @escaping (Item) -> String,
        dishDistance: @escaping (Item) -> String,
        dishCategories: @escaping (Item) -> [String],
        dishPriceLevel: @escaping (Item) -> LevelPrice,
        dishIsFeatured: @escaping (Item) -> Bool
    ) {
        self.dishes = dishes
        self.sectionTitle = sectionTitle
        self.sectionSubtitle = sectionSubtitle
        self.sectionButtonTitle = sectionButtonTitle
        self.onSeeAllTap = onSeeAllTap
        self.onDishTap = onDishTap
        self.dishImageURL = dishImageURL
        self.dishName = dishName
        self.dishRating = dishRating
        self.dishLocation = dishLocation
        self.dishDistance = dishDistance
        self.dishCategories = dishCategories
        self.dishPriceLevel = dishPriceLevel
        self.dishIsFeatured = dishIsFeatured
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
                LazyHStack(spacing: .spacingLg) {
                    ForEach(dishes) { dish in
                        RecommendedDishView(
                            imageURL: dishImageURL(dish),
                            name: dishName(dish),
                            rating: dishRating(dish),
                            location: dishLocation(dish),
                            distance: dishDistance(dish),
                            categories: dishCategories(dish),
                            priceLevel: dishPriceLevel(dish),
                            isFeatured: dishIsFeatured(dish)
                        )
                            .frame(width: 280)
                            .onTapGesture {
                                onDishTap(dish)
                            }
                            .padding(.top, .spacingTwoXs)
                            .padding(.bottom, .spacingSm)
                    }
                }
                .padding(.horizontal, .spacingMd)
            }
            .background(Color.white)
        }
    }
}

#Preview {
    struct MockDish: Identifiable {
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
    
    let mockDishes = [
        MockDish(id: "1", imageURL: URL(string: "https://depor.com/resizer/4kiZrbwt2iNZhIpk4fu_P3CFoWQ=/1200x1200/smart/filters:format(jpeg):quality(90)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/UGQRAZ63M5GYDLXVOH2NWZ5B3I.jpg"), name: "Anticuchos Bran", rating: 4.1, location: "San Pedro 308, Surquillo 15047", distance: "2.3km", categories: ["Criolla", "Tradicional", "Peruano"], priceLevel: .low, isFeatured: true),
        MockDish(id: "2", imageURL: URL(string: "https://marieclaire.com.mx/wp-content/uploads/2025/02/IMG_7795-822x1024.jpg"), name: "Pollitos Pio", rating: 5.0, location: "A la vuelta de tu casa", distance: "0km", categories: ["Criolla", "Tradicional"], priceLevel: .medium, isFeatured: false)
    ]
    
    return RecommendedDishesHorizontalView(
        dishes: mockDishes,
        sectionTitle: "Platos recomendados",
        sectionSubtitle: "Lo que todos están probando hoy",
        sectionButtonTitle: "Ver más",
        onSeeAllTap: {},
        onDishTap: { _ in },
        dishImageURL: { $0.imageURL },
        dishName: { $0.name },
        dishRating: { $0.rating },
        dishLocation: { $0.location },
        dishDistance: { $0.distance },
        dishCategories: { $0.categories },
        dishPriceLevel: { $0.priceLevel },
        dishIsFeatured: { $0.isFeatured }
    )
}

