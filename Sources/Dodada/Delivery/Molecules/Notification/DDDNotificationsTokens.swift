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
        case .success: return Color.successValue500.opacity(0.3)
        case .warning: return Color.warningValue500.opacity(0.3)
        case .error: return Color.errorValue500.opacity(0.3)
        case .info: return Color.infoValue500.opacity(0.3)
        case .state5: return Color.secondaryValue100
        }
    }
    
    var leadingIcon: DodadaIconToken {
        switch self {
        case .success: return .actionsCheck
        case .warning: return .feedbackAlertTriangle
        case .error: return .feedbackAlertCircle
        case .info: return .feedbackInfo
        case .state5: return .feedbackInfo
        }
    }
    
    var iconColor: Color {
        switch self {
        case .success: return Color.successValue500
        case .warning: return Color.warningValue500
        case .error: return Color.errorValue500
        case .info: return Color.infoValue500
        case .state5: return Color.secondaryValue500
        }
    }

    var iconColorToken: DodadaColorToken {
        switch self {
        case .success: return .feedbackSuccessIcon
        case .warning: return .feedbackWarningIcon
        case .error: return .feedbackErrorIcon
        case .info: return .feedbackInfoIcon
        case .state5: return .secondaryValue500
        }
    }

    var textColor: Color {
        return iconColor
    }
}
