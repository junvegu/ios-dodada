//
//  DDDMarkerRestaurant.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/02/25.
//

import SwiftUI
import MapKit
import SDWebImageSwiftUI

struct DDDMarkerRestaurant: View {
    let imageURL: URL?
    let type: MarkerType
    
    private let markerSize: CGFloat = 64
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Marker para la Imagen
            Circle()
                .fill(Color.white)
                .frame(width: markerSize, height: markerSize)
                .shadow(radius: 4)
                .overlay(
                    WebImage(url: imageURL)
                        .resizable()
                        .scaledToFit()
                        //.frame(width: markerSize * 0.9, height: markerSize * 0.9)
                        .clipShape(Circle())
                        .placeholder(when: true) {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.6))
                                ProgressView()
                            }
                        }
                    
                    
                )
            
            // Badge (el icono: top_one, new, trending)
            Circle()
                .fill(type.badgeColor)
                .frame(width: markerSize * 0.3, height: markerSize * 0.3)
                .overlay(
                    DDDIcon(type.Badge)
                        .frame(width: markerSize * 0.18, height: markerSize * 0.18)
                        .iconColor(.white)
                        .iconSize(custom: .small)
                )
                .offset(y: markerSize * 0.03)
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
        imageURL: URL(string: "https://example.com/image2.jpg"),
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
        DDDMarkerRestaurant(imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"), type: .new)
        DDDMarkerRestaurant(imageURL: URL(string: "https://example.com/image2.jpg"), type: .top_one)
        DDDMarkerRestaurant(imageURL: URL(string: "https://example.com/image3.jpg"), type: .trading)
    }
}
