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
final class DropdownFieldViewModel<T: Identifiable & CustomStringConvertible>: ObservableObject {
    @Published var options: [T]
    @Published var placeholder: String
    @Published var description: String?
    @Published var errorMessage: String?

    // El valor seleccionado se maneja desde fuera (vía binding)
    @Binding var selected: T?
    @Published var state: InputStyles = .default

    init(
        options: [T],
        placeholder: String,
        selected: Binding<T?>,
        description: String? = nil,
        errorMessage: String? = nil,
        state: InputStyles? = nil
    ) {
        self._selected = selected
        self.options = options
        self.placeholder = placeholder
        self.description = description
        self.errorMessage = errorMessage
        self.state = state ?? .default
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
    
    public var body: some View {
         VStack(alignment: .leading, spacing: 4) {
             Menu {
                 ForEach(viewModel.options) { option in
                     Button(option.description) {
                         withAnimation {
                             viewModel.selected = option
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
                 .padding()
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

struct DropdownField_Previews: PreviewProvider {
    struct Country: Identifiable, CustomStringConvertible, Equatable {
        let id = UUID()
        let name: String

        var description: String { name }
    }
    struct PreviewWrapper: View {
        @State private var selectedCountry: Country? = nil
        @State private var showError = false
        @State private var isDisabled = false

        private let countries = [
            Country(name: "Perú"),
            Country(name: "Chile"),
            Country(name: "México")
        ]

        var body: some View {
            let viewModel = DropdownFieldViewModel<Country>(
                options: countries,
                placeholder: "Selecciona país",
                selected: $selectedCountry,
                description: "País de residencia"
            )

            viewModel.errorMessage = showError && selectedCountry == nil ? "Este campo es obligatorio" : nil

            return VStack(spacing: 24) {
                DDDInputDropDown(viewModel: viewModel)
                    .disabled(isDisabled)

                HStack {
                    Button("Validar") {
                        withAnimation {
                            showError = true
                        }
                    }

                    Button("Reset") {
                        withAnimation {
                            selectedCountry = nil
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

    static var previews: some View {
        PreviewWrapper()
            .previewLayout(.sizeThatFits)
    }
}
