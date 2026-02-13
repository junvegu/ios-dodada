//
//  DDDPageIndicator.swift
//  Dodada
//
//  Created on 27/01/25.
//

import SwiftUI

public struct DDDPageIndicator: View {
    let numberOfPages: Int
    @Binding var currentPage: Int
    
    private let dotSize: CGFloat = 8
    private let activeDotWidth: CGFloat = 24
    private let spacing: CGFloat = 8
    
    public init(numberOfPages: Int, currentPage: Binding<Int>) {
        self.numberOfPages = numberOfPages
        self._currentPage = currentPage
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background dots (inactive)
                HStack(spacing: spacing) {
                    ForEach(0..<numberOfPages, id: \.self) { index in
                        Circle()
                            .fill(Color.secondaryValue300)
                            .frame(width: dotSize, height: dotSize)
                    }
                }
                
                // Active sliding indicator
                Capsule()
                    .fill(Color.primaryValue500)
                    .frame(width: activeDotWidth, height: dotSize)
                    .offset(x: calculateActiveOffset(in: geometry.size.width))
                    .animation(.spring(response: 0.35, dampingFraction: 0.75), value: currentPage)
            }
        }
        .frame(height: dotSize)
    }
    
    private func calculateActiveOffset(in totalWidth: CGFloat) -> CGFloat {
        let dotAndSpacing = dotSize + spacing
        let totalDotsWidth = CGFloat(numberOfPages) * dotSize + CGFloat(numberOfPages - 1) * spacing
        let startOffset = (totalWidth - totalDotsWidth) / 2
        
        // Calculate position of active dot
        let activeDotPosition = CGFloat(currentPage) * dotAndSpacing
        
        // Center the active indicator on the dot
        let activeIndicatorOffset = activeDotPosition - (activeDotWidth - dotSize) / 2
        
        return startOffset + activeIndicatorOffset
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var currentPage = 0
        
        var body: some View {
            VStack(spacing: 40) {
                DDDPageIndicator(numberOfPages: 5, currentPage: $currentPage)
                    .frame(width: 200)
                
                HStack(spacing: 20) {
                    Button("Previous") {
                        withAnimation {
                            currentPage = max(0, currentPage - 1)
                        }
                    }
                    
                    Text("\(currentPage + 1) / 5")
                        .textStyle(.calloutBold)
                    
                    Button("Next") {
                        withAnimation {
                            currentPage = min(4, currentPage + 1)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    return PreviewWrapper()
}
