//
//  DDDSavedRoute.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 4/05/26.
//

import SwiftUI

public struct DDDSavedRoute: View {
    public let title: String
    public let placesText: String
    public let hoursText: String?
    public let imageURL: String
    public let badgeScore: String?
    public let onTap: () -> Void
    
    private let imageSize: CGFloat = 88
    private let horizontalGap: CGFloat = 16
    private let textSpacing: CGFloat = 8
    private let detailSpacing: CGFloat = 4
    
    public init(
        title: String,
        placesText: String,
        hoursText: String? = nil,
        badgeScore: String? = nil,
        imageURL: String,
        onTap: @escaping () -> Void = {}
    ) {
        self.title = title
        self.placesText = placesText
        self.hoursText = hoursText
        self.badgeScore = badgeScore
        self.imageURL = imageURL
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
                        
                        Image(.route)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                    }
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(8)
                }
            }
            
            // MARK: - Texts
            VStack{
                VStack(alignment: .leading, spacing: detailSpacing) {
                    HStack{
                        Text(title)
                            .textStyle(.subheadlineBold)
                            .foregroundColor(.secondaryValue500)
                        
                        Spacer()
                        
                        // MARK: - Badge
                        if let score = badgeScore {
                            DDDBadge(
                                text: score,
                                icon: .contentStar,
                                type: .opacity,
                                state: .warning
                            )
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: detailSpacing) {
                        HStack(spacing: 6) {
                            DDDIcon(.restaurantRestaurant, size: .iconXs, overrideColor: .primaryValue500)
                            
                            Text(placesText)
                                .textStyle(.footnoteRegular)
                                .foregroundColor(.secondaryValue400)
                        }
                        
                        if let hours = hoursText {
                            HStack(spacing: 6) {
                                DDDIcon(.timeClock, size: .iconXs, overrideColor: .primaryValue500)
                                Text(hours)
                                    .textStyle(.footnoteRegular)
                                    .foregroundColor(.secondaryValue400)
                            }
                        }
                    }
                }
            }
        }.onTapGesture {
            onTap()
            
        }
        
    }
}

#Preview("Con Imagen") {
    VStack(spacing: 12){
        DDDSavedRoute(
            title: "Ruta del ceviche",
            placesText: "4 restaurantes",
            hoursText: "4 horas",
            badgeScore: "4.2",
            imageURL: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200"
        ) {
            print("Tapped en Ruta del ceviche")
        }
        
        DDDSavedRoute(
            title: "Ruta del ceviche",
            placesText: "4 restaurantes",
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
        placesText: "2 restaurantes",
        hoursText: "1 hora",
        badgeScore: "4.8",
        imageURL: ""
    ) {
        print("Tapped en Ruta nocturna")
    }
    .padding()
    .background(Color.white)
}
