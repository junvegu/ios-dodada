//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 12/04/24.
//

import Foundation
import SwiftUI

struct IconColorKey: EnvironmentKey {
    static let defaultValue: Color? = nil
}

public extension EnvironmentValues {
    var iconColor: Color? {
        get { self[IconColorKey.self] }
        set { self[IconColorKey.self] = newValue }
    }
}

public extension View {
    func iconColor(_ color: Color?) -> some View {
        environment(\.iconColor, color)
    }
}
