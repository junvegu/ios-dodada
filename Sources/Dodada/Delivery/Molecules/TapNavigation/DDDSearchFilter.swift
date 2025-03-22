//
//  File.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 17/03/25.
//

import SwiftUI
import MapKit

public struct DDDSearchFiltersView: View {
    @State private var searchText: String = ""
    
    public let placeholder: String
    public let filters: [String]
    public let onSearch: (String) -> Void
    
    public init(placeholder: String, filters: [String], onSearch: @escaping (String) -> Void) {
        self.placeholder = placeholder
        self.filters = filters
        self.onSearch = onSearch
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            searchBar
            filterScrollView
            
                
        }.padding(.horizontal, 16)
            .padding(.bottom, 10)
        .background(.white)
    }
    
    private var searchBar: some View {
        HStack {
            DDDIcon(.search)
            
            TextField(placeholder, text: $searchText, onCommit: {
                onSearch(searchText)
            })
            .textFieldStyle(PlainTextFieldStyle())
            .applyTextStyle()
            
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .onTapGesture {
                    searchText = ""
                }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
    }
    
    private var filterScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(filters, id: \ .self) { filter in
                    FilterButton(title: filter)
                }
            }
            .padding(.horizontal)
        }
    }
}

public struct FilterButton: View {
    let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Button(action: {}) {
            Text(title)
                .applyTextStyle()
            DDDIcon(.chevronDown)
            
        }.padding(8)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
            .background(Color.white)
            .cornerRadius(8)
    }
}

private extension View {
    func applyTextStyle() -> some View {
        self.apply(token: .callOut)
            .foregroundColor(.black)
    }
}

#Preview {
    DDDSearchFiltersView(
        placeholder: "Buscar...",
        filters: ["Facilidades", "Precio", "Horario", "Ordenar","Cocinas", "Calificación"],
        onSearch: { _ in }
    )
    .padding()
}

#Preview ("map") {
    struct DDDSearchFiltersMapPreview: View {
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -12.0460, longitude: -77.0390),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )

        var body: some View {
            ZStack {
                Map(coordinateRegion: $region)
                    .ignoresSafeArea()
                
                VStack {
                    DDDSearchFiltersView(
                        placeholder: "Buscar...",
                        filters: ["Facilidades", "Precio", "Horario", "Ubicación", "Tipo"],
                        onSearch: { _ in }
                    )
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }

    return DDDSearchFiltersMapPreview()
}

