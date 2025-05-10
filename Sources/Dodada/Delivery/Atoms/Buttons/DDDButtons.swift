//
//  File.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import Foundation
import SwiftUI
public struct DDDButton<LeadingIcon: View, TrailingIcon: View>: View {
    private let label: String
    private let action: () -> Void
    private let desing: DDDButtonDesing
    
    @ViewBuilder private let leadingIcon: LeadingIcon
    @ViewBuilder private let trailingIcon: TrailingIcon
    
    public var body: some View {
        button.buttonStyle(
            DDDButtons(
                desing: desing
                
            )  {
                leadingIcon
            } trailingIcon: {
                trailingIcon
            }
        ).iconColor(desing.iconColor)
    }
    
    @ViewBuilder private var button: some View {
        SwiftUI.Button() {
            action()
        } label: {
            Text(label)
        }
    }

    public init(
        _ label: String = "",
        desing: DDDButtonDesing = .primary,
        icon: DDDIcon.Images? = nil,
        disclosureIcon: DDDIcon.Images? = nil,
        action: @escaping () -> Void
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.init(label, desing: desing) {
            action()
        } icon: {
            DDDIcon(icon)
        } disclosureIcon: {
            DDDIcon(disclosureIcon)
        }
    }
    
    public init(
        _ label: String = "",
        desing: DDDButtonDesing = .primary,
        action: @escaping () -> Void,
        @ViewBuilder icon: () -> LeadingIcon,
        @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.label = label
        self.desing = desing
        self.action = action
        self.leadingIcon = icon()
        self.trailingIcon = disclosureIcon()
    }
 
}



struct DDDButtons<LeadingIcon: View, TrailingIcon: View>: ButtonStyle {
    private var desing: DDDButtonDesing
    @ViewBuilder private let icon: LeadingIcon
    @ViewBuilder private let disclosureIcon: TrailingIcon
    
