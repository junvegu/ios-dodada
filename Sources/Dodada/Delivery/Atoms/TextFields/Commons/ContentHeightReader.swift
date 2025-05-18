//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

public struct ContentHeightReader<Content: View>: View {

    @Binding var height: CGFloat
    @ViewBuilder let content: Content

    public var body: some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: proxy.size.height)
                }
            )
        .onPreferenceChange(SizePreferenceKey.self) { preferences in
            self.height = preferences
        }
    }

    public init(height: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._height = height
        self.content = content()
    }
}
