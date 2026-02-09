//
//  DDDRestaurantPreview.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 14/03/25.
//

import SwiftUI
import SDWebImageSwiftUI

public struct DDDRestaurantPreview: View {
    let imageURL: URL?
    let name: String
    let rating: Double
    let location: String
    let distance: String
    let categories: [String]
    let priceLevel: LevelPrice
    let isFeatured: Bool
    
    private let imageSize: CGFloat = 64
    
    public init(imageURL: URL?,
                name: String,
                rating: Double,
                location: String,
                distance: String,
                categories: [String],
                priceLevel: LevelPrice,
                isFeatured: Bool = false) {
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
        HStack(alignment: .top, spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: imageSize, height: imageSize)
                    .shadow(radius: 4)// Con el shadow se ve mejor :D
                    .overlay(
                        WebImage(url: imageURL)
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(Circle())
                            .placeholder(when: true) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white.opacity(0.6))
                                    ProgressView()
                                }
                            }
                    )
            }
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(name)
                        .textStyle(.bodyBold)
                    Spacer()
                    HStack(spacing: 4) {
                        DDDIcon(.contentStar, color: nil, size: .iconSm)
                        Text(String(format: "%.1f", rating))
                            .textStyle(.caption2Bold)
                    }
                }
                
                HStack {
                    DDDIcon(.locationMapPin, size: .iconSm)
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
                            DDDIcon(.contentAward, color: nil, size: .iconMd)
                            Text("Destacado")
                                .textStyle(.caption2Bold)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.secondaryValue100, lineWidth: 2))
        .padding(.horizontal, 16)
    }
}


#Preview {
    VStack{
        DDDRestaurantPreview(
            imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"),
            name: "Anticuchos Bran",
            rating: 4.1,
            location: "San Pedro 308, Surquillo 15047",
            distance: "2.3km",
            categories: ["Criolla", "Tradicional", "Peruano", "Bar & Grill","Selva"],
            priceLevel: .low,
            isFeatured: true
        )
        DDDRestaurantPreview(
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

