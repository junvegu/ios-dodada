//
//  DDDInputDropDown.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 20/03/25.
//

import SwiftUI

public enum InputStyles {
    case `default`, focus, error, disabled
    
    /// Color del borde basado en el estado
    public var borderColor: Color {
        switch self {
        case .default: return Color(asset: Color.secondary200)
        case .focus: return Color(asset: Color.secondary500)
        case .error: return Color(asset: Color.error)
        case .disabled: return Color(asset: Color.secondary200)
        }
    }
    
    /// Color del texto basado en el estado
    public var textColor: Color {
        self == .disabled ? Color(asset: Color.secondary300) : Color(asset: Color.secondary500)
    }
    
    /// Estilo de fuente basado en el estado
    public var textStyle: (token: DDDFontToken, weight: DDDFontToken.Weigth) {
        switch self {
        case .focus: return (.body, .bold)
        case .error: return (.body, .bold)
        case .disabled: return (.body, .regular)
        case .default: return (.body, .regular)
        }
    }
}
final public class DropdownFieldViewModel<T: Identifiable & CustomStringConvertible>: ObservableObject {
    @Published var options: [T]
    @Published var filteredOptions: [T] = []
    @Published var searchText: String = ""
    @Published var placeholder: String
    @Published var description: String?
    @Published var errorMessage: String?

    @Binding var selected: T?
    @Published var state: InputStyles = .default

    let isSearchable: Bool

    public init(
        options: [T],
        placeholder: String,
        selected: Binding<T?>,
        description: String? = nil,
        errorMessage: String? = nil,
        state: InputStyles? = nil,
        isSearchable: Bool = true
    ) {
        self._selected = selected
        self.options = options
        self.placeholder = placeholder
        self.description = description
        self.errorMessage = errorMessage
        self.state = state ?? .default
        self.isSearchable = isSearchable
        self.searchText = selected.wrappedValue?.description ?? ""
        self.filteredOptions = options
        setupSearchBinding()
    }

    private func setupSearchBinding() {
        guard isSearchable else { return }
        $searchText
            .removeDuplicates()
            .map { [unowned self] text in
                guard !text.isEmpty else { return options }
                return options.filter { $0.description.localizedCaseInsensitiveContains(text) }
            }
            .assign(to: &$filteredOptions)
    }

    var style: InputStyles {
        if errorMessage != nil {
            return .error
        }
        return .default
    }
}


public struct DDDInputDropDown<T: Identifiable & CustomStringConvertible>: View {
    @ObservedObject var viewModel: DropdownFieldViewModel<T>
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var isFocused: Bool = false
    @Namespace private var animationNamespace

    
    public init(viewModel: DropdownFieldViewModel<T>) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !viewModel.placeholder.isEmpty {
                Text(viewModel.placeholder)
                       .apply(token: .footNote, weight: .regular)
                       .scaleEffect((viewModel.selected != nil || isFocused) ? 1.0 : 0.0001)
                       .opacity((viewModel.selected != nil || isFocused) ? 1.0 : 0.0)
                       .offset(y: (viewModel.selected != nil || isFocused) ? 0 : 16)
                       .animation(.easeInOut(duration: 0.2), value: isFocused)
            }
  
            Menu {
                if viewModel.isSearchable {
                    TextField("Buscar...", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                }

                ForEach(viewModel.filteredOptions) { option in
                    Button(option.description) {
                        withAnimation {
                            viewModel.selected = option
                            viewModel.searchText = "" // reset after selection
                        }
                    }
                }
            } label: {
                HStack {
                    Text(viewModel.selected?.description ?? viewModel.placeholder)
                        .foregroundColor(viewModel.selected == nil ? .gray : viewModel.state.textColor)
                        .apply(token: viewModel.state.textStyle.token, weight: viewModel.state.textStyle.weight)

                    Spacer()
                    DDDIcon(.chevronDown)
                        .iconColor(viewModel.state.textColor)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    (!isEnabled ? Asset.Colors.secondary200.swiftUIColor.opacity(0.4) : .white)
                        .animation(.easeInOut(duration: 0.2), value: isEnabled)
                )
                .cornerRadius(.regularCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: .regularCornerRadius)
                        .stroke(
                            isFocused ? viewModel.state.borderColor.opacity(0.9) : viewModel.state.borderColor,
                            lineWidth: isFocused ? 2.5 : 2
                        )
                        .animation(.easeInOut(duration: 0.2), value: isFocused)
                )
            }
            .simultaneousGesture(TapGesture().onEnded {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isFocused = true
                }
            })
            .disabled(!isEnabled)

            Group {
                if let error = viewModel.errorMessage, !error.isEmpty {
                    Text(error)
                        .apply(token: .caption1)
                        .foregroundColor(.red)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .id("error-\(error)")
                } else if let desc = viewModel.description {
                    Text(desc)
                        .apply(token: .caption1)
                        .foregroundColor(.black)
                        .transition(.opacity)
                        .id("desc-\(desc)")
                }
            }
            .animation(.easeInOut(duration: 0.25), value: viewModel.errorMessage)
        }
    }
}
public struct DDDInputAutocomplete<T: Identifiable & CustomStringConvertible & Equatable>: View {
    @ObservedObject var viewModel: DropdownFieldViewModel<T>
    @FocusState private var isFocused: Bool
    @State private var showDropdown = false

