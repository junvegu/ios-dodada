//
//  DDDGuideRouteCard.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDGuideRouteCard: View {
    private let title: String
    private let score: String
    private let places: Int
    private let distance: String
    private let time: String
    private let imageURL: String

    public init(
        title: String,
        score: String,
        places: Int,
        distance: String,
        time: String,
        imageURL: String
    ) {
        self.title = title
        self.score = score
        self.places = places
        self.distance = distance
        self.time = time
        self.imageURL = imageURL
    }

    public var body: some View {
        ZStack(alignment: .bottomLeading) {

            DDDAsyncImage(urlString: imageURL)
                .frame(width: 160, height: 190)
                .clipped()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0),
                            Color.black.opacity(0.7)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            VStack(alignment: .leading, spacing: .zero) {
                DDDBadge(
                    text: score,
                    icon: .contentStar,
                    type: .opacity,
                    state: .warning
                )
                    .padding(.spacingMd)

                Spacer()

                VStack(alignment: .leading, spacing: .spacingXs) {
                    Text(title)
                        .textStyle(.headlineBold)
                        .foregroundStyle(Color.white)
                        .lineLimit(2)

                    HStack(spacing: .spacingSm) {
                        HStack(spacing: .spacingTwoXs) {
                            DDDIcon(.restaurantRestaurant, color: .secondaryValue100, size: .iconXs)
                            Text("\(places)").textStyle(.caption2Regular)
                        }
                        HStack(spacing: .spacingTwoXs) {
                            DDDIcon(.locationMapPin, color: .secondaryValue100, size: .iconXs)//Agregar icon .ruler
                            Text(distance).textStyle(.caption2Regular)
                        }
                        HStack(spacing: .spacingTwoXs) {
                            DDDIcon(.timeClock, color: .secondaryValue100, size: .iconXs)
                            Text(time).textStyle(.caption2Regular)
                        }
                    }
                    .foregroundStyle(Color.secondaryValue100)
                }
                .padding(.spacingMd)
            }
        }
        .frame(width: 160, height: 190)
        .clipShape(RoundedRectangle(cornerRadius: .radiusXl, style: .continuous))
        .shadow(color: Color.black.opacity(0.10), radius: 9, x: 0, y: 4)
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDGuideRouteCard(
        title: "Noche en Barranco",
        score: "4.2",
        places: 4,
        distance: "2.3 km",
        time: "2h",
        imageURL:  "https://mx.web.img2.acsta.net/c_310_420/pictures/22/11/29/19/54/5215983.jpg"
    )
}
#endif
