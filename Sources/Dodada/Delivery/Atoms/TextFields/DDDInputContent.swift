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
   // @Environment(\.idealSize) private var idealSize
    @Environment(\.isEnabled) private var isEnabled
    //@Environment(\.textColor) private var textColor
    @Environment(\.sizeCategory) private var sizeCategory

    public let verticalPadding: CGFloat = .small // = 44 @ normal text size

    private let state: InputState
    private let label: String
    private let message: Message?
    private let isPressed: Bool
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
                    .padding(.leading, .small)
                    .padding(.trailing, -.xxSmall)
                    // Component should expose label as part of content
                    .accessibility(hidden: true)
                    .accessibility(removeTraits: .isStaticText)

                content
            }

           // if idealSize.horizontal != true {
           //     Spacer(minLength: 0)
           // }

            suffix
                .padding(.leading, -.xxSmall)
                .padding(.trailing, .small)
                .padding(.vertical, verticalPadding)

            Color.clear
                .frame(width: 0, height: 48)
                .alignmentGuide(.firstTextBaseline) { _ in 16 }
                .alignmentGuide(.lastTextBaseline) { _ in 16 }
                .padding(.vertical, verticalPadding)
        }
        .foregroundStyle(Color.secondary500.swiftUIColor)
        .background(
            backgroundColor(isPressed: isPressed).animation(.default, value: message)
        )
        .cornerRadius(.regularCornerRadius)
        .overlay(focusBorder)
        .overlay(border)
    }

    @ViewBuilder private var border: some View {
        RoundedRectangle(cornerRadius: .regularCornerRadius)
            .strokeBorder(outlineColor(isPressed: isPressed), lineWidth: 1)
    }

    @ViewBuilder private var focusBorder: some View {
        RoundedRectangle(cornerRadius: 5.5)
            .inset(by: -2)
            .strokeBorder(focusOutlineColor.opacity(0.1), lineWidth: 1)
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
    
    private func backgroundColor(isPressed: Bool) -> Color {
        if isEnabled == false {
            return .secondary100.swiftUIColor
        }

        switch (state, isPressed) {
            case (.default, true):      return .white
            case (.default, false):     return .white
            case (.modified, true):     return .orange
            case (.modified, false):    return .orange
        }
    }

    private func outlineColor(isPressed: Bool) -> Color {
        switch (message, state, isFocused) {
        case (.error, _, _):        return .error.swiftUIColor
        case (.warning, _, _):      return .warning500.swiftUIColor
        case (.help, _, _):         return .secondary400.swiftUIColor
            case (_, .modified, _):     return .secondary500.swiftUIColor
            case (_, .default, true):   return .secondary500.swiftUIColor
            default:                    return .clear
        }
    }

    private var focusOutlineColor: Color {
        switch (message, isFocused) {
            case (.error, true):        return .error.swiftUIColor
            case (.warning, true):      return .warning500.swiftUIColor
            case (.help, true):         return .secondary400.swiftUIColor
        case (_, true):             return .secondary500.swiftUIColor
        case (_, false):            return .secondary500.swiftUIColor
        }
    }

    public init(
        state: InputState = .default,
        label: String = "",
        message: Message? = nil,
        isPressed: Bool = true,
        isFocused: Bool = true,
        @ViewBuilder content: () -> Content,
        @ViewBuilder prefix: () -> Prefix = { EmptyView() },
        @ViewBuilder suffix: () -> Suffix = { EmptyView() }
    ) {
        self.state = state
        self.label = label
        self.message = message
        self.isPressed = isPressed
        self.isFocused = isFocused
        self.content = content()
        self.prefix = prefix()
        self.suffix = suffix()
    }
}


#Preview {
    VStack {
        DDDInputContent(label: "Label") {
            TextField("", text: .constant(""))
                .padding(.horizontal, .small)
        } prefix: {
            DDDIcon(.aquisito)
        } suffix: {
            DDDIcon(.google)
        }.padding()
    }
}
