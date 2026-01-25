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
    private let fullWidth: Bool
    
    @ViewBuilder private let leadingIcon: LeadingIcon
    @ViewBuilder private let trailingIcon: TrailingIcon
    
    public var body: some View {
        button.buttonStyle(
            DDDButtons(
                desing: desing,
                fullWidth: fullWidth
            )  {
                leadingIcon
            } trailingIcon: {
                trailingIcon
            }
        )
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
        fullWidth: Bool = true,
        icon: DDDIcon.Images? = nil,
        disclosureIcon: DDDIcon.Images? = nil,
        action: @escaping () -> Void
    ) where LeadingIcon == DDDIcon, TrailingIcon == DDDIcon {
        self.init(label, desing: desing, fullWidth: fullWidth) {
            action()
        } icon: {
            DDDIcon(icon, iconColor: desing.iconColor)
        } disclosureIcon: {
            DDDIcon(disclosureIcon, iconColor: desing.iconColor)
        }
    }
    
    public init(
        _ label: String = "",
        desing: DDDButtonDesing = .primary,
        fullWidth: Bool = false,
        action: @escaping () -> Void,
        @ViewBuilder icon: () -> LeadingIcon,
        @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.label = label
        self.desing = desing
        self.fullWidth = fullWidth
        self.action = action
        self.leadingIcon = icon()
        self.trailingIcon = disclosureIcon()
    }
 
}



struct DDDButtons<LeadingIcon: View, TrailingIcon: View>: ButtonStyle {
    private var desing: DDDButtonDesing
    private let fullWidth: Bool
    @ViewBuilder private let icon: LeadingIcon
    @ViewBuilder private let disclosureIcon: TrailingIcon
    
    public init(
        desing: DDDButtonDesing,
        fullWidth: Bool = false,
        @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
        @ViewBuilder trailingIcon: () -> TrailingIcon = { EmptyView() }
    ) {
        self.desing = desing
        self.fullWidth = fullWidth
        self.icon = icon()
        self.disclosureIcon = trailingIcon()
    }

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch desing {
        case .primary:
            return AnyView(FillButton(desing: desing, fullWidth: fullWidth, configuration: configuration){
                icon
            } disclosureIcon: {
                disclosureIcon
            })
        case .secondary, .secondaryDark:
            return AnyView(SecondaryButton(desing: desing, fullWidth: fullWidth, configuration: configuration) {
                icon
            } disclosureIcon: {
                disclosureIcon
            })
            
        case .tertiary:
            return AnyView(TertiaryButton(desing: desing, fullWidth: fullWidth, configuration: configuration) {
                icon
            } disclosureIcon: {
                disclosureIcon
            })
        case .onlyIcon:
            return AnyView(IconButton(desing: desing, fullWidth: fullWidth, configuration: configuration) {
                icon
            })
        case .link:
            return AnyView(LinkButton(desing: desing, fullWidth: fullWidth, configuration: configuration){
                icon
            } disclosureIcon: {
                disclosureIcon
            })
        case .ghost:
            return AnyView(IconButton(desing: desing, fullWidth: fullWidth, configuration: configuration) {
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
        private let fullWidth: Bool

        init(
            desing: DDDButtonDesing,
            fullWidth: Bool,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.fullWidth = fullWidth
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
            .frame(maxWidth: fullWidth ? .infinity : desing.width, minHeight: desing.height)
            .background(
                Rectangle()
                    .fill( isEnabled ? (configuration.isPressed ? desing.pressedColor : colorTheme.defaultButton) : .secondary100.swiftUIColor)
                    .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
            )
            .cornerRadius(colorTheme.borderRoundButton)
            .transition(.opacity)


        }
    }
    
    private struct SecondaryButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing
        private let fullWidth: Bool

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon

        init(
            desing: DDDButtonDesing,
            fullWidth: Bool,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.fullWidth = fullWidth
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
            .frame(maxWidth: fullWidth ? .infinity : desing.width, minHeight: desing.height)
            .background(
                RoundedRectangle(cornerRadius: colorTheme.borderRoundButton)
                    .fill(desing.backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: colorTheme.borderRoundButton)
                    .stroke(
                        isEnabled
                        ? (configuration.isPressed ? desing.pressedColor : desing.borderColor)
                        : colorTheme.disabledButton,
                        lineWidth: 1
                    )
            )
            .iconColor(desing.iconColor == nil ? nil : (configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor))
        }
    }
    
    private struct TertiaryButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing
        private let fullWidth: Bool

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon

        init(
            desing: DDDButtonDesing,
            fullWidth: Bool,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.fullWidth = fullWidth
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
            .frame(maxWidth: fullWidth ? .infinity : desing.width, minHeight: desing.height)
            .background(desing.backgroundColor)
            // TODO: Refactor to pass iconColor directly to DDDIcon when color is dynamic
            .iconColor(configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor )
            .cornerRadius(colorTheme.borderRoundButton)
        }
    }
    
