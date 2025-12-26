//
//  DDDCheckboxIcon.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 2/04/25.
//

import SwiftUI

public struct DDDCheckboxIcon: View {
    public let type: CheckboxType
    public let state: CheckboxState
    @Binding public var isChecked: Bool

    public init(type: CheckboxType, state: CheckboxState, isChecked: Binding<Bool>) {
        self.type = type
        self.state = state
        self._isChecked = isChecked
    }

    public var body: some View {
        HStack {
            ZStack {
                shapeForType()
                    .stroke(state.borderColor, lineWidth: 2)
                    .background(state.backgroundColor.clipShape(shapeForType()))
                    .frame(width: 24, height: 24)

                if isChecked {
                    if type == .checkbox {
                        DDDIcon(.check, iconColor: state.checkmarkColor)
                            .iconSize(custom: .xLarge)
                    } else {
                        Circle()
                            .fill(state.checkmarkColor)
                            .frame(width: 12, height: 12)
                    }
                }
            }
            .onTapGesture {
                if state != .disabled {
                    isChecked.toggle()
                }
            }
        }
    }

    public func shapeForType() -> some Shape {
        return type == .checkbox ? AnyShape(RoundedRectangle(cornerRadius: 8)) : AnyShape(Circle())
    }
}

public struct AnyShape: Shape {
    private let pathClosure: (CGRect) -> Path

    public init<S: Shape>(_ wrapped: S) {
        pathClosure = { wrapped.path(in: $0) }
    }

    public func path(in rect: CGRect) -> Path {
        pathClosure(rect)
    }
}


#Preview {
    struct DDDCheckboxIconPreview: View {
        @State private var checkboxDefault = false
        @State private var checkboxFocused = false
        @State private var checkboxActive = false
        @State private var checkboxDisabled = false

        @State private var radioDefault = false
        @State private var radioFocused = false
        @State private var radioActive = false
        @State private var radioDisabled = false

        var body: some View {
            VStack(spacing: 20) {
                Text("Checkboxes")
                
                DDDCheckboxIcon(type: .checkbox, state: .default, isChecked: $checkboxDefault)
                DDDCheckboxIcon(type: .checkbox, state: .focused, isChecked: $checkboxFocused)
                DDDCheckboxIcon(type: .checkbox, state: .active, isChecked: $checkboxActive)
                DDDCheckboxIcon(type: .checkbox, state: .disabled, isChecked: $checkboxDisabled)

                Divider().padding(.vertical, 10)

                Text("Radio Buttons")
                
                DDDCheckboxIcon(type: .radio, state: .default, isChecked: $radioDefault)
                DDDCheckboxIcon(type: .radio, state: .focused, isChecked: $radioFocused)
                DDDCheckboxIcon(type: .radio, state: .active, isChecked: $radioActive)
                DDDCheckboxIcon(type: .radio, state: .disabled, isChecked: $radioDisabled)
            }
            .padding()
        }
    }

    return DDDCheckboxIconPreview()
}


