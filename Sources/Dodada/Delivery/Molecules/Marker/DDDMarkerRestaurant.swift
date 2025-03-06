//
//  DDDMarkerRestaurant.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/02/25.
//

import SwiftUI
import MapKit

struct DDDMarkerRestaurant: View {
    let image: Image
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
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: markerSize * 0.6, height: markerSize * 0.6)
                )
            
            // Badge(el icono: top_one, new, trending)
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
    let image: Image
    let type: MarkerType
}

let restaurantLocations = [
    RestaurantLocation(
        coordinate: CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428),
        image: Image(.aquisito),
        type: .new
    ),
    RestaurantLocation(
        coordinate: CLLocationCoordinate2D(latitude: -12.0455, longitude: -77.0353),
        image: Image(.aquisito),
        type: .top_one
    ),
    RestaurantLocation(
        coordinate: CLLocationCoordinate2D(latitude: -12.0470, longitude: -77.0400),
        image: Image(.aquisito),
        type: .trading
    )
]

#Preview {
    struct DDDMarkerRestaurantMapPreview: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -12.0460, longitude: -77.0390),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )

        var body: some View {
            Map(coordinateRegion: $region, annotationItems: restaurantLocations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    DDDMarkerRestaurant(
                        image: location.image,
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
        DDDMarkerRestaurant(image: Image(.aquisito), type: .new)
        DDDMarkerRestaurant(image: Image(.aquisito), type: .top_one)
        DDDMarkerRestaurant(image: Image(.aquisito), type: .trading)
    }
}
