//
//  DDDMarkerRestaurant.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/02/25.
//

import SwiftUI
import MapKit
import SDWebImageSwiftUI

public struct DDDMarkerRestaurant: View {
    let imageURL: URL?
    let type: MarkerType?
    let isHighLight: Bool
    
    private let markerSize: CGFloat = 64
    
    public init(imageURL: URL?, type: MarkerType? = nil, isHighLight: Bool = false) {
        self.imageURL = imageURL
        self.type = type
        self.isHighLight = isHighLight
    }
    
    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Circle()
                .fill(Color.white)
                .frame(width: markerSize, height: markerSize)
                .shadow(radius: 4)
                .overlay(
                    DDDAsyncImage(url: imageURL)
                        .frame(width: markerSize, height: markerSize)
                        .scaledToFit()
                        .clipShape(Circle())
                    
                    
                )
                .overlay(
                    Circle()
                        .stroke(
                            Asset.Colors.primary.swiftUIColor,
                            lineWidth: isHighLight ? 3 : 0
                        )
                )
            
            if let type {
                Circle()
                    .fill(type.badgeColor)
                    .frame(width: markerSize * 0.3, height: markerSize * 0.3)
                    .overlay(
                        DDDIcon(type.Badge, iconColor: .white)
                            .frame(width: markerSize * 0.18, height: markerSize * 0.18)
                            .iconSize(custom: .small)
                    )
                    .offset(y: markerSize * 0.03)
            }
        }
    }
}

// Estructura y datos fuera del #Preview
struct RestaurantLocation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let imageURL: URL?
    let type: MarkerType
}

let restaurantLocations = [
    RestaurantLocation(
        coordinate: CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428),
        imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"),
        type: .new
    ),
    RestaurantLocation(
        coordinate: CLLocationCoordinate2D(latitude: -12.0455, longitude: -77.0353),
        imageURL: URL(string: "https://rukminim2.flixcart.com/image/480/640/kuyf8nk0/poster/n/l/y/medium-rose-blackpink-blackpink-rose-kpop-on-the-ground-park-original-imag7ys9fsw8cmwy.jpeg?q=90"),
        type: .top_one
    ),
    RestaurantLocation(
        coordinate: CLLocationCoordinate2D(latitude: -12.0470, longitude: -77.0400),
        imageURL: URL(string: "https://example.com/image3.jpg"),
        type: .trading
    )
]

#Preview("Marker en Mapa") {
    struct DDDMarkerRestaurantMapPreview: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -12.0460, longitude: -77.0390),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )

        var body: some View {
            Map(coordinateRegion: $region, annotationItems: restaurantLocations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    DDDMarkerRestaurant(
                        imageURL: location.imageURL,
                        type: location.type
                    )
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    return DDDMarkerRestaurantMapPreview()
}

#Preview {
    VStack(spacing: 20){
        DDDMarkerRestaurant(imageURL: URL(string: "https://i.pinimg.com/736x/95/20/4f/95204f0745253b7fe66474ecc09b7534.jpg"), isHighLight: true)
        DDDMarkerRestaurant(imageURL: URL(string: "https://rukminim2.flixcart.com/image/480/640/kuyf8nk0/poster/n/l/y/medium-rose-blackpink-blackpink-rose-kpop-on-the-ground-park-original-imag7ys9fsw8cmwy.jpeg?q=90"), type: .top_one)
        DDDMarkerRestaurant(imageURL: URL(string: "https://s.yimg.com/ny/api/res/1.2/QwXf3bUzCETetIfD6sXnxw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyNDI7aD0xNTIzO2NmPXdlYnA-/https://media.zenfs.com/en/where_is_the_buzz_814/f9413375386b12554013607cb214be66"), type: .trading)
    }
}

