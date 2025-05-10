//
//  DDDCheckboxText.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 2/04/25.
//

import SwiftUI

public struct DDDCheckboxText: View {
    public let type: CheckboxType
    public let text: String
    @Binding private var isChecked: Bool
    
    public init(type: CheckboxType, title: String, isChecked: Binding<Bool>? = nil) {
        self.type = type
        self.text = title
        self._isChecked = isChecked ?? .constant(false)
    }
    
    public var body: some View {
        HStack {
            if type == .radio{
                DDDCheckboxIcon(type: .radio, state: isChecked ? .active : .default, isChecked: $isChecked)
            }else if type == .checkbox {
                DDDCheckboxIcon(type: .checkbox, state: isChecked ? .active : .default, isChecked: $isChecked)
            }
            
            Text(text)
                .apply(token: .callOut, weight: .regular)
            
            Spacer()
        }.padding(.horizontal, 10)
    }
}

#Preview {
    struct Previews: View {
        @State private var checkbox = false
        @State private var radioCheck = false
        var body: some View {
            VStack(spacing: 20) {
                Text("Text with Checkbox")
                
                DDDCheckboxText(type: .checkbox, title: "Waaaaaa", isChecked: $checkbox)

                Divider().padding(.vertical, 10)

                Text("Text with radio-type checkbox")
                
                DDDCheckboxText(type: .radio, title: "Wiiiiii", isChecked: $radioCheck)
            }
            .padding()
        }
    }
    return Previews()
}
