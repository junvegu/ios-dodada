//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 31/01/25.
//

import Foundation
import SwiftUI

public struct DDDInputContent<Content: View, Prefix: View, Suffix: View>: View {

    @Environment(\.idealSize) private var idealSize
    @Environment(\.isEnabled) private var isEnabled

    public let verticalPadding: CGFloat = .spacingSm

    private let state: InputState
    private let label: String
    private let message: Message?
    private let isFocused: Bool
    @ViewBuilder private let content: Content
    @ViewBuilder private let prefix: Prefix
    @ViewBuilder private let suffix: Suffix
    @Binding private var value: String
    public var body: some View {
        HStack(spacing: 0) {
            prefix
                .padding(.leading, .spacingSm)
                .padding(.trailing, -.spacingXs)
                .padding(.vertical, verticalPadding)

            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text(label)
                    .textStyle(.calloutRegular)
                    .foregroundStyle(Color.secondaryValue400)
                    .padding(.leading, .spacingSm)
                    .padding(.trailing, -.spacingXs)
                    .accessibility(hidden: true)
                    .accessibility(removeTraits: .isStaticText)

                content
            }
            .padding(.vertical, verticalPadding)

            if idealSize.horizontal != true {
             Spacer(minLength: 0)
            }

            suffix
                .padding(.leading, -.spacingSm)
                .padding(.trailing, .spacingSm)
                .padding(.vertical, verticalPadding)
        }
        .foregroundStyle(resolvedTextColor)
        .background(
            backgroundColor().animation(.default, value: message)
        )
        .cornerRadius(.radiusSm)
        .overlay(focusBorder)
        .overlay(border)
    }

    @ViewBuilder private var border: some View {
        RoundedRectangle(cornerRadius: .radiusSm)
            .strokeBorder(
                Color.secondaryValue200.opacity(isFocused ? 0.6 : 1.0),
                lineWidth: isFocused ? 1 : 2
            )
    }
    

    @ViewBuilder private var focusBorder: some View {
         RoundedRectangle(cornerRadius: .radiusSm)
             .trim(from: 0, to: showBorderFofus ? 1 : 0)
             .stroke(focusOutlineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
             .animation(.easeInOut(duration: 0.4), value: showBorderFofus)
     }

    private var showBorderFofus: Bool {
        return !value.isEmpty || isFocused
    }
    
    private var resolvedTextColor: Color {
        isEnabled
        ?  state.textColor
        : Color.secondaryValue300
    }

    private var labelColor: Color {
        isEnabled
            ? Color.secondaryValue500
            : Color.secondaryValue200
    }



    private var focusOutlineColor: Color {
        switch (message, showBorderFofus) {
        case (.error, true):        return Color.errorValue500
        case (.warning, true):      return Color.warningValue500
        case (.help, true):         return Color.secondaryValue400
        case (_, true):             return Color.secondaryValue500
        case (_, false):            return Color.secondaryValue200
        }
    }
    private func backgroundColor() -> Color {
        if isEnabled == false {
            return Color.secondaryValue200
        }

        return .clear
    }
    
    public init(
        state: InputState = .default,
        label: String = "",
        message: Message? = nil,
        isFocused: Bool = false,
        value: Binding<String>,
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
        self._value = value
    }
}


#Preview {
    VStack {
        
        DDDInputContent(label: "Label", value: .constant("")) {
            EmptyView()
        }.padding()
        
        DDDInputContent(label: "Label", value: .constant("")) {
            EmptyView()
        } prefix: {
            DDDIcon(.specialAquisito)
        } suffix: {
            DDDIcon(.socialGoogle)
        }.padding()
        
        DDDInputContent(label: "Label", isFocused: true, value: .constant("")) {
            TextField("", text: .constant("Value"))
                .padding(.horizontal, .spacingSm)
        } prefix: {
            DDDIcon(.specialAquisito)
        } suffix: {
            DDDIcon(.socialGoogle)
        }.padding()
        
        DDDInputContent(label: "Label", isFocused: true, value: .constant("")) {
            TextField("", text: .constant("Value"))
                .padding(.horizontal, .spacingSm)
        } prefix: {
            DDDIcon(.socialGoogle)
        } suffix: {
            DDDIcon(.socialGoogle)
        }.padding()
            .disabled(true)
        
        DDDInputContent(label: "Label", message: .error("Este es un error", icon: .feedbackAlertCircle), isFocused: true, value: .constant("")) {
            TextField("", text: .constant("Value"))
                .padding(.horizontal, .spacingSm)
        } prefix: {
            DDDIcon(.specialAquisito)
        } suffix: {
            DDDIcon(.socialGoogle)
        }.padding()
    }
}
