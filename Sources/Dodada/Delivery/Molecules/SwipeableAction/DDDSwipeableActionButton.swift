//
//  DDDSwipeableActionButton.swift
//  Dodada UI Component
//
//  Created by Junior Quevedo Gutierrez on 1/03/25.
//

import SwiftUI

/// A swipeable action button component for Dodada.
/// Supports left and right swipe actions with visual feedback.
/// The button color fills progressively as the user swipes.
public struct DDDSwipeableActionButton: View {
    
    // MARK: - Properties
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var ringScale: CGFloat = 0
    @State private var showRing: Bool = false
    @State private var isAnimating: Bool = false
    
    private let leftAction: SwipeAction
    private let rightAction: SwipeAction
    private let centerIcon: DDDIcon.Images
    private let style: SwipeableStyle
    
    // MARK: - Initializer
    /// Creates a `DDDSwipeableActionButton` component.
    ///
    /// - Parameters:
    ///   - leftAction: Configuration for the left swipe action.
    ///   - rightAction: Configuration for the right swipe action.
    ///   - centerIcon: Icon to display in the center section.
    ///   - style: The visual style of the button (`.left` or `.right`).
    public init(
        leftAction: SwipeAction,
        rightAction: SwipeAction,
        centerIcon: DDDIcon.Images = .aquisito,
        style: SwipeableStyle = .left
    ) {
        self.leftAction = leftAction
        self.rightAction = rightAction
        self.centerIcon = centerIcon
        self.style = style
    }
    
