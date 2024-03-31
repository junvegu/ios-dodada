//
//  DDDColorsView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import SwiftUI

struct DDDColorsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            VStack {
                Rectangle().foregroundColor(Color.designSystem.defaultButton)
                Rectangle().foregroundColor(Color.designSystem.disabledButton)
                Rectangle().foregroundColor(Color.designSystem.disabledText)
                Rectangle().foregroundColor(Color.designSystem.enabledText)
                Rectangle().foregroundColor(Color.designSystem.error)
                Rectangle().foregroundColor(Color.designSystem.hoverButton)
                Rectangle().foregroundColor(Color.designSystem.info)
                Rectangle().foregroundColor(Color.designSystem.navigationBackground)
                Rectangle().foregroundColor(Color.designSystem.pressedButton)
                Rectangle().foregroundColor(Color.designSystem.success)
                Rectangle().foregroundColor(Color.designSystem.tintBarButton)
                Rectangle().foregroundColor(Color.designSystem.tintTabBar)
                Rectangle().foregroundColor(Color.designSystem.warning)
                Rectangle().foregroundColor(Color.designSystem.titleNavigationBar)
            }
        }
        .navigationTitle("Colors")
        .background(Color.mint)
    }
}

#Preview {
    DDDColorsView()
}
