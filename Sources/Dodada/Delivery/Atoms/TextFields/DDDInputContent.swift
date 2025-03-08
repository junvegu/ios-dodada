//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 31/01/25.
//

import Foundation
import SwiftUI
public enum InputState {

    case `default`
    case modified

    public var textColor: Color {
        switch self {
        case .default:          return .secondary500.swiftUIColor
        case .modified:         return .secondary200.swiftUIColor
        }
    }
    
    public var placeholderColor: Color {
        .secondary400.swiftUIColor
    }
}

public struct DDDInputContent<Content: View, Prefix: View, Suffix: View>: View {

    @Environment(\.iconColor) private var iconColor
    @Environment(\.idealSize) private var idealSize
    @Environment(\.isEnabled) private var isEnabled

    public let verticalPadding: CGFloat = .small

    private let state: InputState
    private let label: String
    private let message: Message?
    private let isFocused: Bool
    @ViewBuilder private let content: Content
    @ViewBuilder private let prefix: Prefix
    @ViewBuilder private let suffix: Suffix
    
    public var body: some View {
        HStack(spacing: 0) {
            prefix
                .iconColor(prefixIconColor)
                .foregroundStyle(Color.secondary500.swiftUIColor)
                .padding(.leading, .small)
                .padding(.trailing, -.xxSmall)
                .padding(.vertical, verticalPadding)

            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text(label)
                    .apply(token: .callOut, weight: .regular)
                    .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
                    .padding(.leading, .small)
                    .padding(.trailing, -.xxSmall)
                    .accessibility(hidden: true)
                    .accessibility(removeTraits: .isStaticText)

                content
            }
            .padding(.vertical, verticalPadding)

            if idealSize.horizontal != true {
             Spacer(minLength: 0)
            }

            suffix
                .padding(.leading, -.xSmall)
                .padding(.trailing, .xSmall)
                .padding(.vertical, verticalPadding)
        }
        .foregroundStyle(resolvedTextColor)
        .background(
            backgroundColor().animation(.default, value: message)
        )
        .cornerRadius(.regularCornerRadius)
        .overlay(focusBorder)
        .overlay(border)
    }

    @ViewBuilder private var border: some View {
        RoundedRectangle(cornerRadius: .regularCornerRadius)
            .strokeBorder(isFocused ? .clear : Asset.Colors.secondary200.swiftUIColor, lineWidth: 2)
    }

    @ViewBuilder private var focusBorder: some View {
         RoundedRectangle(cornerRadius: .regularCornerRadius)
             .trim(from: 0, to: isFocused ? 1 : 0) // Hace que la animación recorra todo el borde
             .stroke(focusOutlineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
             .animation(.easeInOut(duration: 0.4), value: isFocused) // Animación progresiva
     }

    private var resolvedTextColor: Color {
        isEnabled
        ?  state.textColor
        : .secondary300.swiftUIColor
    }

    private var labelColor: Color {
        isEnabled
            ? (.secondary500.swiftUIColor)
            : .secondary200.swiftUIColor
    }

    private var prefixIconColor: Color? {
        isEnabled
        ? iconColor ?? .secondary500.swiftUIColor : .secondary500.swiftUIColor
    }


    private var focusOutlineColor: Color {
        switch (message, isFocused) {
        case (.error, true):        return .error.swiftUIColor
        case (.warning, true):      return .warning500.swiftUIColor
        case (.help, true):         return .secondary400.swiftUIColor
        case (_, true):             return .secondary500.swiftUIColor
        case (_, false):            return .secondary200.swiftUIColor
        }
    }
    private func backgroundColor() -> Color {
        if isEnabled == false {
            return .secondary200.swiftUIColor
        }

        return .clear
    }
    
    public init(
        state: InputState = .default,
        label: String = "",
        message: Message? = nil,
        isFocused: Bool = false,
        @ViewBuilder content: () -> Content,
        @ViewBuilder prefix: () -> Prefix = { EmptyView() },
        @ViewBuilder suffix: () -> Suffix = { EmptyView() }
    ) {
        self.state = state
        self.label = label
        self.message = message
        self.isFocused = isFocused
        self.content = content()
        self.prefix = prefix()
        self.suffix = suffix()
    }
}


#Preview {
    VStack {
        
        DDDInputContent(label: "Label") {
            EmptyView()
        }.padding()
        
        DDDInputContent(label: "Label") {
            EmptyView()
        } prefix: {
            DDDIcon(.aquisito)
        } suffix: {
            DDDIcon(.google)
        }.padding()
        
        DDDInputContent(label: "Label", isFocused: true) {
            TextField("", text: .constant("Value"))
                .padding(.horizontal, .small)
        } prefix: {
            DDDIcon(.aquisito)
        } suffix: {
            DDDIcon(.google)
        }.padding()
        
        DDDInputContent(label: "Label", isFocused: true) {
            TextField("", text: .constant("Value"))
                .padding(.horizontal, .small)
        } prefix: {
            DDDIcon(.aquisito)
        } suffix: {
            DDDIcon(.google)
        }.padding()
            .disabled(true)
        
        DDDInputContent(label: "Label", message: .error("Este es un error", icon: .alertCircle), isFocused: true) {
            TextField("", text: .constant("Value"))
                .padding(.horizontal, .small)
        } prefix: {
            DDDIcon(.aquisito)
        } suffix: {
            DDDIcon(.google)
        }.padding()
    }
}
