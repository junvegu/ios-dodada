//
//  DDDText.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI
public enum DDDLabelToken {
    static let gap: CGFloat = 2
}

public struct DDDLabel<LeadingIcon: View, TrailingIcon: View>: View {
    
    @ViewBuilder private let leadingIcon: LeadingIcon
    @ViewBuilder private let trailingIcon: TrailingIcon
    private let text: String
    private let token: DDDFontToken
    private let weight: DDDFontToken.Weigth
    
    public var body: some View {
        HStack(spacing: DDDLabelToken.gap) {
            leadingIcon
            Text(text).apply(token: token, weight: weight)
            trailingIcon
        }
    }
}
public extension DDDLabel {
    
    init(
        _ text: String = "",
        token: DDDFontToken = .caption2,
        weight: DDDFontToken.Weigth = .regular,
        @ViewBuilder icon: () -> LeadingIcon,
        @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.text = text
        self.token = token
        self.weight = weight
        self.leadingIcon = icon()
        self.trailingIcon = disclosureIcon()
    }
    
    init(
        _ text: String = "",
        token: DDDFontToken = .caption2,
        weight: DDDFontToken.Weigth = .regular,
        icon: DDDIcon.Images? = nil,
        disclosureIcon: DDDIcon.Images? = nil
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.init(text, token: token, weight: weight, icon: {
            DDDIcon(icon)
        }, disclosureIcon: {
            DDDIcon(disclosureIcon)
        })
    }
}
#Preview {
    DDDLabel("Esternocleidomastoideo", icon: .add)
}



public struct LabelToken {

    /// predefined ``DDDLabel`` font size.
    public enum Size: Equatable {
        /// 13 pts.
        case small
        /// 15 pts.
        case normal
        /// 16 pts.
        case large
        /// 18 pts.
        case xLarge

        public static func lineHeight(forTextSize size: CGFloat) -> CGFloat {
            switch size {
                case 13:    return 16
                case 15:    return 20
                case 16:    return 24
                case 18:    return 24
                default:    return size
            }
        }

        public var value: CGFloat {
            switch self {
                case .small:                        return 13
                case .normal:                       return 15
                case .large:                        return 16
                case .xLarge:                       return 18
            }
        }

        public var lineHeight: CGFloat {
            switch self {
                case .small:                        return 16
                case .normal:                       return 20
                case .large:                        return 24
                case .xLarge:                       return 24
            }
        }
    }
}



public extension ContentSizeCategory {

    var ratio: CGFloat {
        switch self {
            case .extraSmall:                           return 0.8
            case .small:                                return 0.85
            case .medium:                               return 0.9
            case .large:                                return 1        // Default
            case .extraLarge:                           return 1.1
            case .extraExtraLarge:                      return 1.2
            case .extraExtraExtraLarge:                 return 1.35
            case .accessibilityMedium:                  return 1.6
            case .accessibilityLarge:                   return 1.9
            case .accessibilityExtraLarge:              return 2.35
            case .accessibilityExtraExtraLarge:         return 2.75
            case .accessibilityExtraExtraExtraLarge:    return 3.1
            @unknown default:                           return 1
        }
    }
    
    var controlRatio: CGFloat {
        1 + (ratio - 1) * 0.5
    }
}
