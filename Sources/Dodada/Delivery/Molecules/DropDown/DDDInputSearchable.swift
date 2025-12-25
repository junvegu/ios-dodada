//
//  Untitled.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 11/05/25.
//
import SwiftUI

/// A searchable input field component with modal search support.
/// Allows selecting an item from a list using a built-in search bar.
/// Can be customized with label styles, validation rules, and messages.
public struct DDDInputSearchable<T: Identifiable & CustomStringConvertible & Equatable>: View {
    
    // MARK: - Dependencies
    @ObservedObject var viewModel: DropdownFieldViewModel<T>
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var isPresented = false
    @State private var searchText: String = ""
    
    // MARK: - Configurable properties
    private let label: String
    private let labelStyle: InputLabelStyle
    private let message: Message?
    private let messageHeight: Binding<CGFloat>
    private let isRequired: Bool
    private let requiredMessage: String?
    private let state: InputState
    
    // MARK: - View
    public var body: some View {
        let showValidationError = isRequired && viewModel.selected == nil
        let effectiveMessage: Message? = {
            if showValidationError {
                return .error(requiredMessage ?? "El \(label.lowercased()) es obligatorio")
            }
            return message
        }()

        FieldWrapper(labelText, message: effectiveMessage, messageHeight: messageHeight) {
            DDDInputContent(
                state: state,
                label: compactLabel,
                message: effectiveMessage,
                isFocused: isPresented,
                value: .constant(viewModel.selected?.description ?? "")
            ) {
                buildSearchableButton()
            }
        }
        .sheet(isPresented: $isPresented) {
            buildSearchableModal()
        }
    }
    
    // MARK: - Main Button
    private func buildSearchableButton() -> some View {
        Button {
            isPresented = true
        } label: {
            HStack {
                Text(viewModel.selected?.description ?? viewModel.placeholder)
                    .foregroundColor(viewModel.selected == nil ? .gray : viewModel.state.textColor)
                    .apply(token: viewModel.state.textStyle.token, weight: viewModel.state.textStyle.weight)

                Spacer()
                DDDIcon(.chevronDown, iconColor: viewModel.state.textColor)
            }
            .padding(.horizontal)
        }
        .disabled(!isEnabled)
    }
    
    // MARK: - Searchable Sheet Modal
    private func buildSearchableModal() -> some View {
        NavigationView {
            List(filteredOptions) { item in
                Button {
                    viewModel.selected = item
                    viewModel.searchText = item.description
                    isPresented = false
                } label: {
                    Text(item.description)
                        .apply(token: .callOut, weight: .regular)
                        .foregroundStyle(.black)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText, prompt: "Buscar...")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.placeholder)
                        .apply(token: .headline, weight: .bold)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }

    // MARK: - Filtered Options
    private var filteredOptions: [T] {
        guard !searchText.isEmpty else { return viewModel.options }
        return viewModel.options.filter {
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    // MARK: - Computed Labels
    private var labelText: String {
        labelStyle == .default ? label : ""
    }

    private var compactLabel: String {
        labelStyle == .compact ? label : ""
    }
}

// MARK: - Public Initializer

public extension DDDInputSearchable {
    
    /// Creates a new searchable input field using a dropdown ViewModel.
    ///
    /// - Parameters:
    ///   - label: The label to display above the input.
    ///   - viewModel: A ViewModel that contains the selectable options and current selection.
    ///   - labelStyle: Label display style, `.default` or `.compact`.
    ///   - message: Optional help or error message shown below the field.
    ///   - messageHeight: Binding for dynamic layout based on message height.
    ///   - isRequired: Whether the field is mandatory.
    ///   - state: Input state for visual styling (default, error, etc.).
    ///   - requiredMessage: Optional custom message for required field validation.
    init(
        label: String,
        viewModel: DropdownFieldViewModel<T>,
        labelStyle: InputLabelStyle = .default,
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0),
        isRequired: Bool = false,
        state: InputState = .default,
        requiredMessage: String? = nil
    ) {
        self.label = label
        self.viewModel = viewModel
        self.labelStyle = labelStyle
        self.message = message
        self.messageHeight = messageHeight
        self.isRequired = isRequired
        self.requiredMessage = requiredMessage
        self.state = state
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
                placeholder: "Selecciona país ..",
                selected: $selectedCountry,
                description: "País de residencia"
            )

            return VStack(spacing: 24) {
                DDDInputSearchable(label: "Country", viewModel: viewModel)

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
