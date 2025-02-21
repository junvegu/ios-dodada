import Foundation

public enum DDDIconSize {
    case xSmall
    case small
    case normal
    case large
    case xLarge
    case xxLarge
    case xxxLarge
    
    var value: CGFloat {
        switch self {
        case .xSmall:
            return 8
        case .small:
            return 12
        case .normal:
            return 16
        case .large:
            return 20
        case .xLarge:
            return 24
        case .xxLarge:
            return 32
        case .xxxLarge:
            return 48
        }
    }
}
