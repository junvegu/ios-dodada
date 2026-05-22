//
//  DDDSavedRoute.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 4/05/26.
//

import SwiftUI

public struct DDDSavedRoute: View {
    public let title: String
    public let restaurantsText: String
    public let hoursText: String
    public let imageURL: String
    public let badgeScore: String
    public let onTap: () -> Void
    
    private let imageSize: CGFloat = 88
    private let horizontalGap: CGFloat = 16
    private let textSpacing: CGFloat = 8
    private let detailSpacing: CGFloat = 4
    
    public init(
        title: String,
        restaurantsText: String,
        hoursText: String,
        badgeScore: String,
        imageURL: String?,
        onTap: @escaping () -> Void = {}
    ) {
        self.title = title
        self.restaurantsText = restaurantsText
        self.hoursText = hoursText
        self.badgeScore = badgeScore
        self.imageURL = imageURL ?? ""
        self.onTap = onTap
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: horizontalGap) {
            // MARK: - Image
            VStack {
                if !imageURL.isEmpty {
                    DDDAsyncImage(urlString: imageURL)
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .cornerRadius(8)
                        .clipped()
                } else {
                    ZStack {
                        Color.secondaryValue100
                        
                        Image("Route", bundle: .module)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                    }
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(8)
                }
            }
            
            // MARK: - Texts
            VStack(alignment: .leading, spacing: textSpacing) {
                Text(title)
                    .textStyle(.subheadlineBold)
                    .foregroundColor(.secondaryValue500)
                
                VStack(alignment: .leading, spacing: detailSpacing) {
                    HStack(spacing: 6) {
                        DDDIcon(.restaurantRestaurant, size: .iconXs, overrideColor: .primaryValue500)
                        
                        Text(restaurantsText)
                            .textStyle(.footnoteRegular)
                            .foregroundColor(.secondaryValue400)
                    }
                    
                    HStack(spacing: 6) {
                        DDDIcon(.timeClock, size: .iconXs, overrideColor: .primaryValue500)
                        
                        Text(hoursText)
                            .textStyle(.footnoteRegular)
                            .foregroundColor(.secondaryValue400)
                    }
                }
            }
            .padding(.top, 4)
            
            Spacer()
            
            // MARK: - Badge
            DDDBadge(
                text: badgeScore,
                icon: .contentStar,
                type: .opacity,
                state: .warning
            )
            .padding(.top, 4)
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview("Con Imagen") {
    VStack(spacing: 12){
        DDDSavedRoute(
            title: "Ruta del ceviche",
            restaurantsText: "4 restaurantes",
            hoursText: "4 horas",
            badgeScore: "4.2",
            imageURL: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200"
        ) {
            print("Tapped en Ruta del ceviche")
        }
        
        DDDSavedRoute(
            title: "Ruta del ceviche",
            restaurantsText: "4 restaurantes",
            hoursText: "4 horas",
            badgeScore: "4.2",
            imageURL: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200"
        ) {
            print("Tapped en Ruta del ceviche")
        }
    }
    .padding(.horizontal)
    .background(Color.white)
}

#Preview("Sin Imagen (Fallback)") {
    DDDSavedRoute(
        title: "Ruta nocturna",
        restaurantsText: "2 restaurantes",
        hoursText: "1 hora",
        badgeScore: "4.8",
        imageURL: ""
    ) {
        print("Tapped en Ruta nocturna")
    }
    .padding()
    .background(Color.white)
}