    // MARK: - Body
    public var body: some View {
        GeometryReader { geometry in
            let buttonWidth = geometry.size.width
            let maxDragDistance = buttonWidth * 0.7
            let progress = abs(dragOffset) / maxDragDistance
            let clampedProgress = min(progress, 1.0)
            
            ZStack {
                backgroundLayer(progress: clampedProgress, buttonWidth: buttonWidth)
                    .zIndex(0)
                
                contentLayer(buttonWidth: buttonWidth)
                    .zIndex(1)
            }
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onChanged { value in
                        if !isDragging {
                            isDragging = true
                        }
                        
                        let newOffset = value.translation.width
                        
                        if newOffset > 0 && !rightAction.isDisabled {
                            dragOffset = min(newOffset, maxDragDistance)
                        } else if newOffset < 0 && !leftAction.isDisabled {
                            dragOffset = max(newOffset, -maxDragDistance)
                        }
                    }
                    .onEnded { value in
                        let threshold = maxDragDistance * 0.5
                        
                        if abs(dragOffset) > threshold && !isAnimating {
                            isAnimating = true
                            showRing = true
                            
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                                ringScale = 2.0
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                if dragOffset > 0 && !rightAction.isDisabled {
                                    rightAction.onAction()
                                } else if dragOffset < 0 && !leftAction.isDisabled {
                                    leftAction.onAction()
                                }
                                
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    dragOffset = 0
                                    isDragging = false
                                    ringScale = 0
                                    showRing = false
                                    isAnimating = false
                                }
                            }
                        } else {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                dragOffset = 0
                                isDragging = false
                                ringScale = 0
                                showRing = false
                            }
                        }
                    }
            )
        }
        .frame(height: 53)
        .cornerRadius(.xLargeCornerRadius)
    }
    
    // MARK: - Background Layer
    @ViewBuilder
        private func backgroundLayer(progress: CGFloat, buttonWidth: CGFloat) -> some View {
            ZStack {
                Asset.Colors.secondary100.swiftUIColor
                
                let height: CGFloat = 53
                let shapeWidth = height + abs(dragOffset)
                
                if dragOffset > 0 && !rightAction.isDisabled {
                    Capsule()
                        .fill(Asset.Colors.primary.swiftUIColor)
                        .frame(width: shapeWidth, height: height)
                        .offset(x: abs(dragOffset) / 2)
                    
                } else if dragOffset < 0 && !leftAction.isDisabled {
                    Capsule()
                        .fill(Asset.Colors.primary.swiftUIColor)
                        .frame(width: shapeWidth, height: height)
                        .offset(x: -abs(dragOffset) / 2)
                }
            }
        }
    
    // MARK: - Content Layer
    @ViewBuilder
    private func contentLayer(buttonWidth: CGFloat) -> some View {
        HStack(spacing: 0) {
            leftSection(buttonWidth: buttonWidth)
            centerSection(buttonWidth: buttonWidth)
            rightSection(buttonWidth: buttonWidth)
        }
    }
    
    // MARK: - Left Section
    @ViewBuilder
    private func leftSection(buttonWidth: CGFloat) -> some View {
        let displayedAction = style == .left ? leftAction : rightAction
        let currentColor = smoothTextColor(section: .left)
        
        HStack(spacing: .xxSmall) {
            DDDIcon(
                displayedAction.icon,
                iconColor: currentColor
            )
            
            Text(displayedAction.title)
                .apply(token: .body, weight: .regular)
                .foregroundStyle(currentColor)
            Spacer()
            Text("<<")
                .apply(token: .body, weight: .bold)
                .foregroundStyle(currentColor)
        }
        .padding(.leading, .medium)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Center Section
    @ViewBuilder
    private func centerSection(buttonWidth: CGFloat) -> some View {
        ZStack {
            Circle()
                .fill(centerBackgroundColor(buttonWidth: buttonWidth))
                .frame(width: 40, height: 40)
                .zIndex(2)
            
            if showRing {
                Circle()
                    .stroke(Asset.Colors.primary.swiftUIColor, lineWidth: 2.5)
                    .frame(width: 40, height: 40)
                    .scaleEffect(ringScale)
                    .opacity(ringScale > 1.2 ? 0 : max(0, 1.0 - (ringScale - 1.0) * 2.0))
                    .zIndex(3)
                
                Circle()
                    .stroke(Asset.Colors.primary.swiftUIColor, lineWidth: 1.5)
                    .frame(width: 40, height: 40)
                    .scaleEffect(max(1.0, ringScale * 0.8))
                    .opacity(ringScale > 1.0 ? 0.3 : 1)
                    .zIndex(3)
            }
            
            DDDIcon(centerIcon, iconColor: centerIconColor(buttonWidth: buttonWidth))
                .iconSize(custom: .xxLarge)
                .zIndex(4)
        }
        .padding(.horizontal, .small)
    }
    
    // MARK: - Right Section
    @ViewBuilder
    private func rightSection(buttonWidth: CGFloat) -> some View {
        let displayedAction = style == .left ? rightAction : leftAction
        let currentColor = smoothTextColor(section: .right)
        
        HStack(spacing: .xxSmall) {
            Text(">>")
                .apply(token: .body, weight: .bold)
                .foregroundStyle(currentColor)
            Spacer()
            Text("Ir ahora")
                .apply(token: .body, weight: .regular)
                .foregroundStyle(currentColor)
            
            DDDIcon(
                .arrowRight,
                iconColor: currentColor
            )
        }
        .padding(.trailing, .medium)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    // MARK: - Computed Properties
    private func textColor(isCovered: Bool) -> Color {
        if isCovered {
            return .white
        }
        return Asset.Colors.black.swiftUIColor
    }
    
    private enum Section {
        case left
        case center
        case right
    }
    
    
    private func smoothTextColor(section: Section) -> Color {
        guard dragOffset != 0 else { return Asset.Colors.black.swiftUIColor }
        
        let distance = abs(dragOffset)
        let startFade: CGFloat = 40.0
        let endFade: CGFloat = 150.0
        
        var progress: CGFloat = 0.0
        
        if distance > startFade {
            progress = (distance - startFade) / (endFade - startFade)
            progress = min(max(progress, 0.0), 1.0)
        }
        
        if dragOffset > 0 {
            if section == .right {
                return Color(white: progress)
            }
        } else {
            if section == .left {
                return Color(white: progress)
            }
        }
        
        return Asset.Colors.black.swiftUIColor
    }
    
    private func centerBackgroundColor(buttonWidth: CGFloat) -> Color {
        let maxDragDistance = buttonWidth * 0.7
        let progress = abs(dragOffset) / maxDragDistance
        let clampedProgress = min(progress, 1.0)
        
        if clampedProgress > 0.3 {
            return Asset.Colors.primary.swiftUIColor
        }
        return .white
    }
    
    private func centerIconColor(buttonWidth: CGFloat) -> Color {
        let maxDragDistance = buttonWidth * 0.7
        let progress = abs(dragOffset) / maxDragDistance
        let clampedProgress = min(progress, 1.0)
        
        if clampedProgress > 0.3 {
            return .white
        }
        return Asset.Colors.primary.swiftUIColor
    }
}

// MARK: - Supporting Types

/// Configuration for a swipe action (left or right).
public struct SwipeAction {
    let icon: DDDIcon.Images
    let title: String
    let isDisabled: Bool
    let onAction: () -> Void
    
    /// Creates a swipe action configuration.
    ///
    /// - Parameters:
    ///   - icon: Icon to display for this action.
    ///   - title: Text to display for this action.
    ///   - isDisabled: Whether this action is disabled.
    ///   - onAction: Callback when the action is triggered.
    public init(
        icon: DDDIcon.Images,
        title: String,
        isDisabled: Bool = false,
        onAction: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.isDisabled = isDisabled
        self.onAction = onAction
    }
}

/// Visual style for the swipeable button.
public enum SwipeableStyle {
    case left
    case right
}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        DDDSwipeableActionButton(
            leftAction: SwipeAction(
                icon: .bell,
                title: "Reservar",
                isDisabled: false,
                onAction: {
                    print("Reservar action")
                }
            ),
            rightAction: SwipeAction(
                icon: .arrowRight,
                title: "ir ahora",
                isDisabled: false,
                onAction: {
                    print("Right action")
                }
            ),
            centerIcon: .aquisito,
            style: .left
        )
        
        DDDSwipeableActionButton(
            leftAction: SwipeAction(
                icon: .phone,
                title: "Llamar",
                isDisabled: false,
                onAction: {
                    print("Llamar action")
                }
            ),
            rightAction: SwipeAction(
                icon: .arrowRight,
                title: "ir ahora",
                isDisabled: false,
                onAction: {
                    print("Right action")
                }
            ),
            centerIcon: .aquisito,
            style: .right
        )
        
        DDDSwipeableActionButton(
            leftAction: SwipeAction(
                icon: .bell,
                title: "Reservar",
                isDisabled: true,
                onAction: {
                    print("This won't fire")
                }
            ),
            rightAction: SwipeAction(
                icon: .arrowRight,
                title: "ir ahora",
                isDisabled: false,
                onAction: {
                    print("Right action")
                }
            ),
            centerIcon: .aquisito,
            style: .left
        )
    }
    .padding()
}

