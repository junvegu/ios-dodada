//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 12/04/24.
//

import Foundation
import SwiftUI

struct IconSizeKey: EnvironmentKey {
    static let defaultValue: DDDIconSize = .xLarge
}

public extension EnvironmentValues {
    var iconSize: DDDIconSize {
        get { self[IconSizeKey.self] }
        set { self[IconSizeKey.self] = newValue }
    }
}

public extension View {

    func iconSize(custom size: DDDIconSize) -> some View {
        environment(\.iconSize, size)
    }
}
