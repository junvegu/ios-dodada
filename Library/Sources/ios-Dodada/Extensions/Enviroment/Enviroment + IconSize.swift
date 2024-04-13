//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 12/04/24.
//

import Foundation
import SwiftUI

struct IconSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat? = nil
}

public extension EnvironmentValues {
    var iconSize: CGFloat? {
        get { self[IconSizeKey.self] }
        set { self[IconSizeKey.self] = newValue }
    }
}

public extension View {

    func iconSize(custom size: CGFloat?) -> some View {
        environment(\.iconSize, size)
    }
}
