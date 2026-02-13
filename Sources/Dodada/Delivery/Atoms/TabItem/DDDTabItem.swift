//
//  DDDTabItem.swift
//  Dodada UI Component
//
//  Created by Junior Quevedo Gutierrez on 1/03/25.
//

import SwiftUI

/// A single tab item component for Dodada.
/// Represents one tab in a tab bar with active/inactive states.
public struct DDDTabItem: View {
    
    // MARK: - Configuration
    private let title: String
    private let isSelected: Bool
    private let action: () -> Void
    
    private static let indicatorWidth: CGFloat = 40
    
    // MARK: - Initializer
    /// Creates a `DDDTabItem` component.
    ///
    /// - Parameters:
    ///   - title: The text to display in the tab.
    ///   - isSelected: Whether this tab is currently selected.
    ///   - action: The action to perform when the tab is tapped.
    public init(
        title: String,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button(action: action) {
            VStack(spacing: .spacingTwoXs) {
                textLabel
                indicatorBar
            }
            .padding(.vertical, .spacingSm)
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Subviews
    @ViewBuilder
    private var textLabel: some View {
        Text(title)
            .textStyle(.subheadlineBold)
            .foregroundStyle(isSelected ? activeColor : inactiveColor)
            .padding(.horizontal, .spacingMd)
            .animation(.easeInOut(duration: 0.3), value: isSelected)
    }
    
    @ViewBuilder
    private var indicatorBar: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(Color.clear)
                .frame(height: 2)
            
            Rectangle()
                .fill(activeColor)
                .frame(width: isSelected ? Self.indicatorWidth : 0, height: .spacingTwoXs)
                .cornerRadius(.radiusXs)
                .opacity(isSelected ? 1 : 0)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        }
    }
    
    // MARK: - Helpers
    private var activeColor: Color {
        Color.primaryValue500
    }
    
    private var inactiveColor: Color {
        Color.secondaryValue400
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        HStack {
            DDDTabItem(
                title: "Menú",
                isSelected: true,
                action: {}
            )
            
            DDDTabItem(
                title: "Información",
                isSelected: false,
                action: {}
            )
        }
        .padding()
    }
    .onAppear {
        Dodada.registerFonts()
    }
}
