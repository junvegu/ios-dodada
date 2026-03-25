//
//  PromotionRestaurantHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 12/01/26.
//

import SwiftUI

public struct PromotionRestaurantHorizontalView<Item: Identifiable>: View {
    private let promotions: [Item]
    private let onSeeAllTap: (() -> Void)?
    private let promotionImageURL: (Item) -> String
    private let promotionTitle: (Item) -> String
    
    public init(
        promotions: [Item],
        onSeeAllTap: (() -> Void)? = nil,
        promotionImageURL: @escaping (Item) -> String,
        promotionTitle: @escaping (Item) -> String
    ) {
        self.promotions = promotions
        self.onSeeAllTap = onSeeAllTap
        self.promotionImageURL = promotionImageURL
        self.promotionTitle = promotionTitle
    }
    
    private enum Constants {
        static var cardSpacing: CGFloat { 16 }
        static var cardWidth: CGFloat { 130 }
        static var cardHeight: CGFloat { 170 }
        static var titleSpacing: CGFloat { 8 }
    }
    
    public var body: some View {
        VStack(spacing: .spacingMd) {
            DDDSection(
                title: "Promociones",
                subtitle: nil,
                buttonTitle: "Ver todos",
                action: onSeeAllTap
            )
            .padding(.leading, .spacingMd)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.cardSpacing) {
                    ForEach(promotions) { promotion in
                        PromotionCardView(
                            imageURL: promotionImageURL(promotion),
                            title: promotionTitle(promotion)
                        )
                    }
                }
                .padding(.horizontal, .spacingMd)
            }
        }
    }
}

private struct PromotionCardView: View {
    let imageURL: String
    let title: String
    
    private enum Constants {
        static var cardWidth: CGFloat { 130 }
        static var cardHeight: CGFloat { 170 }
    }
    var body: some View {
        
        VStack(spacing: .spacingTwoXs) {
            ZStack(alignment: .leading) {
                DDDAsyncImage(urlString: imageURL)
                    .scaledToFill()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.0),
                                Color.black.opacity(0.4)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .clipped()
            }
            .frame(width: Constants.cardWidth, height: Constants.cardHeight)
            .clipShape(RoundedRectangle(cornerRadius: .radiusLg))
            
            Text(title)
                .textStyle(.footnoteBold)
                .foregroundColor(Color.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
        }
        
    }
}

#if PREVIEW
struct PromotionRestaurantHorizontalView_Previews: PreviewProvider {
    struct MockPromotion: Identifiable {
        let id: Int
        let imageURL: String
        let title: String
    }
    
    static var previews: some View {
        PromotionRestaurantHorizontalView(
            promotions: [
                MockPromotion(
                    id: 1,
                    imageURL: "https://picsum.photos/seed/promo1/340/200",
                    title: "2x1 en platos seleccionados"
                ),
                MockPromotion(
                    id: 2,
                    imageURL: "https://picsum.photos/seed/promo2/340/200",
                    title: "Happy Hour 4pm-7pm"
                )
            ],
            onSeeAllTap: {
                print("Ver todos tapped")
            },
            promotionImageURL: { $0.imageURL },
            promotionTitle: { $0.title }
        )
        .previewLayout(.sizeThatFits)
    }
}
#endif

