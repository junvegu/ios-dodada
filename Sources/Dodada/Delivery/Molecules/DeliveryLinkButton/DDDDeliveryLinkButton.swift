//
//  DDDDeliveryLinkButton.swift
//  Dodada
//

import SwiftUI

public struct DDDDeliveryLinkButton: View {

    // MARK: - Properties

    private let thumbnailURL: String?
    private let type: String
    private let action: () -> Void

    // MARK: - Init

    public init(
        thumbnailURL: String?,
        type: String,
        action: @escaping () -> Void
    ) {
        self.thumbnailURL = thumbnailURL
        self.type = type
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            content
        }
        .buttonStyle(DeliveryLinkPillStyle())
    }

    // MARK: - Content

    @ViewBuilder
    private var content: some View {
        DDDAsyncImage(urlString: thumbnailURL) {
            Text(type.capitalized)
                .textStyle(.bodyBold)
                .foregroundColor(.black)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
        }
        .scaledToFit()
        .padding(6)
    }
}

// MARK: - Button Style

private struct DeliveryLinkPillStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 70, height: 30)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(Color.secondaryValue200, lineWidth: 0.5)
            )
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.30), radius: 2, x: 0, y: 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {

        Text("Con thumbnail").font(.caption).foregroundColor(.gray)

        HStack(spacing: 10) {
            DDDDeliveryLinkButton(
                thumbnailURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Rappi_textlogo.svg/3840px-Rappi_textlogo.svg.png",
                type: "rappi",
                action: {}
            )
            DDDDeliveryLinkButton(
                thumbnailURL: "https://vectorseek.com/wp-content/uploads/2024/02/Pedidos-Ya-Logo-Vector.svg-.png",
                type: "pedidos_ya",
                action: {}
            )
            DDDDeliveryLinkButton(
                thumbnailURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Uber_Eats_2018_logo.svg/3840px-Uber_Eats_2018_logo.svg.png",
                type: "uber_eats",
                action: {}
            )
        }

        Text("Sin thumbnail (fallback type)").font(.caption).foregroundColor(.gray)

        HStack(spacing: 10) {
            DDDDeliveryLinkButton(thumbnailURL: nil, type: "rappi",      action: {})
            DDDDeliveryLinkButton(thumbnailURL: nil, type: "uber_eats",  action: {})
            DDDDeliveryLinkButton(thumbnailURL: nil, type: "pedidos_ya", action: {})
        }
    }
    .padding()
    .background(Color(hex: "#F4F4F4"))
    .onAppear { Dodada.registerFonts() }
}
