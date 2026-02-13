// Do not edit directly. Generated from design tokens.

import UIKit

public enum DodadaFontFamily: CaseIterable {
    case familyPrimary
    case familySystem
    case familyMonospace
}

extension DodadaFontFamily {
    public var value: String {
        switch self {
        case .familyPrimary: return "Quicksand"
        case .familySystem: return "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif"
        case .familyMonospace: return "'SF Mono', 'Monaco', 'Inconsolata', 'Fira Code', 'Fira Mono', monospace"
        }
    }
}

public protocol DodadaFontFamilyTokens {
    var familyPrimary: String { get }
    var familySystem: String { get }
    var familyMonospace: String { get }
    func value(for token: DodadaFontFamily) -> String
}

public struct DodadaThemeFontFamilyTokens: DodadaFontFamilyTokens {
    public var familyPrimary: String { DodadaFontFamily.familyPrimary.value }
    public var familySystem: String { DodadaFontFamily.familySystem.value }
    public var familyMonospace: String { DodadaFontFamily.familyMonospace.value }
    public func value(for token: DodadaFontFamily) -> String {
        switch token {
        case .familyPrimary: return familyPrimary
        case .familySystem: return familySystem
        case .familyMonospace: return familyMonospace
        }
    }
}