    public var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 4) {
                TextField(viewModel.placeholder, text: $viewModel.searchText)
                    .focused($isFocused)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(.regularCornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: .regularCornerRadius)
                            .stroke(viewModel.state.borderColor, lineWidth: 2)
                    )
                    .onTapGesture {
                        showDropdown = true
                    }
                    .onChange(of: viewModel.searchText) { newValue in
                        viewModel.filteredOptions = newValue.isEmpty
                            ? []
                            : viewModel.options.filter {
                                $0.description.localizedCaseInsensitiveContains(newValue)
                            }
                        showDropdown = true
                    }

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

            if isFocused && showDropdown && !viewModel.filteredOptions.isEmpty {
                VStack(spacing: 0) {
                    ForEach(viewModel.filteredOptions) { option in
                        Button {
                            viewModel.selected = option
                            viewModel.searchText = option.description
                            viewModel.filteredOptions = []
                            showDropdown = false
                            isFocused = false
                        } label: {
                            Text(option.description)
                                .padding()
                                .background(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .background(Color.white)
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 2)
                .frame(maxWidth: .infinity)
                .offset(y: 54) // Desplaza justo debajo del TextField
                .zIndex(1)
            }
        }
    }
}

struct DropdownField_Previews: PreviewProvider {
    struct Country: Identifiable, CustomStringConvertible, Equatable {
        let id = UUID()
        let name: String
        var description: String { name }
    }

    struct WorkAreaOption: Identifiable, CustomStringConvertible, Equatable {
        let id = UUID()
        let name: String
        let value: String
        var description: String { name }
    }

    struct PreviewWrapper: View {
        @State private var selectedCountry: Country? = nil
        @State private var selectedWorkArea: WorkAreaOption? = nil
        @State private var showError = false
        @State private var isDisabled = false

        private let countries = [
            Country(name: "Perú"),
            Country(name: "Chile"),
            Country(name: "México")
        ]

        private let workAreas = [
            WorkAreaOption(name: "Administración", value: "administracion"),
            WorkAreaOption(name: "Recursos Humanos", value: "recursos_humanos"),
            WorkAreaOption(name: "Marketing", value: "marketing"),
            WorkAreaOption(name: "Desarrollo de software", value: "desarrollo_software"),
            WorkAreaOption(name: "Ventas", value: "ventas"),
            WorkAreaOption(name: "Atención al cliente", value: "atencion_cliente"),
            WorkAreaOption(name: "Diseño Gráfico", value: "diseno_grafico"),
            WorkAreaOption(name: "Finanzas", value: "finanzas"),
            WorkAreaOption(name: "Data Analytics y/o Science", value: "data"),
            WorkAreaOption(name: "Otro", value: "otro")
        ]

        var body: some View {
            let countryVM = DropdownFieldViewModel<Country>(
                options: countries,
                placeholder: "Selecciona país",
                selected: $selectedCountry,
                description: "País de residencia",
                isSearchable: true
            )

            let workAreaVM = DropdownFieldViewModel<WorkAreaOption>(
                options: workAreas,
                placeholder: "Área de trabajo",
                selected: $selectedWorkArea,
                description: "Selecciona el área donde trabajas"
            )

            countryVM.errorMessage = showError && selectedCountry == nil ? "Este campo es obligatorio" : nil

            return ScrollView {
                VStack(spacing: 24) {
                    DDDInputDropDown(viewModel: countryVM)
                        .disabled(isDisabled)

                    DDDInputDropDown(viewModel: workAreaVM)
                        .disabled(isDisabled)
                    DDDInputAutocomplete(viewModel: DropdownFieldViewModel(
                        options: countries,
                        placeholder: "Buscar país",
                        selected: $selectedCountry,
                        description: "Escribe y selecciona tu país"
                    ))
                    HStack {
                        Button("Validar") {
                            withAnimation {
                                showError = true
                            }
                        }

                        Button("Reset") {
                            withAnimation {
                                selectedCountry = nil
                                selectedWorkArea = nil
                                showError = false
                            }
                        }

                        Button("Toggle Disable") {
                            isDisabled.toggle()
                        }
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
        }
    }

    static var previews: some View {
        PreviewWrapper()
            .previewLayout(.sizeThatFits)
    }
}
