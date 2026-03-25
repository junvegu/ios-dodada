//
//  RecomendedDishView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct RecommendedDishView: View {
    private let imageURL: URL?
    private let name: String
    private let rating: Double
    private let location: String
    private let distance: String
    private let categories: [String]
    private let priceLevel: LevelPrice
    private let isFeatured: Bool
    
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
        VStack(alignment: .leading, spacing: .zero) {
            ZStack {
                DDDAsyncImage.init(url: imageURL)
                    .frame(maxHeight: 120)
                    .clipped()
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
                            DDDIcon(.contentAward2, color: .warningValue500)

                            Text("Destacado")
                                .textStyle(.caption2Bold)
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0, y: 0)
    }
}

#Preview {
    VStack{
        RecommendedDishView(
            imageURL: URL(string: "https://depor.com/resizer/4kiZrbwt2iNZhIpk4fu_P3CFoWQ=/1200x1200/smart/filters:format(jpeg):quality(90)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/UGQRAZ63M5GYDLXVOH2NWZ5B3I.jpg"),
            name: "Anticuchos Bran",
            rating: 4.1,
            location: "San Pedro 308, Surquillo 15047",
            distance: "2.3km",
            categories: ["Criolla", "Tradicional", "Peruano", "Bar & Grill","Selva"],
            priceLevel: .low,
            isFeatured: true
        )
        RecommendedDishView(
            imageURL: URL(string: "https://marieclaire.com.mx/wp-content/uploads/2025/02/IMG_7795-822x1024.jpg"),
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
