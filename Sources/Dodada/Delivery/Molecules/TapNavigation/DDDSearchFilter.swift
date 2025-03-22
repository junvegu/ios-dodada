//
//  DDDSearchFilters.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 17/03/25.
//

import SwiftUI
import MapKit

public struct DDDSearchFiltersView: View {
    @State private var searchText: String = ""
    @State private var selectedOptions: [String: String?] = [:]
    
    public let placeholder: String
    public let filters: [FilterItem]
    public let onSearch: (String) -> Void

    public init(placeholder: String, filters: [FilterItem], onSearch: @escaping (String) -> Void) {
        self.placeholder = placeholder
        self.filters = filters
        self.onSearch = onSearch
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            searchBar
            filterScrollView
        }
        .padding(.horizontal, 16)
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
            
            if !searchText.isEmpty {
                DDDIcon(.x)
                    .onTapGesture {
                        searchText = ""
                    }
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 8).stroke(searchText.isEmpty ? Color(asset: Color.secondary200) : Color(asset: Color.secondary500)))
    }
    
    private var filterScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters) { filter in
                    FilterButton(
                        title: filter.title,
                        options: filter.options,
                        selectedOption: Binding(
                            get: { selectedOptions[filter.title] ?? nil }, // Permite que sea nil
                            set: { selectedOptions[filter.title] = $0 }
                        )
                    )
                }
            }
        }
    }
}

///Orden de los filtros
public struct FilterItem: Identifiable {
    public let id: Int
    public let title: String
    public let options: [String]
}


public struct FilterButton: View {
    let title: String
    let options: [String]
    @Binding var selectedOption: String?
    
    public var body: some View {
        Button(action: {}) {
            DDDInputDropDown(placeholder: title, state: .default, options: options, selectedOption: $selectedOption)
        }
    }
}

private extension View {
    func applyTextStyle() -> some View {
        self.apply(token: .callOut)
            .foregroundColor(Color(asset: Color.secondary400))
    }
}

// Preview normal
#Preview {
    DDDSearchFiltersView(
        placeholder: "Buscar...",
        filters: [
            FilterItem(id: 1, title: "Categoría", options: ["Tecnología", "Ropa", "Hogar"]),
            FilterItem(id: 2, title: "Tipo", options: ["Electrónica", "Moda", "Casa"]),
            FilterItem(id: 3, title: "Disponibilidad", options: ["En stock", "Agotado"])
        ],
        onSearch: { query in
            print("Búsqueda: \(query)")
        }
    )
}

// Preview con mapa
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
                        filters: [
                            FilterItem(id: 1, title: "Facilidades", options: ["Lejanía", "Cercanía", "Otras"]),
                            FilterItem(id: 2, title: "Precio", options: ["$", "$$", "$$$"]),
                            FilterItem(id: 3, title: "Horario", options: ["Diurno", "Nocturno", "Vampiro"]),
                            FilterItem(id: 4, title: "Ordenar", options: ["Menor a mayor", "Mayor a menor"]),
                            FilterItem(id: 5, title: "Cocinas", options: ["Criolla", "Selvática", "Marina"]),
                            FilterItem(id: 6, title: "Calificación", options: ["1", "2", "3", "4", "5"])
                        ],
                        onSearch: { query in
                            print("Búsqueda: \(query)")
                        }
                    )
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }

    return DDDSearchFiltersMapPreview()
}

