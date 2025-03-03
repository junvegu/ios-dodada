//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

struct SizePreferenceKey: PreferenceKey {

    static var defaultValue: CGFloat { 0 }

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
