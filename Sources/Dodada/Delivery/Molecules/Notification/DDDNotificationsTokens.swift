//
//  DDDNotificationTokens.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/02/25.
//

import Foundation
import SwiftUI

public enum NotificationType{
    case success, error, warning, info, state5
    
    var backgroundColor: Color {
        switch self {
        case .success: return Color(asset: Color.success).opacity(0.3)
        case .warning: return Color(asset: Color.warning).opacity(0.3)
        case .error: return Color(asset: Color.error).opacity(0.3)
        case .info: return Color(asset: Color.info).opacity(0.3)
        case .state5: return Color(asset: Color.secondary100)
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
        return iconColor
    }
}
