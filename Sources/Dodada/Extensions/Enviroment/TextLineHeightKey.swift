//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/03/25.
//

import Foundation
import SwiftUI

struct TextLineHeightKey: EnvironmentKey {
    static let defaultValue: CGFloat? = nil
}

public extension EnvironmentValues {

    var textLineHeight: CGFloat? {
        get { self[TextLineHeightKey.self] }
        set { self[TextLineHeightKey.self] = newValue }
    }
}

public extension View {

    func textLineHeight(_ height: CGFloat?) -> some View {
        environment(\.textLineHeight, height)
    }
}
