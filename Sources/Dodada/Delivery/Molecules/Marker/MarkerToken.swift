//
//  MarkerToken.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 4/03/25.
//
import SwiftUI

public enum MarkerType {
    case new, trading, top_one
    
    var badgeColor: Color {
        switch self {
        case .new: return Color.primaryValue500
        case .trading: return Color.successValue500
        case .top_one: return Color.warningValue500
        }
    }
    
    var badge: DodadaIconToken {
        switch self {
        case .new: return .specialGlow
        case .trading: return .trendingTrendingTopic
        case .top_one: return .contentAward2
        }
    }
}

public enum MarkerSize {
    case medium, small, tiny
    
    var size: CGFloat {
        switch self {
        case .medium: return 64
        case .small: return 48
        case .tiny: return 36
        }
    }
}
