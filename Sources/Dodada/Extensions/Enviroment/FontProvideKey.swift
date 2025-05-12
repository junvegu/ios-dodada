//
//  FontProvideKey.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 12/05/25.
//
import SwiftUI

private struct DDDFontProviderKey: EnvironmentKey {
    static let defaultValue: DDDFontProviding = DDDFontProviderDefault()
}

public extension EnvironmentValues {
    var dddFontProvider: DDDFontProviding {
        get { self[DDDFontProviderKey.self] }
        set { self[DDDFontProviderKey.self] = newValue }
    }
}
