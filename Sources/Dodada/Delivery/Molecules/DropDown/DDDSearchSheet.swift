//
//  Untitled.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 11/05/25.
//
import SwiftUI
public struct DDDSearchSheet<T: Identifiable & CustomStringConvertible & Equatable>: View {
    @ObservedObject var viewModel: DropdownFieldViewModel<T>
    @Binding var isPresented: Bool
    @State private var searchText: String = ""

    public var body: some View {
        NavigationView {
            List(filteredItems) { item in
                Button {
                    viewModel.selected = item
                    isPresented = false
                } label: {
                    Text(item.description)
                }
            }
            .searchable(text: $searchText, prompt: "Buscar...")
            .navigationTitle("Selecciona una opción")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium, .large])
    }

    private var filteredItems: [T] {
        guard !searchText.isEmpty else { return viewModel.options }
        return viewModel.options.filter { $0.description.localizedCaseInsensitiveContains(searchText) }
    }
}
