//
//  DDDAvatar.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 6/03/25.
//

import SwiftUI
import SDWebImageSwiftUI

public struct DDDAvatar: View {
    
    
    public let type: AvatarType
    public let size: AvatarSize
    
    public init(type: AvatarType, size: AvatarSize) {
        self.type = type
        self.size = size
    }
    
    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: size.avatarSize, height: size.avatarSize)
                .overlay(content)
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch type {
        case .icon(let icon):
            DDDIcon(icon, size: size.iconSize)
        case .image(let url):
            DDDAsyncImage(url: url)
                .frame(width: size.avatarSize, height: size.avatarSize)
                .clipShape(Circle())
            
        case .initials(let initials):
           Text(initials)
                .textStyle(.footnoteBold)
        }
    }
}

extension DDDAvatar {
    public enum AvatarSize{
        case tiny, small, medium, large, xLarge
        
        public var avatarSize: CGFloat{
            switch self {
            case .tiny:
                return .sizingIconMd
            case .small:
                return .sizingIconLg
            case .medium:
                return .sizingIconXl
            case .large:
                return .sizingIconTwoXl
            case .xLarge:
                return 80
            }
        }
        
        public var iconSize: DodadaSizingToken {
            switch self {
            case .tiny, .small:
                return .iconXs
            case .medium, .large:
                return .iconSm
            case .xLarge:
                return .iconLg
            }
        }
    }
    
    
    public enum AvatarType {
        case icon(DodadaIconToken)
        case image(URL?)
        case initials(String)
    }
    
}

#Preview {
    NavigationView {
        HStack {
            VStack {
                DDDAvatar(type: .image(URL(string: "https://images7.alphacoders.com/360/thumb-1920-360098.jpg")), size: .tiny)
                DDDAvatar(type: .image(URL(string: "https://img.wattpad.com/99bfdf6aaa54e084b31b1e7e00a058b5f4fcc6fb/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f63493767306c68554b735a4879773d3d2d3333393235323431352e313438623136323738646237653530373737393539393534393634372e6a7067?s=fit&w=720&h=720")), size: .small)
                DDDAvatar(type: .image(URL(string: "https://img.wattpad.com/99bfdf6aaa54e084b31b1e7e00a058b5f4fcc6fb/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f63493767306c68554b735a4879773d3d2d3333393235323431352e313438623136323738646237653530373737393539393534393634372e6a7067?s=fit&w=720&h=720")), size: .medium)
                DDDAvatar(type: .image(URL(string: "https://img.wattpad.com/99bfdf6aaa54e084b31b1e7e00a058b5f4fcc6fb/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f63493767306c68554b735a4879773d3d2d3333393235323431352e313438623136323738646237653530373737393539393534393634372e6a7067?s=fit&w=720&h=720")), size: .large)
            }
            VStack {
                DDDAvatar(type: .icon(.userUser), size: .tiny)
                DDDAvatar(type: .icon(.userUser), size: .small)
                DDDAvatar(type: .icon(.userUser), size: .medium)
                DDDAvatar(type: .icon(.userUser), size: .large)
            }
            VStack {
                DDDAvatar(type: .initials("BB"), size: .tiny)
                DDDAvatar(type: .initials("BB"), size: .small)
                DDDAvatar(type: .initials("BB"), size: .medium)
                DDDAvatar(type: .initials("BB"), size: .large)
            }
        }
    }.onAppear {
        Dodada.registerFonts()
    }
    
}
