//
//  DDDInputDropDown.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 20/03/25.
//

import SwiftUI

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
