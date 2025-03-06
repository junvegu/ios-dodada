//
//  MarkerToken.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 4/03/25.
//
import SwiftUI

enum MarkerType {
    case new, trading, top_one
    
    var badgeColor: Color {
        switch self {
        case .new: return Color(asset: Color.primary500)
        case .trading: return Color(asset: Color.success500)
        case .top_one: return Color(asset: Color.warning500)
        }
    }
    
    var Badge: DDDIcon.Images {
        switch self {
        case .new: return .glow
        case .trading: return .trendingTopic
        case .top_one: return .award2
        }
    }
}

enum MarkerSize {
    case medium, small, tiny
    
    var size: CGFloat {
        switch self {
        case .medium: return 64
        case .small: return 48
        case .tiny: return 36
        }
    }
}
