//
//  DDDCollectionCard.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDCollectionCard<Icon: View>: View {
    private let title: String
    private let placesCount: Int
    private let likesCount: Int
    private let isPrivate: Bool
    private let width: CGFloat
    private let height: CGFloat
    private let backgroundColor: Color
    @ViewBuilder public let icon: Icon

    public init(
        title: String,
        placesCount: Int,
        likesCount: Int,
        isPrivate: Bool = false,
        width: CGFloat = 140,
        height: CGFloat = 170,
        backgroundHex: String = "#F5F0FF",
        @ViewBuilder icon: () -> Icon
    ) {
        self.title = title
        self.placesCount = placesCount
        self.likesCount = likesCount
        self.isPrivate = isPrivate
        self.width = width
        self.height = height
        self.backgroundColor = Color(hex: backgroundHex)
        self.icon = icon()
    }

    public var body: some View {
        ZStack {
            icon

            VStack(spacing: .zero) {
                
                HStack {
                    Spacer()
                    if isPrivate {
                        DDDIcon(.userLock, color: .secondaryValue100, size: .iconXs)
                            .padding(.spacingSm)
                            .background(
                                Circle()
                                    .fill(Color.gray.opacity(0.9))
                                    .frame(width: 16)
                            )
                    }
                }
                .padding(.top, .spacingSm)
                .padding(.trailing, .spacingSm)
                
                Spacer()

                VStack(alignment: .leading, spacing: .spacingXs) {
                    Text(title)
                        .textStyle(.footnoteBold)
                        .foregroundStyle(Color.secondaryValue500)
                        .lineLimit(2)

                    HStack(spacing: .spacingSm) {
                        HStack(spacing: .spacingTwoXs) {
                            DDDIcon(.restaurantRestaurant, color: .primaryValue500, size: .iconXs)
                            Text("\(placesCount)")
                                .textStyle(.caption2Regular)
                                .foregroundStyle(Color.secondaryValue400)
                        }
                        
                        HStack(spacing: .spacingTwoXs) {
                            DDDIcon(.contentHeart, color: .primaryValue500, size: .iconXs)
                            Text("\(likesCount)")
                                .textStyle(.caption2Regular)
                                .foregroundStyle(Color.secondaryValue400)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, .spacingMd)
                .padding(.bottom, .spacingMd)
            }
        }
        .frame(width: width, height: height)
        .background(
            RoundedRectangle(cornerRadius: .radiusXl, style: .continuous)
                .fill(backgroundColor)
                .shadow(color: Color.black.opacity(0.15), radius: 1.5, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.30), radius: 1, x: 0, y: 1)
        )
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDCollectionCard(
        title: "Mi colección",
        placesCount: 4,
        likesCount: 19,
        isPrivate: true,
        backgroundHex: "#F5F0FF"
    ) {
        DDDIcon(.contentHeart, color: .primaryValue500, size: .iconMd)
    }
}
#endif
