//
//  RouteItem.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//

import SwiftUI

public struct RouteCardItem: View {
    let title: String
    let stops: Int
    let distanceText: String
    let durationText: String
    let rating: Double
    let imageURLs: [URL?]
    let extraCount: Int
    
    public init(
        title: String,
        stops: Int,
        distanceText: String,
        durationText: String,
        rating: Double,
        imageURLs: [URL?],
        extraCount: Int
    ) {
        self.title = title
        self.stops = stops
        self.distanceText = distanceText
        self.durationText = durationText
        self.rating = rating
        self.imageURLs = imageURLs
        self.extraCount = extraCount
    }

    public var body: some View {
        VStack(spacing: 0) {
            collageHeader
            content
                .padding(.spacingXs)
            
            Spacer()
        }
        .frame(width: 180)
        .frame(maxHeight: 240)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: .radiusMd, style: .continuous))
        .shadow(color: Color.black.opacity(0.10), radius: 9, x: 0, y: 4)
    }

    // MARK: - Header (2x2)

    private var collageHeader: some View {
        ZStack(alignment: .topTrailing) {
            HStack(spacing: 1) {
                VStack(spacing: 1) {
                    collageCell(urlAt: 0)
                    collageCell(urlAt: 2)
                }
                VStack(spacing: 2) {
                    collageCell(urlAt: 1)
                    collageCell(urlAt: 3, showsExtraOverlay: true)
                }
            }
            .clipped()

            ratingPill
                .padding(10)
        }
    }

    private func collageCell(urlAt index: Int, showsExtraOverlay: Bool = false) -> some View {
        ZStack {
            DDDAsyncImage(url: imageURLs[safe: index] ?? nil)
                .clipped()
            
            if showsExtraOverlay, extraCount > 0 {
                Color.black.opacity(0.30)
                Text("+\(extraCount)")
                    .textStyle(.bodyRegular)
                    .foregroundStyle(.white)
            }
        }
        .frame(width: 90, height: 60)
        .clipped()
    }

    private var ratingPill: some View {
        HStack(spacing: .spacingTwoXs) {
            DDDIcon(.contentStar, color: .secondaryValue200)
            Text(String(format: "%.1f", rating))
                .textStyle(.subheadlineBold)
                .foregroundStyle(Color.black)
        }
        .padding(.horizontal, .spacingXs)
        .padding(.vertical, .spacingTwoXs)
        .background(Color.warningValue500)
        .clipShape(Capsule())
    }

    // MARK: - Content

    private var content: some View {
        VStack(alignment: .leading, spacing: .spacingXs) {
            Text(title)
                .textStyle(.headlineBold)
                .foregroundStyle(Color.secondaryValue500)
                .lineLimit(2)
                .fixedSize()
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: .spacingTwoXs) {
                DDDIcon(.restaurantFood, color: .primaryValue500)
                
                Text(stops.description)
                    .textStyle(.subheadlineRegular)
            }
            HStack(spacing: .spacingTwoXs) {
                DDDIcon(.locationMapPin, color: .primaryValue500)
                
                Text(distanceText)
                    .textStyle(.subheadlineRegular)
                    .foregroundStyle(Color.successValue200)
                    .padding(.horizontal, .spacingTwoXs)
                    .padding(.vertical, .spacingTwoXs)
                    .background(Color.successValue400)
                    .clipShape(RoundedRectangle(cornerRadius: .radiusSm, style: .continuous))

                Spacer()

                DDDIcon(.timeClock, color: .primaryValue500)
                
                Text(durationText)
                    .textStyle(.subheadlineRegular)
                    .foregroundStyle(Color.secondaryValue500)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}


// MARK: - Safe index helper

private extension Array {
    subscript(safe index: Int) -> Element? {
        (startIndex..<endIndex).contains(index) ? self[index] : nil
    }
}


struct RouteCardItem_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ScrollView(.horizontal) {
                LazyHStack(spacing: .spacingLg) {
                    ForEach(0..<5) { index in
                        RouteCardItem(
                            title: "Ruta del ceviche",
                            stops: 4,
                            distanceText: "20Km",
                            durationText: "3h",
                            rating: 4.2,
                            imageURLs: randomImageURLs(seed: index),
                            extraCount: 4
                        )
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .previewDisplayName("List")
        }
    }

    // MARK: - Mocks

    static func randomImageURLs(seed: Int) -> [URL] {
        (0..<4).compactMap { i in
            URL(
                string: "https://picsum.photos/seed/\(seed * 10 + i)/400/300"
            )
        }
    }
}
