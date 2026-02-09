//
//  DDDInputDropDown 2.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 17/05/25.
//
import SwiftUI

/// A customizable dropdown input field component for Dodada.
/// Displays a selectable list of options and provides support for:
/// - Label and placeholder styles.
/// - Required field validation.
/// - Help or error messages.
/// - Unified UI styling via FieldWrapper and DDDInputContent.
public struct DDDInputDropDown<T: Identifiable & CustomStringConvertible>: View {

    // MARK: - Environment
    @Environment(\.isEnabled) private var isEnabled: Bool

    // MARK: - Internal State
    @ObservedObject var viewModel: DropdownFieldViewModel<T>
    @State private var isFocused: Bool = false
    @Namespace private var animationNamespace

    // MARK: - Configuration
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
                isFocused: isFocused,
                value: .constant(viewModel.selected?.description ?? "")
            ) {
                buildDropdown()
            }
        }
    }

    // MARK: - Dropdown Builder
    @ViewBuilder
    private func buildDropdown() -> some View {
        Menu {
            ForEach(viewModel.options) { option in
                Button(option.description) {
                    withAnimation {
                        viewModel.selected = option
                        viewModel.searchText = ""
                    }
                }
            }
        } label: {
            HStack {
                Text(viewModel.selected?.description ?? viewModel.placeholder)
                    .foregroundColor(viewModel.selected == nil ? .gray : viewModel.state.textColor)
                    .textStyle(viewModel.state.textStyle)

                Spacer()
                DDDIcon(.chevronsDown, color: .secondaryValue500)
            }
            .padding(.horizontal)
            .cornerRadius(.radiusSm)
        }
        .disabled(!isEnabled)
    }

    // MARK: - Computed Label Styles
    private var labelText: String {
        labelStyle == .default ? label : ""
    }

    private var compactLabel: String {
        labelStyle == .compact ? label : ""
    }
}

// MARK: - Initializer Extension

public extension DDDInputDropDown {
    
    /// Creates a new dropdown input field with custom configuration and a dynamic list of options.
    ///
    /// - Parameters:
    ///   - label: The label to be displayed above the dropdown.
    ///   - viewModel: A `DropdownFieldViewModel` that manages the available options and the current selection.
    ///   - labelStyle: Style to use for the label (`.default` or `.compact`).
    ///   - message: An optional message to display below the dropdown (e.g., help or error).
    ///   - messageHeight: A binding to the calculated message height, used for layout purposes.
    ///   - isRequired: Whether the dropdown selection is mandatory.
    ///   - state: The visual state for styling (`default`, `error`, etc.).
    ///   - requiredMessage: Custom message to show when the field is required and no value is selected.
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

#Preview("DDDInputDropDown States") {
    struct DropdownPreviewView: View {
        @State private var selectedOption1: SampleItem? = nil
        @State private var selectedOption2: SampleItem? = SampleItem(id: 2, name: "Kotlin")
        @State private var selectedOption3: SampleItem? = nil
        @State private var selectedOption4: SampleItem? = nil
        @State private var selectedOption5: SampleItem? = nil

        var body: some View {
            VStack(spacing: 16) {
                DDDInputDropDown(
                    label: "Opción normal",
                    viewModel: DropdownFieldViewModel(
                        options: [
                            SampleItem(id: 1, name: "Opción A"),
                            SampleItem(id: 2, name: "Opción B"),
                            SampleItem(id: 3, name: "Opción C")
                        ],
                        placeholder: "Selecciona una opción", selected: $selectedOption1
                    )
                )

                DDDInputDropDown(
                    label: "Opción seleccionada",
                    viewModel: DropdownFieldViewModel(
                        options: [
                            SampleItem(id: 1, name: "Swift"),
                            SampleItem(id: 2, name: "Kotlin")
                        ],
                        placeholder: "Lenguaje favorito", selected: $selectedOption2
                    )
                )

                DDDInputDropDown(
                    label: "Opción con error",
                    viewModel: {
                        let vm = DropdownFieldViewModel(
                            options: [
                                SampleItem(id: 1, name: "Rojo"),
                                SampleItem(id: 2, name: "Azul")
                            ],
                            placeholder: "Color favorito", selected: $selectedOption3
                        )
                        vm.errorMessage = "Este campo es obligatorio"
                        return vm
                    }()
                )

                DDDInputDropDown(
                    label: "Opción con descripción",
                    viewModel: {
                        let vm = DropdownFieldViewModel(
                            options: [
                                SampleItem(id: 1, name: "Perú"),
                                SampleItem(id: 2, name: "Chile"),
                                SampleItem(id: 3, name: "México")
                            ],
                            placeholder: "País", selected: $selectedOption4
                        )
                        vm.description = "Selecciona el país donde resides actualmente"
                        return vm
                    }()
                )

                DDDInputDropDown(
                    label: "Deshabilitado",
                    viewModel: DropdownFieldViewModel(
                        options: [
                            SampleItem(id: 1, name: "Fruta"),
                            SampleItem(id: 2, name: "Verdura")
                        ],
                        placeholder: "Categoría", selected: $selectedOption5
                    )
                )
                .disabled(true)
            }
            .padding()
        }
    }

    return DropdownPreviewView()
}

// MARK: - Sample Item for Preview

struct SampleItem: Identifiable, CustomStringConvertible, Equatable {
    let id: Int
    let name: String

    var description: String { name }
}