    private struct IconButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing
        private let fullWidth: Bool

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon

        init(
            desing: DDDButtonDesing,
            fullWidth: Bool,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon
        ) {
            self.desing = desing
            self.fullWidth = fullWidth
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
            .frame(maxWidth: fullWidth ? .infinity : desing.width, minHeight: desing.height)
            .background(isEnabled ? desing.backgroundColor : colorTheme.disabledButton)
            .cornerRadius((desing.width ?? 48)/2)
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
        private let fullWidth: Bool

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon
        @ViewBuilder let disclosureIcon: TrailingIcon

        init(
            desing: DDDButtonDesing,
            fullWidth: Bool,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon = { EmptyView() },
            @ViewBuilder disclosureIcon: () -> TrailingIcon = { EmptyView() }
        ) {
            self.desing = desing
            self.fullWidth = fullWidth
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
            .padding()
            .frame(maxWidth: fullWidth ? .infinity : desing.width, minHeight: desing.height)
            .background(desing.backgroundColor)
            // TODO: Refactor to pass iconColor directly to DDDIcon when color is dynamic
            .iconColor(configuration.isPressed ? desing.pressedColor : desing.iconColor ?? desing.backgroundColor )
        }
    }
    
    private struct GhostButton: View {
        let configuration: ButtonStyle.Configuration
        private let desing: DDDButtonDesing
        private let fullWidth: Bool

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: DDDTheme
        @ViewBuilder let icon: LeadingIcon

        init(
            desing: DDDButtonDesing,
            fullWidth: Bool,
            configuration: ButtonStyle.Configuration,
            @ViewBuilder icon: () -> LeadingIcon
        ) {
            self.desing = desing
            self.fullWidth = fullWidth
            self.configuration = configuration
            self.icon = icon()
        }
        
        var body: some View {
            
            HStack {
                icon
            }
            .padding()
            .frame(maxWidth: fullWidth ? .infinity : desing.width, minHeight: desing.height)
            .background(isEnabled ? configuration.isPressed ? desing.pressedColor : desing.backgroundColor : colorTheme.disabledButton)
            .cornerRadius(colorTheme.borderRoundButton)
            .clipShape(Circle())
            // TODO: Refactor to pass iconColor directly to DDDIcon when color is dynamic
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
    
    VStack(spacing: 4) {
        DDDButton("Primary", desing: .primary, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }.disabled(true)
    
        DDDButton("Primary No full", desing: .primary, fullWidth: false, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
        
        DDDButton("Secondary", desing: .secondary, icon: .apple, disclosureIcon: .aquisito) {
            print("asdasdasdasdadsad")
        }
        
        DDDButton("Secondary Dark", desing: .secondaryDark, icon: .google, disclosureIcon: .aquisito) {
            print("asdasdasdasdadsad")
        }
        
        DDDButton("Tertiary", desing: .tertiary, icon: .apple, disclosureIcon: .aquisito) {
            print("asdasdasdasdadsad")
        }
        
        DDDButton("Link", desing: .link, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
        
        DDDButton("Link", desing: .ghost, icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
        
        HStack {
            Spacer()
            DDDButton("Link", desing: .link) {
                print("asdasdasdasdadsad")
            }
        }.frame(maxWidth: .infinity)
        DDDButton("Link", desing: .onlyIcon(inverted: true), icon: .add, disclosureIcon: .alertCircle) {
            print("asdasdasdasdadsad")
        }
    }
    .padding()
    .background(Color(red: 242/255, green: 242/255, blue: 247/255))
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    
       
}
