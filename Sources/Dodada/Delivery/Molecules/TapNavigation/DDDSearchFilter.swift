//
//  DDDSearchFilters.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 17/03/25.
//

import SwiftUI
import MapKit

public struct DDDSearchFilters: View {
    @State private var searchText: String = ""
    @State private var selectedOptions: [String: String?]
    
    public let placeholder: String
    public let filters: [FilterItem]
    public let onSearch: (String) -> Void
    public let onFilterChange: (String, String?) -> Void

    public init(placeholder: String, filters: [FilterItem], onSearch: @escaping (String) -> Void, onFilterChange: @escaping (String, String?) -> Void) {
        self.placeholder = placeholder
        self.filters = filters
        self.onSearch = onSearch
        self.onFilterChange = onFilterChange
        self._selectedOptions = State(initialValue: Dictionary(uniqueKeysWithValues: filters.map { ($0.title, nil) }))
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
                        onSearch("")
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
                            get: { selectedOptions[filter.title] ?? nil },
                            set: {
                                selectedOptions[filter.title] = $0
                                onFilterChange(filter.title, $0)
                            }
                        )
                    )
                }
            }
        }
    }
}

/// Modelo de los filtros
public struct FilterItem: Identifiable {
    public let id: UUID
    public let title: String
    public let options: [String]

    public init(title: String, options: [String]) {
        self.id = UUID()
        self.title = title
        self.options = options
    }
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
    DDDSearchFilters(
        placeholder: "Buscar...",
        filters: [
            FilterItem(title: "Categoría", options: ["Tecnología", "Ropa", "Hogar"]),
            FilterItem(title: "Tipo", options: ["Electrónica", "Moda", "Casa"]),
            FilterItem(title: "Disponibilidad", options: ["En stock", "Agotado"])
        ],
        onSearch: { query in
            print("Búsqueda: \(query)")
        },
        onFilterChange: { title, option in
            print("Filtro cambiado: \(title) -> \(option ?? "Ninguno")")
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
                    DDDSearchFilters(
                        placeholder: "Buscar...",
                        filters: [
                            FilterItem(title: "Facilidades", options: ["Lejanía", "Cercanía", "Otras"]),
                            FilterItem(title: "Precio", options: ["$", "$$", "$$$"]),
                            FilterItem(title: "Horario", options: ["Diurno", "Nocturno", "Vampiro"]),
                            FilterItem(title: "Ordenar", options: ["Menor a mayor", "Mayor a menor"]),
                            FilterItem(title: "Cocinas", options: ["Criolla", "Selvática", "Marina"]),
                            FilterItem(title: "Calificación", options: ["1", "2", "3", "4", "5"])
                        ],
                        onSearch: { query in
                            print("Búsqueda: \(query)")
                        },
                        onFilterChange: { title, option in
                            print("Filtro cambiado: \(title) -> \(option ?? "Ninguno")")
                        }
                    )
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }

    return DDDSearchFiltersMapPreview()
}

