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
    
    // MARK: - Properties
    private let title: String
    private let isSelected: Bool
    private let action: () -> Void
    
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
            VStack(spacing: .zero) {
                Text(title)
                    .textStyle(.subheadlineBold)
                    .foregroundStyle(isSelected ? activeColor : inactiveColor)
                    .animation(.easeInOut(duration: 0.3), value: isSelected)
                    .padding(.horizontal, .medium)
                
                ZStack(alignment: .center) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 2)
                    
                    Rectangle()
                        .fill(activeColor)
                        .frame(width: isSelected ? 20 : 0, height: 2)
                        .opacity(isSelected ? 1 : 0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
                }
            }
            .padding(.vertical, .small)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Computed Properties
    private var activeColor: Color {
        Color.primaryValue500
    }
    
    private var inactiveColor: Color {
        Color.secondaryValue300
    }
}

// MARK: - Preview

#Preview {
    ZStack {
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
   
}

