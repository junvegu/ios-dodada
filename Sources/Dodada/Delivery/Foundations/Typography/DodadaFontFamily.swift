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
    static var familyPrimary: String { get }
    static var familySystem: String { get }
    static var familyMonospace: String { get }
    func value(for token: DodadaFontFamily) -> String
}

public struct DodadaThemeFontFamilyTokens: DodadaFontFamilyTokens {
    public static var familyPrimary: String { DodadaFontFamily.familyPrimary.value }
    public static var familySystem: String { DodadaFontFamily.familySystem.value }
    public static var familyMonospace: String { DodadaFontFamily.familyMonospace.value }
    public func value(for token: DodadaFontFamily) -> String {
        switch token {
        case .familyPrimary: return Self.familyPrimary
        case .familySystem: return Self.familySystem
        case .familyMonospace: return Self.familyMonospace
        }
    }
}
