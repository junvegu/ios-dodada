//
//  DDDPlacePreview.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 14/03/25.
//

import SwiftUI

public struct RecommendedPlaceView: View {
    private let imageURL: URL?
    private let name: String
    private let rating: String
    private let location: String
    private let distance: String?
    private let categories: [String]?
    private let priceLevel: LevelPrice
    private let isFeatured: Bool
    
    private let imageSize: CGFloat = 64
    
    public init(
        imageURL: URL?,
        name: String,
        rating: String,
        location: String,
        distance: String? = nil,
        categories: [String]? = nil,
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
                
                // MARK: - Name & Rating
                
                HStack {
                    Text(name)
                        .textStyle(.bodyBold)
                    
                    Spacer()
                    
                    HStack(spacing: .spacingTwoXs) {
                        DDDIcon(.contentStar, color: .warningValue300, size: .iconXs)
                        
                        Text(rating)
                            .textStyle(.caption2Bold)
                    }
                }
                
                // MARK: - Location
                
                HStack(spacing: .spacingTwoXs) {
                    DDDIcon(.locationMapPin, size: .iconXs)
                    
                    Text(location)
                        .textStyle(.caption1Regular)
                    
                    if let distance, !distance.isEmpty {
                        Text("(\(distance))")
                            .textStyle(.caption2Regular)
                    }
                }
                
                // MARK: - Categories
                
                if let categories, !categories.isEmpty {
                    HStack {
                        DDDListTagView(data: categories)
                    }
                }
                
                // MARK: - Price & Featured
                
                HStack {
                    DDDPriceIndicatorView(level: priceLevel)
                    
                    if isFeatured {
                        Text("•")
                            .foregroundColor(.gray)
                        
                        HStack {
                            DDDIcon(.contentAward2, color: .warningValue300, size: .iconSm)
                            
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
    }
}


#Preview {
    VStack{
        RecommendedPlaceView(
            imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"),
            name: "Anticuchos Bran",
            rating: "4.1",
            location: "San Pedro 308, Surquillo 15047",
            distance: "2.3km",
            categories: ["Criolla", "Tradicional", "Peruano", "Bar & Grill","Selva"],
            priceLevel: .low,
            isFeatured: true
        )
        RecommendedPlaceView(
            imageURL: URL(string: "pio"),
            name: "Pollitos Pio",
            rating: "5",
            location: "A la vuelta de tu casa",
            distance: "0km",
            categories: ["Criolla", "Tradicional", "Peruano", "Bar & Grill","Selva"],
            priceLevel: .medium,
            isFeatured: false
        )
    }
}

