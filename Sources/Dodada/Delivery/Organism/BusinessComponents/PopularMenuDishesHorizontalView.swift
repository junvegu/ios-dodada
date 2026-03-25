//
//  PopularMenuDishesHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 12/01/26.
//

import SwiftUI

public struct PopularMenuDishesHorizontalView<Item: Identifiable>: View where Item.ID: Hashable {
    private let dishes: [Item]
    private let onSeeAllTap: (() -> Void)?
    private let dishName: (Item) -> String
    private let dishImageURL: (Item) -> String
    private let dishPrice: (Item) -> String
    
    public init(
        dishes: [Item],
        onSeeAllTap: (() -> Void)? = nil,
        dishName: @escaping (Item) -> String,
        dishImageURL: @escaping (Item) -> String,
        dishPrice: @escaping (Item) -> String
    ) {
        self.dishes = dishes
        self.onSeeAllTap = onSeeAllTap
        self.dishName = dishName
        self.dishImageURL = dishImageURL
        self.dishPrice = dishPrice
    }
    
    private enum Constants {
        static var cardSpacing: CGFloat { 16 }
    }
    
    public var body: some View {
        VStack(spacing: .spacingSm) {
            DDDSection(
                title: "Platos populares",
                subtitle: nil,
                buttonTitle: "Ver todos",
                action: onSeeAllTap
            )
            .padding(.leading, .spacingMd)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.cardSpacing) {
                    ForEach(dishes) { dish in
                        PopularDishCardView(
                            name: dishName(dish),
                            imageURL: dishImageURL(dish),
                            price: dishPrice(dish)
                        )
                    }
                }
                .padding(.horizontal, .spacingMd)
            }
        }
    }
}

private struct PopularDishCardView: View {
    let name: String
    let imageURL: String
    let price: String
    
    private enum Constants {
        static var cardWidth: CGFloat { 140 }
        static var imageHeight: CGFloat { 100 }
    }
    
    var body: some View {
        VStack(spacing: .spacingTwoXs) {
            DDDAsyncImage(urlString: imageURL)
                .scaledToFill()
                .frame(width: Constants.cardWidth, height: Constants.imageHeight)
                .clipShape(RoundedRectangle(cornerRadius: .radiusXl))
                .clipped()
            
            VStack(alignment: .leading, spacing: .spacingTwoXs) {
                Text(name)
                    .textStyle(.footnoteBold)
                    .foregroundColor(Color.secondary)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(price)
                    .textStyle(.caption2Regular)
                    .foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: Constants.cardWidth, alignment: .leading)
        }
    }
}

#if PREVIEW
struct PopularMenuDishesHorizontalView_Previews: PreviewProvider {
    struct MockDish: Identifiable {
        let id: Int
        let name: String
        let price: Double
        let description: String
        let currency: String
        
        var formattedPrice: String {
            "\(currency) \(String(format: "%.2f", price))"
        }
        
        var imageURL: String {
            "https://picsum.photos/seed/dish\(id)/400/300"
        }
    }
    
    static var previews: some View {
        PopularMenuDishesHorizontalView(
            dishes: [
                MockDish(
                    id: 1,
                    name: "Churrasco",
                    price: 40.00,
                    description: "450gr. de carne aderezado a su preferencia acompañado con papas sancochadas o doradas con salsas de la casa.",
                    currency: "S/"
                ),
                MockDish(
                    id: 2,
                    name: "Mollejas Anticucheras",
                    price: 25.00,
                    description: "Cocinadas lentamente a la parrilla con su salsa anticuchera tradicional y unos toques de limón, acompañado con papas sancochadas y las salsas de la casa.",
                    currency: "S/"
                ),
                MockDish(
                    id: 3,
                    name: "Anticuchos de Corazón",
                    price: 30.00,
                    description: "2 palos de corazón aderezados en salsa anticuchera, peso 400gr. acompañadas de 2 rodajas de papas sancochadas o doradas a la parrilla y sus cremas.",
                    currency: "S/"
                )
            ],
            onSeeAllTap: {
                print("Ver todos tapped")
            },
            dishName: { $0.name },
            dishImageURL: { $0.imageURL },
            dishPrice: { $0.formattedPrice }
        )
        .previewLayout(.sizeThatFits)
    }
}
#endif

