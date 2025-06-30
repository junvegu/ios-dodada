//
//  SwiftUIView.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import SwiftUI

struct DDDTagView: View {
    @Environment(\.colorTheme) private var colorTheme: DDDTheme
    let label: String
    var invert: Bool = false

    var body: some View {
        Text(label)
            .apply(token: .caption2, weight: .bold)
            .padding(.xxSmall)
            .frame(minHeight: 28)
            .foregroundStyle(invert ? Color.white : Asset.Colors.primary.swiftUIColor)
            .background(
                invert
                ? Asset.Colors.primary.swiftUIColor
                : Color.clear
            )
            .overlay(
                RoundedRectangle(cornerRadius: .smallCornerRadius)
                    .stroke(
                        invert ? Color.clear : colorTheme.defaultButton,
                        lineWidth: .regularBorderWidth
                    )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: .smallCornerRadius)
            )
    }
}


#Preview {
    DDDTagView(label: "Esternocleidomastoideo", invert: true)
}
