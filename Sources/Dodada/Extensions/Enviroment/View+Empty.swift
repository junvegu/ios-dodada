//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

extension View {
    var isEmpty: Bool {
        switch self {
        case is EmptyView:                      return true
        case let view as PotentiallyEmptyView:  return view.isEmpty
        default:                                return false
        }
    }
}
