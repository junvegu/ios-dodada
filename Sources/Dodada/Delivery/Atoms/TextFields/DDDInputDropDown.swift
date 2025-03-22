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

public struct DDDInputDropDown: View {
    private let placeholder: String
     let state: InputStyles
    private let options: [String]
    @Binding public var selectedOption: String?
    
    public init(placeholder: String, state: InputStyles, options: [String], selectedOption: Binding<String?>) {
        self.placeholder = placeholder
        self.state = state
        self.options = options
        self._selectedOption = selectedOption
    }
    
    public var body: some View {
        Menu {
            ForEach(options, id: \ .self) { option in
                Button(action: {
                    if state != .disabled {
                        selectedOption = option
                    }
                }) {
                    Text(option)
                        .apply(token: state.textStyle.token,
                               weight: state.textStyle.weight)
                }
            }
        } label: {
            HStack {
                Text(selectedOption ?? placeholder)
                    .foregroundColor(state.textColor)
                    .apply(token: state.textStyle.token,
                           weight: state.textStyle.weight)
                Spacer()
                DDDIcon(.chevronDown)
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8).stroke(state.borderColor, lineWidth: 1))
            .background(Color.white.opacity(state == .disabled ? 0.5 : 1))
        }
        .disabled(state == .disabled)
    }
}

#Preview ("Preview de DDDInputDropDown"){
    struct DDDInputDropDownPreview: View {
        @State private var selectedOption1: String? = nil
        @State private var selectedOption2: String? = nil
        @State private var selectedOption3: String? = nil
        @State private var selectedOption4: String? = nil
        
        var body: some View {
            VStack(spacing: 16) {
                DDDInputDropDown(placeholder: "Comida", state: .default, options: ["Ramen", "Caldo de Gallina"], selectedOption: $selectedOption1)
                
                DDDInputDropDown(placeholder: "Lugar", state: .focus, options: ["Lima", "San Miguel"], selectedOption: $selectedOption2)
                
                DDDInputDropDown(placeholder: "Calificación", state: .error, options: ["2", "4"], selectedOption: $selectedOption3)
                
                DDDInputDropDown(placeholder: "XD", state: .disabled, options: ["Option 1", "Option 2"], selectedOption: $selectedOption4)
                
                Spacer()
            }
            .padding()
        }
    }
    
    return DDDInputDropDownPreview()
}
