//
//  SwiftUIView.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import SwiftUI

struct DDDTagView: View {
    let label: String

    var body: some View {
        ZStack {
            Text(label)
                .apply(token: .caption2, weight: .bold)
                .padding(.xxSmall)
                .foregroundStyle(Asset.Colors.primary.swiftUIColor)
        }.overlay {
            RoundedRectangle(cornerRadius: .smallCornerRadius)
                .stroke(
                    Asset.Colors.primary.swiftUIColor,
                    lineWidth: .regularBorderWidth
                )
        }
    }
}

#Preview {
    DDDTagView(label: "Esternocleidomastoideo")
}
