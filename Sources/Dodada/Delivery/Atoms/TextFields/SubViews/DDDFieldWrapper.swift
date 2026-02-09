//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

public struct FieldWrapper<Label: View, Content: View, Footer: View>: View {

    @Binding private var messageHeight: CGFloat

    private let message: Message?
    private let isMandatory: Bool = false

    @ViewBuilder private let content: Content
    @ViewBuilder private let label: Label
    @ViewBuilder private let footer: Footer

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack (spacing: .zero) {
                if isMandatory {
                    Text("*")
                        .textStyle(.headlineRegular)
                        .foregroundStyle(Color.errorValue500)
                }
                label
                    .accessibility(hidden: true)
                    .accessibility(removeTraits: .isStaticText)
                    .padding(.bottom, .xxSmall)
            }

            content

            ContentHeightReader(height: $messageHeight) {
                VStack(alignment: .leading, spacing: 0) {
                    footer
                    FieldMessage(message)
                        .padding(.top, .xxSmall)
                }
            }
        }
    }
}

// MARK: - Inits
public extension FieldWrapper {

    init(
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0),
        @ViewBuilder content: () -> Content,
        @ViewBuilder label: () -> Label,
        @ViewBuilder footer: () -> Footer = { EmptyView() }
    ) {
        self.message = message
        self._messageHeight = messageHeight
        self.content = content()
        self.label = label()
        self.footer = footer()
    }
}
public extension FieldWrapper where Label == FieldLabel {

    init(
        _ label: String,
        message: Message? = nil,
        messageHeight: Binding<CGFloat> = .constant(0),
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer = { EmptyView() }
    ) {
        self.init(
            message: message,
            messageHeight: messageHeight,
            content: content,
            label: {
                FieldLabel(label)
            },
            footer: footer
        )
    }
}


public struct FieldLabel: View {

    private let label: String

    public var body: some View {
        if label.isEmpty {
            EmptyView()
        } else {
            Text(label)
                .textStyle(.footnoteRegular)
        }

    }

    public init(_ label: String) {
        self.label = label
    }
}
