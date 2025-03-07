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
            DDDIcon(icon)
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: size.avatarSize * 0.5, height: size.avatarSize * 0.5)

        case .image(let url):
            WebImage(url: url)
                .resizable()
                .scaledToFill()
                .frame(width: size.avatarSize, height: size.avatarSize)
                .clipShape(Circle())

        case .initials(let initials):
            let styledText = Text(initials).apply(token: .footNote, weight: .bold)
            styledText

        }
    }
}

#Preview {
    HStack {
        VStack {
            DDDAvatar(type: .image(URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg")!), size: .tiny)
            DDDAvatar(type: .image(URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg")!), size: .small)
            DDDAvatar(type: .image(URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg")!), size: .medium)
            DDDAvatar(type: .image(URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg")!), size: .large)
        }
        VStack {
            DDDAvatar(type: .icon(.user), size: .tiny)
            DDDAvatar(type: .icon(.user), size: .small)
            DDDAvatar(type: .icon(.user), size: .medium)
            DDDAvatar(type: .icon(.user), size: .large)
        }
        VStack {
            DDDAvatar(type: .initials("BB"), size: .tiny)
            DDDAvatar(type: .initials("BB"), size: .small)
            DDDAvatar(type: .initials("BB"), size: .medium)
            DDDAvatar(type: .initials("BB"), size: .large)
        }
    }
}
