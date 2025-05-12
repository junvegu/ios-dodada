//
//  Untitled.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 11/05/25.
//

import SwiftUI

public struct DDDInputSearchable<T: Identifiable & CustomStringConvertible & Equatable>: View {
    @ObservedObject var viewModel: DropdownFieldViewModel<T>
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var isPresented = false
    @State private var searchText: String = ""

    public init(viewModel: DropdownFieldViewModel<T>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.placeholder)
                    .apply(token: .footNote, weight: .regular)
                      .scaleEffect((viewModel.selected != nil || isPresented) ? 1.0 : 0.0001)
                      .opacity((viewModel.selected != nil || isPresented) ? 1.0 : 0.0)
                      .offset(y: (viewModel.selected != nil || isPresented) ? 0 : 16)
                      .animation(.easeInOut(duration: 0.2), value: isPresented)
            Button {
                isPresented = true
            } label: {
                HStack {
                    Text(viewModel.selected?.description ?? viewModel.placeholder)
                        .foregroundColor(viewModel.selected == nil ? .gray : viewModel.state.textColor)
                        .apply(token: viewModel.state.textStyle.token, weight: viewModel.state.textStyle.weight)
                    Spacer()
                    DDDIcon(.chevronDown)
                        .iconColor(viewModel.state.textColor)
                }
                .padding(.horizontal)
                .padding(.vertical, 16)
                .background(
                    (!isEnabled ? Asset.Colors.secondary200.swiftUIColor.opacity(0.4) : .white)
                        .animation(.easeInOut(duration: 0.2), value: isEnabled)
                )
                .cornerRadius(.regularCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: .regularCornerRadius)
                        .stroke(viewModel.state.borderColor, lineWidth: 2)
                )
            }
            .disabled(!isEnabled)

            if let error = viewModel.errorMessage, !error.isEmpty {
                Text(error)
                    .apply(token: .caption1)
                    .foregroundColor(.red)
            } else if let desc = viewModel.description {
                Text(desc)
                    .apply(token: .caption1)
                    .foregroundColor(.gray)
            }
        }
        .sheet(isPresented: $isPresented) {
            NavigationView {
                List(filteredOptions) { item in
                    Button {
                        viewModel.selected = item
                        viewModel.searchText = item.description
                        isPresented = false
                    } label: {
                        Text(item.description)
                            .apply(token: .callOut, weight: .regular)
                            .foregroundStyle(Color.black)
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: "Buscar...")
                .navigationTitle("Selecciona una opción")
                .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
    }

    private var filteredOptions: [T] {
        guard !searchText.isEmpty else { return viewModel.options }
        return viewModel.options.filter {
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }
}


struct DDDInputSearchableSheet_Previews: PreviewProvider {
    struct Country: Identifiable, CustomStringConvertible, Equatable {
        let id = UUID()
        let name: String
        var description: String { name }
    }

    struct PreviewWrapper: View {
        @State private var selectedCountry: Country? = nil

        private let countries = [
            Country(name: "Perú"),
            Country(name: "Chile"),
            Country(name: "México"),
            Country(name: "Argentina"),
            Country(name: "Colombia"),
            Country(name: "España"),
            Country(name: "Estados Unidos"),
            Country(name: "Alemania"),
            Country(name: "Francia"),
            Country(name: "Italia")
        ]

        var body: some View {
            let viewModel = DropdownFieldViewModel<Country>(
                options: countries,
                placeholder: "Selecciona país",
                selected: $selectedCountry,
                description: "País de residencia"
            )

            return VStack(spacing: 24) {
                DDDInputSearchable(viewModel: viewModel)

                if let selected = selectedCountry {
                    Text("País seleccionado: \(selected.name)")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }

                Button("Reset") {
                    selectedCountry = nil
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }

    static var previews: some View {
        PreviewWrapper()
            .previewLayout(.sizeThatFits)
    }
}
