//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/03/25.
//

import Foundation
import SwiftUI
public struct IdealSizeValue {
    public var horizontal: Bool?
    public var vertical: Bool?
}

struct IdealSizeKey: EnvironmentKey {
    static let defaultValue = IdealSizeValue()
}

public extension EnvironmentValues {

    var idealSize: IdealSizeValue {
        get { self[IdealSizeKey.self] }
        set { self[IdealSizeKey.self] = newValue }
    }
}

public extension View {

    func idealSize(horizontal: Bool? = nil, vertical: Bool? = nil) -> some View {
        environment(\.idealSize, .init(horizontal: horizontal, vertical: vertical))
    }

    func idealSize() -> some View {
        idealSize(horizontal: true, vertical: true)
    }
}
