//
//  SwiftUIView.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 15/06/24.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(28)
            .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 0)
    }
}
public extension View {
    func applyShadow() -> some View {
        modifier(ShadowModifier())
    }
}
#Preview {
    VStack {
        Text("App of the day")
            .font(.title).bold()
            .foregroundColor(.white)
            .shadow(radius: 20)
    }
    .frame(width: 300, height: 400)
    .background(Color.pink)
    .applyShadow()
}
