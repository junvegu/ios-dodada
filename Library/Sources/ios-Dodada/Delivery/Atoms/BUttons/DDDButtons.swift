//
//  File.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import Foundation
import SwiftUI

public enum DDDButtonDesing {
    case primary
    case secondary
    case tertiary
    case onlyIcon
    case link
    
    var cornerRadius: CGFloat {
        switch self {
        case .primary:
            return 100
        case .secondary:
            return 100
        case .tertiary:
            return 4
        case .onlyIcon:
            return 4
        case .link:
            return 4
        }
    }
    
    var height: CGFloat {
        switch self {
        case .primary, .secondary, .tertiary, .onlyIcon, .link:
            return 48
        }
    }
    
    var width: CGFloat {
        switch self {
        case .primary, .secondary, .tertiary, .link:
            return .infinity
        case .onlyIcon:
            return 48
        }
    }
}

public enum DDDButtonStyle {
    case normal
    case hover
    case pressed
    case disable
}

struct DDDButtons: ButtonStyle {
    private var desing: DDDButtonDesing
    
    init(desing: DDDButtonDesing) {
        self.desing = desing
    }
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch desing {
        case .primary:
            return AnyView(FillButton(configuration: configuration))
        case .secondary:
            return AnyView(SecondaryButton(configuration: configuration))
            //case .fill: return AnyView(FillButton(style: style, configuration: configuration))
            //case .outline: return AnyView(OutlineButton(style: style, configuration: configuration))
            //case .ghost: return AnyView(GhostButton(style: style, configuration: configuration))
        default:
            return AnyView(FillButton(configuration: configuration))
        }
    }
    
    private struct FillButton: View {
        let configuration: ButtonStyle.Configuration
        
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        
        var body: some View {
            configuration.label
                .apply(token: .callOut, weight: .bold)
                .foregroundColor(isEnabled ? Color.white : colorTheme.disabledTextButton)
                .padding()
                .frame( maxWidth: .infinity, minHeight: DDDButtonDesing.primary.height)
                .cornerRadius(DDDButtonDesing.primary.cornerRadius)
                .background(isEnabled ?
                            configuration.isPressed ?  colorTheme.pressedButton :  colorTheme.defaultButton
                            : colorTheme.disabledButton)
                .cornerRadius(DDDButtonDesing.primary.cornerRadius)
        }
    }
    
    private struct SecondaryButton: View {
        let configuration: ButtonStyle.Configuration
        
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        
        var body: some View {
            configuration.label
                .apply(token: .callOut, weight: .bold)
                .foregroundColor(isEnabled ?
                                 configuration.isPressed ?  colorTheme.pressedButton :  colorTheme.defaultButton
                                 : colorTheme.disabledTextButton)
                .padding()
                .frame( maxWidth: .infinity, minHeight: DDDButtonDesing.primary.height)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: DDDButtonDesing.primary.cornerRadius)
                        .stroke(isEnabled ?
                                configuration.isPressed ?  colorTheme.pressedButton :  colorTheme.defaultButton
                                : colorTheme.disabledButton, lineWidth: 1)
                )
        }
    }
}


extension Button {
    /// Changes the appearance of the button
    public func d3StyleApply(
        design: DDDButtonDesing = .primary
    ) -> some View {
        self.buttonStyle(DDDButtons(desing: design))
    }
}
