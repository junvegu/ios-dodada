//
//  DDDToastToken.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 24/02/25.
//

import Foundation
import SwiftUI

public enum AlertType {
    case success, warning, error, info
    
    var backgroundColor: Color {
        switch self {
        case .success: return Color.successValue500.opacity(0.2)
        case .warning: return Color.warningValue500.opacity(0.2)
        case .error: return Color.errorValue500.opacity(0.2)
        case .info: return Color.infoValue500.opacity(0.2)
        }
    }
    
    var leadingIcon: DodadaIconToken {
        switch self {
        case .success: return .actionsCheck
        case .warning: return .feedbackAlertTriangle
        case .error: return .feedbackAlertCircle
        case .info: return .feedbackInfo
        }
    }

    var iconColor: Color {
        switch self {
        case .success: return Color.successValue500
        case .warning: return Color.warningValue500
        case .error: return Color.errorValue500
        case .info: return Color.infoValue500
        }
    }

    var iconColorToken: DodadaColorToken {
        switch self {
        case .success: return .feedbackSuccessIcon
        case .warning: return .feedbackWarningIcon
        case .error: return .feedbackErrorIcon
        case .info: return .feedbackInfoIcon
        }
    }

    var textColor: Color {
        return iconColor
    }
}
