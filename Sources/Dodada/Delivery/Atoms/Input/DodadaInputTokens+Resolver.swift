//
//  DodadaInputTokens+Resolver.swift
//  Dodada
//
//  Resolves DodadaInputTokens by UI state (enabled, focused, message).
//  DodadaInputThemeTokens.swift is auto-generated; this extension is not.
//

import SwiftUI

public extension DodadaInputTokens {
    /// Returns the token set for the current input state.
    /// Priority: disabled → error message → focused → default.
    static func tokens(
        isEnabled: Bool,
        isFocused: Bool,
        message: Message?
    ) -> DodadaInputTokens {
        if !isEnabled {
            return disabledState
        }
        if case .error = message {
            return errorState
        }
        if isFocused {
            return focusState
        }
        return defaultState
    }
}
