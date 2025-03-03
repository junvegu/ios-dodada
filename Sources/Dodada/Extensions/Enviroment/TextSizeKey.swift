//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/03/25.
//

import Foundation
import SwiftUI

struct TextSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat? = nil
}

public extension EnvironmentValues {
    var textSize: CGFloat? {
        get { self[TextSizeKey.self] }
        set { self[TextSizeKey.self] = newValue }
    }
}

public extension View {
    func textSize(_ size: LabelToken.Size?) -> some View {
        environment(\.textSize, size?.value)
    }

    func textSize(custom size: CGFloat?) -> some View {
        environment(\.textSize, size)
    }
}
