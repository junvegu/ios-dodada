//
//  DDDToastToken.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 24/02/25.
//

import Foundation
import SwiftUI

public enum AlertType {
    case success, warning, error, info, state5
    
    var backgroundColor: Color {
        switch self {
        case .success: return Color(asset: Color.success).opacity(0.2)
        case .warning: return Color(asset: Color.warning).opacity(0.2)
        case .error: return Color(asset: Color.error).opacity(0.2)
        case .info: return Color(asset: Color.info).opacity(0.2)
        case .state5: return Color(asset: Color.secondary100)//.opacity(0.2)
        }
    }
    
    var leadingIcon: DDDIcon.Images {
        switch self {
        case .success: return .check
        case .warning: return .alertTriangle
        case .error: return .alertCircle
        case .info: return .info
        case .state5: return .info
        }
    }
    
        /*var leadingIcon: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.octagon.fill"
        case .info: return "info.circle.fill"
        case .state5: return "info.circle.fill"
        }
    }*/

    var iconColor: Color {
        switch self {
        case .success: return Color(asset: Color.success500)
        case .warning: return Color(asset: Color.warning500)
        case .error: return Color(asset: Color.error)
        case .info: return Color(asset: Color.info)
        case .state5: return Color(asset: Color.secondary500)
        }
    }
    
    var textColor: Color {
        /*switch self {
        case .success: return Color(asset: Color.success500)
        case .warning: return Color(asset: Color.warning500)
        case .error: return Color(asset: Color.error)
        case .info: return Color(asset: Color.info)
        }*/
        return iconColor
    }
}
