//
//  DDDRestaurantPreview.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 14/03/25.
//

import SwiftUI

public struct RecommendedRestaurantView: View {
    private let imageURL: URL?
    private let name: String
    private let rating: Double
    private let location: String
    private let distance: String
    private let categories: [String]
    private let priceLevel: LevelPrice
    private let isFeatured: Bool
    
    private let imageSize: CGFloat = 64
    
    public init(
        imageURL: URL?,
        name: String,
        rating: Double,
        location: String,
        distance: String,
        categories: [String],
        priceLevel: LevelPrice,
        isFeatured: Bool
    ) {
        self.imageURL = imageURL
        self.name = name
        self.rating = rating
        self.location = location
        self.distance = distance
        self.categories = categories
        self.priceLevel = priceLevel
        self.isFeatured = isFeatured
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: .spacingXs) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: imageSize, height: imageSize)
                    .shadow(radius: 4)
                    .overlay(
                        DDDAsyncImage(url: imageURL)
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(Circle())
                    )
            }
            
            VStack(alignment: .leading, spacing: .spacingXs) {
                HStack {
                    Text(name)
                        .textStyle(.bodyBold)
                    Spacer()
                    HStack(spacing: .spacingTwoXs) {
                        DDDIcon(.contentStar, color: .warningValue300)
                        Text(String(format: "%.1f", rating))
                            .textStyle(.caption2Bold)
                    }
                }
                
                HStack {
                    DDDIcon(.locationMapPin)
                    Text(location)
                        .textStyle(.caption1Regular)
                    Text("(\(distance))")
                        .textStyle(.caption2Regular)
                }
                
                HStack {
                    DDDListTagView(data: categories)
                }
                
                HStack {
                    DDDPriceIndicatorView(level: priceLevel)
                    
                    if isFeatured {
                        Text("•")
                            .foregroundColor(.gray)
                        HStack {
                            DDDIcon(.contentAward2, color: .warningValue300)
                            Text("Destacado")
                                .textStyle(.caption2Bold)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0, y: 0)
    }
}


#Preview {
    VStack{
        RecommendedRestaurantView(
            imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"),
            name: "Anticuchos Bran",
            rating: 4.1,
            location: "San Pedro 308, Surquillo 15047",
            distance: "2.3km",
            categories: ["Criolla", "Tradicional", "Peruano", "Bar & Grill","Selva"],
            priceLevel: .low,
            isFeatured: true
        )
        RecommendedRestaurantView(
            imageURL: URL(string: "pio"),
            name: "Pollitos Pio",
            rating: 5,
            location: "A la vuelta de tu casa",
            distance: "0km",
            categories: ["Criolla", "Tradicional", "Peruano", "Bar & Grill","Selva"],
            priceLevel: .medium,
            isFeatured: false
        )
    }
}

