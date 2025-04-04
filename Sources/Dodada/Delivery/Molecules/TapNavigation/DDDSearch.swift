//
//  DDDSearch.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/04/25.
//

import SwiftUI
import MapKit

public struct DDDSearch: View {
    @State private var searchText: String = ""
    
    public let placeholder: String
    public let onSearch: (String) -> Void

    public init(placeholder: String, onSearch: @escaping (String) -> Void) {
        self.placeholder = placeholder
        self.onSearch = onSearch
    }

    public var body: some View {
        VStack{
            searchBar
                .padding(.horizontal, 16)
            Divider()
                .frame(maxWidth: .infinity)
                .background(Color(asset: Color.secondary200))
        }
        .background(.white)
    }

    private var searchBar: some View {
        HStack {
            DDDIcon(.search)
            
            TextField(placeholder, text: $searchText, onCommit: {
                onSearch(searchText)
            })
            .textFieldStyle(PlainTextFieldStyle())

            if !searchText.isEmpty {
                DDDIcon(.x)
                    .onTapGesture {
                        searchText = ""
                        onSearch("")
                    }
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).stroke(searchText.isEmpty ? Color(asset: Color.secondary200) : Color(asset: Color.secondary500)))
    }
}

// Preview normal
#Preview {
    DDDSearch(
        placeholder: "Buscar...",
        onSearch: { query in
            print("Búsqueda: \(query)")
        }
    )
}

#Preview ("map") {
    struct DDDSearchMap: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -12.0460, longitude: -77.0390),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )

        var body: some View {
            ZStack {
                Map(coordinateRegion: $region)
                    .ignoresSafeArea()
                
                VStack {
                    DDDSearch(placeholder: "Buscar") { query in
                        print("Buscando \(query)")
                    }
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }

    return DDDSearchMap()
}


