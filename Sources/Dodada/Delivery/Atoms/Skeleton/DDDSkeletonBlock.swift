//
//  DDDSkeletonBlock.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 27/04/26.
//

import SwiftUI

public struct DDDSkeletonBlock: View {
    public var width: CGFloat?
    public var height: CGFloat?
    public var shape: SkeletonShape
    
    public enum SkeletonShape {
        case rectangle
        case circle
        case capsule
        case rounded(CGFloat)
    }

    public init(width: CGFloat? = nil, height: CGFloat? = nil, shape: SkeletonShape = .rectangle) {
        self.width = width
        self.height = height
        self.shape = shape
    }

    public var body: some View {
        Group {
            switch shape {
            case .rectangle:
                Rectangle()
            case .circle:
                Circle()
            case .capsule:
                Capsule()
            case .rounded(let radius):
                RoundedRectangle(cornerRadius: radius)
            }
        }
        .foregroundStyle(Color(white: 0.9))
        .frame(width: width, height: height)
        .clipped()
        .dddShimmer()
    }
}

public struct DDDShimmerModifier: ViewModifier {
    @State private var isAnimating = false

    public init() {}

    public func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Color.white.opacity(0.4)
                        .mask(
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.clear, .white, .clear]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geometry.size.width * 2)
                                .rotationEffect(.degrees(15))
                                .offset(x: isAnimating ? geometry.size.width : -geometry.size.width * 2)
                        )
                }
            )
            .onAppear {
                withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
            }
    }
}

public extension View {
    func dddShimmer() -> some View {
        self.modifier(DDDShimmerModifier())
    }
}
