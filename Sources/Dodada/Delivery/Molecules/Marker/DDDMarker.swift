//
//  DDDMarker.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/02/25.
//

import SwiftUI
import MapKit

public struct DDDMarker: View {
    let size: MarkerSize
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: size.size, height: size.size)
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 6)
                )
            
            DDDIcon(.aquisito)
                .iconColor(.red)
        }
    }
}

#Preview("Marker Preview") {
    VStack(spacing: 20) {
        DDDMarker(size: .medium)
        DDDMarker(size: .small)
        DDDMarker(size: .tiny)
    }
}

#Preview("Marker in Map") {
    struct DDDMarkerMapPreview: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        
        struct MarkerLocation: Identifiable {
            let id = UUID()
            let coordinate: CLLocationCoordinate2D
            let size: MarkerSize
        }

        let locations: [MarkerLocation] = [
            MarkerLocation(coordinate: CLLocationCoordinate2D(latitude: -12.0464, longitude: -77.0428), size: .medium),
            MarkerLocation(coordinate: CLLocationCoordinate2D(latitude: -12.0455, longitude: -77.0353), size: .small),
            MarkerLocation(coordinate: CLLocationCoordinate2D(latitude: -12.0445, longitude: -77.0380), size: .tiny)
        ]
        
        var body: some View {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    DDDMarker(size: location.size)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    return DDDMarkerMapPreview()
}
