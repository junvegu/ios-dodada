//
//  DDDCheckboxFilter.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 2/04/25.
//

import SwiftUI

public struct DDDCheckboxFilter: View {
    public let type: CheckboxFilterType
    public let title: String
    public let leadingIcon: DDDIcon.Images?
    public let trailingIcon: DDDIcon.Images?
    @Binding private var isChecked: Bool
    private var onRemove: (() -> Void)?
    
    public init(type: CheckboxFilterType, title: String, leadingIcon: DDDIcon.Images? = nil, trailingIcon: DDDIcon.Images? = .x, isChecked: Binding<Bool>? = nil, onRemove: (() -> Void)? = nil) {
        self.type = type
        self.title = title
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self._isChecked = isChecked ?? .constant(false)
        self.onRemove = type == .last_results ? onRemove : nil
    }
    
    public var body: some View {
        HStack {
            if let icon = leadingIcon {
                DDDIcon(icon)
            }
            
            Text(title)
                .apply(token: .callOut, weight: .regular)
            
            Spacer()
            
            if type == .last_results, let onRemove = onRemove {
                Button(action: { onRemove() }) {
                    DDDIcon(trailingIcon)
                        .iconColor(Color(asset: Color.secondary400))
                }
            } else if type == .checkbox {
                DDDCheckboxIcon(type: .checkbox, state: isChecked ? .active : .default, isChecked: $isChecked)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    struct Previews: View {
        @State private var checkboxDefaults = false
        var body: some View {
            VStack(spacing: 16) {
                DDDCheckboxFilter(
                    type: .last_results,
                    title: "Waaaaaaa",
                    leadingIcon: .circle,
                    onRemove: { print("Filtro eliminado") }
                )
                
                DDDCheckboxFilter(
                    type: .checkbox,
                    title: "wiiiiii",
                    leadingIcon: .circle,
                    isChecked: $checkboxDefaults
                )
            }
        }
    }
    return Previews()
}