    public init(
        desing: DDDButtonDesing,
        @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
        @ViewBuilder trailingIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.desing = desing
        self.icon = icon()
        self.disclosureIcon = trailingIcon()
    }

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch desing {
        case .primary:
            return AnyView(FillButton(desing: desing, configuration: configuration){
                icon
            } disclosureIcon: {
                disclosureIcon
            })
        case .secondary:
            return AnyView(SecondaryButton(desing: desing, configuration: configuration) {
                icon
            } disclosureIcon: {
                disclosureIcon
            })
            
        case .tertiary:
            return AnyView(TertiaryButton(desing: desing, configuration: configuration) {
                icon
            } disclosureIcon: {
                disclosureIcon
            })
        case .onlyIcon:
            return AnyView(IconButton(desing: desing, configuration: configuration) {
                icon
            })
        case .link:
            return AnyView(LinkButton(desing: desing, configuration: configuration){
                icon
            } disclosureIcon: {
                disclosureIcon
            })
        case .ghost:
            return AnyView(IconButton(desing: desing, configuration: configuration) {
                icon
            })
            /*
        default:
            return AnyView(EmptyView())*/
        }
    }
    
    private struct FillButton: View {
        let configuration: ButtonStyle.Configuration
        
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon
        
        private let desing: DDDButtonDesing

        init(
            desing: DDDButtonDesing,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.configuration = configuration
            self.icon = icon()
            self.disclosureIcon = disclosureIcon()
        }

        var body: some View {
            HStack(spacing: desing.gap) {
                icon
                configuration.label
                    .apply(token: .callOut, weight: .bold)
                    .layoutPriority(1)
                disclosureIcon
            }.foregroundColor(
                isEnabled ? desing.textColor : colorTheme.disabledTextButton
            )
            .padding()
            .frame( maxWidth: desing.width, minHeight: desing.height)
            .background(
                Rectangle()
                    .fill(configuration.isPressed ? desing.pressedColor : colorTheme.defaultButton)
                    .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
            )
            .cornerRadius(colorTheme.borderRoundButton)
            .transition(.opacity)


        }
    }
    
    private struct SecondaryButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon

        init(
            desing: DDDButtonDesing,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.configuration = configuration
            self.icon = icon()
            self.disclosureIcon = disclosureIcon()
        }
        
        var body: some View {
            
            HStack(spacing: desing.gap) {
                icon
                configuration.label
                    .apply(token: .callOut, weight: .bold)
                    .layoutPriority(1)
                disclosureIcon
            }.foregroundColor(isEnabled ?
                             configuration.isPressed ?  desing.pressedColor : desing.textColor
                             : colorTheme.disabledTextButton)
            .padding()
            .frame( maxWidth: desing.width, minHeight: desing.height)
            .background(desing.backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: colorTheme.borderRoundButton)
                    .stroke(isEnabled ?
                            configuration.isPressed ?  desing.pressedColor : desing.borderColor
                            : colorTheme.disabledButton, lineWidth: 1)
            )
            .iconColor(configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor )
            //.frame(maxWidth: desing.width)
        }
    }
    
    private struct TertiaryButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon

        init(
            desing: DDDButtonDesing,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.configuration = configuration
            self.icon = icon()
            self.disclosureIcon = disclosureIcon()
        }
        
        var body: some View {
            
            HStack(spacing: 8) {
                icon
                configuration.label
                    .apply(token: .callOut, weight: .bold)
                    .layoutPriority(1)
                disclosureIcon
            }.foregroundColor(isEnabled ?
                             configuration.isPressed ?  desing.pressedColor :  desing.textColor
                             : colorTheme.disabledTextButton)
            .padding()
            .frame(minHeight: desing.height)
            .background(desing.backgroundColor)
            .iconColor(configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor )
            .cornerRadius(colorTheme.borderRoundButton)
        }
    }
    
    private struct IconButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon

        init(
            desing: DDDButtonDesing,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon
        ) {
            self.desing = desing
            self.configuration = configuration
            self.icon = icon()
        }
        
        var body: some View {
            
            HStack {
                icon
            }.foregroundColor(isEnabled ?
                             configuration.isPressed ?  desing.pressedColor : desing.textColor
                             : colorTheme.disabledTextButton)
            .padding()
            .frame( maxWidth: desing.width, minHeight: desing.height)
            .background(isEnabled ? desing.backgroundColor : colorTheme.disabledButton)
            .cornerRadius(desing.width/2)
            .overlay(
                Circle()
                    .stroke(isEnabled ?
                            configuration.isPressed ?  desing.pressedColor :  desing.borderColor
                            : colorTheme.disabledButton, lineWidth: 1)
            )
            .clipShape(Circle())
            .iconColor(configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor )
        }
    }
    
    private struct LinkButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon

        init(
            desing: DDDButtonDesing,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.configuration = configuration
            self.icon = icon()
            self.disclosureIcon = disclosureIcon()
        }
        
        var body: some View {
            
            HStack {
                icon
                configuration.label
                    .apply(token: .callOut, weight: .bold)
                    .layoutPriority(1)
                disclosureIcon
            }.foregroundColor(isEnabled ?
                             configuration.isPressed ?  desing.pressedColor :  desing.textColor
                             : colorTheme.disabledTextButton)
            //.padding()
            //.frame(minHeight: desing.height)
            .background(desing.backgroundColor)
            .iconColor(configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor )
        }
    }
    
    private struct GhostButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon

        init(
            desing: DDDButtonDesing,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon
        ) {
            self.desing = desing
            self.configuration = configuration
            self.icon = icon()
        }
        
        var body: some View {
            
            HStack {
                icon
            }
            .padding()
            .frame( maxWidth: desing.width, minHeight: desing.height)
            .background(isEnabled ? configuration.isPressed ? desing.pressedColor : desing.backgroundColor : colorTheme.disabledButton)
            .cornerRadius(colorTheme.borderRoundButton)
            .clipShape(Circle())
            .iconColor(isEnabled ? desing.iconColor : colorTheme.disabledTextButton )
        }
    }
}


extension Button {
    /// Changes the appearance of the button
    func d3StyleApply(
        design: DDDButtonDesing = .primary
    ) -> some View {
        self.buttonStyle(DDDButtons(desing: design))
    }
}


#Preview {
    
    VStack(spacing: .zero) {
        DDDButton("HOla como estan", desing: .primary, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
          DDDButton("HOla como estan", desing: .primary, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
    }
  
    VStack{
        DDDButton("HOla como estan", desing: .primary, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
        DDDButton("$", desing: .tertiary) {//tertiary se adapta al texto, el primiary no
            print("asdasdasdasdadsad")
        }
        DDDButton("HOla como estan", desing: .link, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
}
