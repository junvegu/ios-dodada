//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 30/01/25.
//

import Foundation
import SwiftUI

public struct DDDInputField<Prefix: View, Suffix: View> {
    
    @Environment(\.isEnabled) private var isEnabled
    @FocusState private var isFocused: Bool

    @State private var isSecureTextRedacted: Bool = true
    
    @Binding private var text: String
    
    private let label: String
    private let placeholder: String
    
    @ViewBuilder private var prefix: Prefix
    @ViewBuilder private var suffix: Suffix
    private let isSecure: Bool
    
    var autocapitalizationType: UITextAutocapitalizationType = .none
    var isAutocorrectionDisabled: Bool? = false
    var keyboardType: UIKeyboardType = .default
    var returnKeyType: UIReturnKeyType = .default
    var textContentType: UITextContentType?
    var shouldDeleteBackwardAction: (String) -> Bool = { _ in true }

    
    
    public var body: some View {
       EmptyView()
    }
    
//@ViewBuilder private var textField: some View {
       // TextField.init( <#LocalizedStringKey#>, text: $text, prompt: .init(placeholder))
     /*   TextField(
            value: $text,
            prompt: placeholder,
            isSecureTextEntry: isSecure && isSecureTextRedacted,
            leadingPadding: .small,
            trailingPadding: .small
        )
        .focused($isFocused)
        .returnKeyType(returnKeyType)
        .autocorrectionDisabled(isAutocorrectionDisabled)
        .keyboardType(keyboardType)
        .textContentType(textContentType)
        .autocapitalization(autocapitalizationType)
        .shouldDeleteBackwardAction(shouldDeleteBackwardAction)
        .accessibility(label: .init(label))*/
   // }

}

public extension DDDInputField {

    init(
        _ label: String = "",
        text: Binding<String>,
        placeholder: String = "",
        isSecure: Bool = false,
        prefix: DDDIcon.Images? = nil,
        suffix: DDDIcon.Images? = nil
    ) where Prefix == DDDIcon, Suffix == DDDIcon {
        self.init(
            label,
            text: text,
            placeholder: placeholder,
            isSecure: isSecure
        )  {
            DDDIcon(prefix)
        } suffix: {
            DDDIcon(suffix)
        }
    }
    
    init(
        _ label: String = "",
        text: Binding<String>,
        placeholder: String = "",
        isSecure: Bool = false,
        @ViewBuilder prefix: () -> Prefix,
        @ViewBuilder suffix: () -> Suffix = { EmptyView() }
    ) {
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.prefix = prefix()
        self.suffix = suffix()
    }
}
