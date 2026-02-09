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
    private let centerIcon: DodadaIconToken
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
        centerIcon: DodadaIconToken = .specialAquisito,
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
            let maxDragDistance = buttonWidth * 0.7 // 70% del ancho para activar
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
        .cornerRadius(.radiusLg)
    }
    
    // MARK: - Background Layer
    @ViewBuilder
    private func backgroundLayer(progress: CGFloat, buttonWidth: CGFloat) -> some View {
        ZStack(alignment: .leading) {
            // Base background (gray)
            Color.secondaryValue100
            
            // Progressive fill based on swipe direction
            if dragOffset > 0 && !rightAction.isDisabled {
                // Swiping right - llenar desde la izquierda
                Color.primaryValue500
                    .frame(width: abs(dragOffset), alignment: .leading)
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 0,
                                bottomLeading: 0,
                                bottomTrailing: 100,
                                topTrailing: 100
                            )
                        )
                    )
            } else if dragOffset < 0 && !leftAction.isDisabled {
                // Swiping left - llenar desde la derecha
                HStack {
                    Spacer()
                    Color.primaryValue500
                        .frame(width: abs(dragOffset), alignment: .trailing)
                        .clipShape(
                            UnevenRoundedRectangle(
                                cornerRadii: .init(
                                    topLeading: 100,
                                    bottomLeading: 100,
                                    bottomTrailing: 0,
                                    topTrailing: 0
                                )
                            )
                        )
                }
            }
        }
    }
    
    // MARK: - Content Layer
    @ViewBuilder
    private func contentLayer(buttonWidth: CGFloat) -> some View {
        HStack(spacing: 0) {
            // Left section
            leftSection(buttonWidth: buttonWidth)
            
            // Center section
            centerSection(buttonWidth: buttonWidth)
            
            // Right section
            rightSection(buttonWidth: buttonWidth)
        }
    }
    
    // MARK: - Left Section
    @ViewBuilder
    private func leftSection(buttonWidth: CGFloat) -> some View {
        // El estilo determina qué acción se muestra en la izquierda
        let displayedAction = style == .left ? leftAction : rightAction
        // Verificar si está cubierto por el color de relleno
        // Solo se pone blanco si el swipe es hacia la derecha (dragOffset > 0) porque el color se llena desde la izquierda
        let isCovered = dragOffset > 0 ? isSectionCovered(section: .left, buttonWidth: buttonWidth) : false
        
        HStack(spacing: .xxSmall) {
            DDDIcon(
                displayedAction.icon,
                color: textColorToken(isCovered: isCovered)
            )
            
            Text(displayedAction.title)
                .textStyle(.bodyRegular)
                .foregroundStyle(textColor(isCovered: isCovered))
            Spacer()
            Text("<<")
                .textStyle(.bodyBold)
                .foregroundStyle(textColor(isCovered: isCovered))
        }
        .padding(.leading, .medium)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Center Section
    @ViewBuilder
    private func centerSection(buttonWidth: CGFloat) -> some View {
        ZStack {
            // Background circle - debe estar por encima del color de relleno
            Circle()
                .fill(centerBackgroundColor(buttonWidth: buttonWidth))
                .frame(width: 40, height: 40)
                .zIndex(2)
            
            // Ring animation cuando se alcanza el threshold
            if showRing {
                // Ring exterior que se expande
                Circle()
                    .stroke(Color.primaryValue500, lineWidth: 2.5)
                    .frame(width: 40, height: 40)
                    .scaleEffect(ringScale)
                    .opacity(ringScale > 1.2 ? 0 : max(0, 1.0 - (ringScale - 1.0) * 2.0))
                    .zIndex(3)
                
                // Ring interior que se une (handicap)
                Circle()
                    .stroke(Color.primaryValue500, lineWidth: 1.5)
                    .frame(width: 40, height: 40)
                    .scaleEffect(max(1.0, ringScale * 0.8))
                    .opacity(ringScale > 1.0 ? 0.3 : 1)
                    .zIndex(3)
            }
            
            // Center icon
            DDDIcon(centerIcon, color: centerIconColorToken(buttonWidth: buttonWidth), size: .iconTwoXl)
                .zIndex(4)
        }
        .padding(.horizontal, .small)
    }
    
    // MARK: - Right Section
    @ViewBuilder
    private func rightSection(buttonWidth: CGFloat) -> some View {
        // El estilo determina qué acción se muestra en la derecha
        let displayedAction = style == .left ? rightAction : leftAction
        // Verificar si está cubierto por el color de relleno
        // Solo se pone blanco si el swipe es hacia la izquierda (dragOffset < 0) porque el color se llena desde la derecha
        let isCovered = dragOffset < 0 ? isSectionCovered(section: .right, buttonWidth: buttonWidth) : false
        
        HStack(spacing: .xxSmall) {
            Text(">>")
                .textStyle(.bodyBold)
                .foregroundStyle(textColor(isCovered: isCovered))
            Spacer()
            Text("ir ahora")
                .textStyle(.bodyRegular)
                .foregroundStyle(textColor(isCovered: isCovered))
            
            DDDIcon(
                .arrowsRight,
                color: textColorToken(isCovered: isCovered)
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
        return Color.neutralValue1000
    }
    
    // Enum para identificar las secciones
    private enum Section {
        case left
        case center
        case right
    }
    
    // Verificar si una sección está cubierta por el color de relleno
    private func isSectionCovered(section: Section, buttonWidth: CGFloat) -> Bool {
        guard dragOffset != 0 else { return false }
        
        let fillWidth = abs(dragOffset)
        
        // Estimar las posiciones aproximadas de cada sección
        // Las secciones ocupan aproximadamente: izquierda 35%, centro 30%, derecha 35%
        let leftSectionEnd = buttonWidth * 0.35
        let centerSectionStart = buttonWidth * 0.35
        let centerSectionEnd = buttonWidth * 0.65
        let rightSectionStart = buttonWidth * 0.65
        
        if dragOffset > 0 {
            // Swipe hacia la derecha - el color se llena desde la izquierda (x=0)
            // Solo la sección izquierda puede ponerse blanca
            switch section {
            case .left:
                // La sección izquierda está cubierta si el fillWidth alcanza su mitad
                return fillWidth >= leftSectionEnd * 0.5
            case .center:
                // El centro está cubierto si el fillWidth alcanza su inicio
                return fillWidth >= centerSectionStart
            case .right:
                // La derecha nunca se pone blanca en swipe derecho
                return false
            }
        } else if dragOffset < 0 {
            // Swipe hacia la izquierda - el color se llena desde la derecha (x=buttonWidth)
            // Solo la sección derecha puede ponerse blanca
            let fillStart = buttonWidth - fillWidth
            switch section {
            case .left:
                // La sección izquierda nunca se pone blanca en swipe izquierdo
                return false
            case .center:
                // El centro está cubierto si el fillStart está antes de su fin
                return fillStart <= centerSectionEnd
            case .right:
                // La sección derecha está cubierta si el fillStart está antes de su fin
                return fillStart <= rightSectionStart + (buttonWidth - rightSectionStart) * 0.5
            }
        }
        
        return false
    }
    
    private func centerBackgroundColor(buttonWidth: CGFloat) -> Color {
        let maxDragDistance = buttonWidth * 0.7
        let progress = abs(dragOffset) / maxDragDistance
        let clampedProgress = min(progress, 1.0)
        
        if clampedProgress > 0.3 {
            return Color.primaryValue500
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
        return Color.primaryValue500
    }

    private func centerIconColorToken(buttonWidth: CGFloat) -> DodadaColorToken {
        let maxDragDistance = buttonWidth * 0.7
        let progress = abs(dragOffset) / maxDragDistance
        let clampedProgress = min(progress, 1.0)
        return clampedProgress > 0.3 ? .textOnPrimary : .primaryValue500
    }

    private func textColorToken(isCovered: Bool) -> DodadaColorToken {
        isCovered ? .textOnPrimary : .neutralValue1000
    }
}

// MARK: - Supporting Types

/// Configuration for a swipe action (left or right).
public struct SwipeAction {
    let icon: DodadaIconToken
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
        icon: DodadaIconToken,
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
        // Left style - Reservar
        DDDSwipeableActionButton(
            leftAction: SwipeAction(
                icon: .feedbackBell,
                title: "Reservar",
                isDisabled: false,
                onAction: {
                    print("Reservar action")
                }
            ),
            rightAction: SwipeAction(
                icon: .arrowsRight,
                title: "ir ahora",
                isDisabled: false,
                onAction: {
                    print("Right action")
                }
            ),
            centerIcon: .specialAquisito,
            style: .left
        )
        
        // Right style - Llamar
        DDDSwipeableActionButton(
            leftAction: SwipeAction(
                icon: .communicationPhone,
                title: "Llamar",
                isDisabled: false,
                onAction: {
                    print("Llamar action")
                }
            ),
            rightAction: SwipeAction(
                icon: .arrowsRight,
                title: "ir ahora",
                isDisabled: false,
                onAction: {
                    print("Right action")
                }
            ),
            centerIcon: .specialAquisito,
            style: .right
        )
        
        // Disabled example
        DDDSwipeableActionButton(
            leftAction: SwipeAction(
                icon: .feedbackBell,
                title: "Reservar",
                isDisabled: true,
                onAction: {
                    print("This won't fire")
                }
            ),
            rightAction: SwipeAction(
                icon: .arrowsRight,
                title: "ir ahora",
                isDisabled: false,
                onAction: {
                    print("Right action")
                }
            ),
            centerIcon: .specialAquisito,
            style: .left
        )
    }
    .padding()
}

