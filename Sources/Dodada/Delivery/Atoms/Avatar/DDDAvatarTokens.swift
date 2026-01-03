//
//  DDDAvatarTokens.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 6/03/25.
//

import Foundation

public enum AvatarSize{
    case tiny, small, medium, large, xLarge
    
    public var avatarSize: CGFloat{
        switch self {
        case .tiny:
            return 24
        case .small:
            return 36
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

public enum AvatarType {
    case icon(DDDIcon.Images)
    case image(URL)
    case initials(String)
}
