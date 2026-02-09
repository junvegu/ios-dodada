//
//  DDDTabBar.swift
//  Dodada UI Component
//
//  Created by Junior Quevedo Gutierrez on 1/03/25.
//

import SwiftUI

/// A horizontal scrollable tab bar component for Dodada.
/// Displays multiple tabs with an active state indicator (underline).
/// Each tab has its natural width and the bar can be scrolled horizontally.
public struct DDDTabBar: View {
    
    // MARK: - Properties
    @Binding private var selectedIndex: Int
    private let tabs: [String]
    
    // MARK: - Initializer
    /// Creates a `DDDTabBar` component.
    ///
    /// - Parameters:
    ///   - tabs: Array of tab titles to display.
    ///   - selectedIndex: Binding to the currently selected tab index.
    public init(
        tabs: [String],
        selectedIndex: Binding<Int>
    ) {
        self.tabs = tabs
        self._selectedIndex = selectedIndex
    }
    
    // MARK: - Body
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                    DDDTabItem(
                        title: tab,
                        isSelected: selectedIndex == index,
                        action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedIndex = index
                            }
                        }
                    )
                }
            }
        }
        .background(Color.white)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectedIndex)
    }
}

// MARK: - Preview

#Preview {
    struct ContentView: View {
        @State private var selectedIndex: Int = 0
        
        var body: some View {
            VStack(spacing: 20) {
                DDDTabBar(
                    tabs: ["Menú", "Información", "Atención", "Calificación", "asddazcas"],
                    selectedIndex: $selectedIndex
                )
                
                Text("Tab seleccionado: \(selectedIndex)")
                    .textStyle(.bodyRegular)
                
                Spacer()
            }
            .padding()
        }
    }
    
    return ContentView()
}

