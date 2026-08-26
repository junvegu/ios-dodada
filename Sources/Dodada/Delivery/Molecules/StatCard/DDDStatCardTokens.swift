//
//  DDDStatCardTokens.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public extension DDDStatCard {

    enum CardType {
        case success
        case warning
        case error
        case `default`
        case disabled
    }
}

extension DDDStatCard.CardType {

    var valueColor: Color {
        switch self {
        case .success:     return .successValue500
        case .warning:     return .warningValue500
        case .error:       return .errorValue500
        case .default:     return .secondaryValue500
        case .disabled:    return .secondaryValue200
        }
    }

    var iconColor: DodadaColorToken {
        switch self {
        case .success:     return .successValue500
        case .warning:     return .warningValue500
        case .error:       return .errorValue500
        case .default:     return .primaryValue500
        case .disabled:    return .secondaryValue300
        }
    }

    var titleColor: Color {
        switch self {
        case .disabled:    return .secondaryValue200
        default:           return .secondaryValue500
        }
    }

    var backgroundColor: Color {
        switch self {
        case .success:     return Color(hex: "#F1FDF4")
        case .warning:     return Color(hex: "#FFF7ED")
        case .error:       return Color(hex: "#FEF3F2")
        case .default:     return Color(hex: "#FEF5FF")
        case .disabled:    return Color(hex: "#E9ECF3")
        }
    }
}
