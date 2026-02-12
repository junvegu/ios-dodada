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
            .textStyle(.caption2Bold)
            .padding(.spacingTwoXs)
            .frame(minHeight: 28)
            .foregroundStyle(invert ? Color.white : colorTheme.defaultButton)
            .background(
                invert
                ? colorTheme.defaultButton
                : Color.clear
            )
            .overlay(
                RoundedRectangle(cornerRadius: .radiusXs)
                    .stroke(
                        invert ? Color.clear : colorTheme.defaultButton,
                        lineWidth: .lineHeightLoose
                    )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: .radiusXs)
            )
    }
}


#Preview {
    DDDTagView(label: "Esternocleidomastoideo", invert: true)
}
