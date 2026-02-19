//
//  SwiftUIView.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import SwiftUI

public struct DDDTagView: View {
    @Environment(\.colorTheme) private var colorTheme: DDDTheme
    let label: String
    var invert: Bool = false

    public var body: some View {
        Text(label)
            .textStyle(.caption2Bold)
            .padding(.spacingXs)
            .frame(minHeight: 28)
            .foregroundStyle(invert ? Color.white : Color.primaryValue500)
            .background(
                invert
                ? Color.primaryValue500
                : Color.clear
            )
            .overlay(
                RoundedRectangle(cornerRadius: .radiusSm)
                    .stroke(
                        invert ? Color.clear : Color.primaryValue500,
                        lineWidth: .radiusXs
                    )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: .radiusSm)
            )
    }
}


#Preview {
    DDDTagView(label: "Esternocleidomastoideo", invert: false)
}
