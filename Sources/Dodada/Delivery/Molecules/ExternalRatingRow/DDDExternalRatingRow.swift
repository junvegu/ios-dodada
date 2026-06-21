//
//  DDDExternalRatingRow.swift
//  Dodada
//

import SwiftUI

public struct DDDExternalRatingRow<Icon: View>: View {

    // MARK: - Properties

    private let providerName: String
    private let rating: Double
    private let reviewsText: String
    private let lastSyncTitle: String
    private let lastSyncValue: String
    @ViewBuilder private let icon: Icon

    // MARK: - Init

    public init(
        providerName: String,
        rating: Double,
        reviewsText: String,
        lastSyncTitle: String,
        lastSyncValue: String,
        @ViewBuilder icon: () -> Icon
    ) {
        self.providerName = providerName
        self.rating = rating
        self.reviewsText = reviewsText
        self.lastSyncTitle = lastSyncTitle
        self.lastSyncValue = lastSyncValue
        self.icon = icon()
    }

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .center, spacing: .spacingSm) {
            icon
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: .spacingXs) {
                Text(providerName)
                    .textStyle(.footnoteBold)
                    .foregroundColor(.secondaryValue500)

                HStack(spacing: .spacingXs) {
                    Text(String(format: "%.1f", rating))
                        .textStyle(.caption1Bold)
                        .foregroundColor(.secondaryValue500)

                    DDDRatingView(rating: .constant(Int(rating)))
                }

                Text(reviewsText)
                    .textStyle(.caption1Regular)
                    .foregroundColor(.secondaryValue500)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: .spacingSm) {
                Text(lastSyncTitle)
                    .textStyle(.caption2Regular)
                    .foregroundColor(.secondaryValue400)

                Text(lastSyncValue)
                    .textStyle(.caption2Bold)
                    .foregroundColor(.secondaryValue400)
            }
        }
    }
}

// MARK: - Preview

struct DDDExternalRatingRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: .spacingLg) {
            DDDExternalRatingRow(
                providerName: "Google Maps",
                rating: 4.6,
                reviewsText: "(123 reseñas)",
                lastSyncTitle: "Última actualización",
                lastSyncValue: "Hace 3 días"
            ) {
                Image(systemName: "map.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blue)
            }

            Divider()

            DDDExternalRatingRow(
                providerName: "TripAdvisor",
                rating: 2.0,
                reviewsText: "(850 reseñas)",
                lastSyncTitle: "Última actualización",
                lastSyncValue: "Hace 2 días"
            ) {
                Image(systemName: "bird.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}
