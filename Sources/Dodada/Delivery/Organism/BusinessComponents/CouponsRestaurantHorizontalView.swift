//
//  CouponsRestaurantHorizontalView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 12/01/26.
//

import SwiftUI

public struct CouponsRestaurantHorizontalView<Item: Identifiable>: View {
    private let coupons: [Item]
    private let couponImageURL: (Item) -> String
    private let couponTitle: (Item) -> String
    private let couponCode: (Item) -> String
    private let couponBackgroundColor: (Item) -> Color
    private let couponDescription: (Item) -> String
    
    public init(
        coupons: [Item],
        couponImageURL: @escaping (Item) -> String,
        couponTitle: @escaping (Item) -> String,
        couponCode: @escaping (Item) -> String,
        couponBackgroundColor: @escaping (Item) -> Color,
        couponDescription: @escaping (Item) -> String
    ) {
        self.coupons = coupons
        self.couponImageURL = couponImageURL
        self.couponTitle = couponTitle
        self.couponCode = couponCode
        self.couponBackgroundColor = couponBackgroundColor
        self.couponDescription = couponDescription
    }
    
    private enum Constants {
        static var cardSpacing: CGFloat { 16 }
        static var cardWidth: CGFloat { 170 }
        static var cardHeight: CGFloat { 100 }
    }
    
    public var body: some View {
        VStack(spacing: .spacingMd) {
            DDDSection(
                title: "Cupones",
                subtitle: nil,
                buttonTitle: nil
            )
            //.padding(.horizontal, .spacingLg)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.cardSpacing) {
                    ForEach(coupons) { coupon in
                        CouponCardView(
                            imageURL: couponImageURL(coupon),
                            title: couponTitle(coupon),
                            code: couponCode(coupon),
                            backgroundColor: couponBackgroundColor(coupon),
                            description: couponDescription(coupon)
                        )
                        .frame(width: Constants.cardWidth, height: Constants.cardHeight)
                        .clipShape(RoundedRectangle(cornerRadius: .radiusXl))
                    }
                }
                .padding(.horizontal, .spacingLg)
            }
        }
    }
}

private struct CouponCardView: View {
    let imageURL: String
    let title: String
    let code: String
    let backgroundColor: Color
    let description: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            backgroundColor
                .ignoresSafeArea()
            
            Image(.specialPromo)//Corregir asset
            
            VStack(alignment: .leading, spacing: .spacingTwoXs) {
                Text(title)
                    .textStyle(.footnoteBold)
                    .foregroundColor(.white)
                
                Spacer()
                Text(code)
                    .textStyle(.calloutBold)
                    .foregroundColor(.white)
                
                Text(description)
                    .textStyle(.caption2Regular)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding(.spacingLg)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    struct MockCoupon: Identifiable {
        let id: Int
        let imageURL: String
        let title: String
        let code: String
        let backgroundColor: Color
        let description: String
    }
    
    return CouponsRestaurantHorizontalView(
        coupons: [
            MockCoupon(
                id: 1,
                imageURL: "",
                title: "Descuento especial",
                code: "SAVE20",
                backgroundColor: .blue,
                description: "Válido todo el día"
            ),
            MockCoupon(
                id: 2,
                imageURL: "",
                title: "Envío gratis",
                code: "FREESHIP",
                backgroundColor: .green,
                description: "Envío gratis en pedidos mayores a S/30"
            ),
            MockCoupon(
                id: 3,
                imageURL: "",
                title: "2x1 Combo",
                code: "COMBO2X1",
                backgroundColor: .orange,
                description: "Dos combos al precio de uno"
            )
        ],
        couponImageURL: { $0.imageURL },
        couponTitle: { $0.title },
        couponCode: { $0.code },
        couponBackgroundColor: { $0.backgroundColor },
        couponDescription: { $0.description }
    )
}
