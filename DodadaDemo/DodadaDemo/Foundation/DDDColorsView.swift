//
//  DDDColorsView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import SwiftUI
import Dodada

struct ViewColor: Identifiable {
    let color: Color
    let id: Int
    let name: String
}

struct DDDColorsView: View {
    
    var items: [ViewColor] = [
        ViewColor.init(color: .designSystem.defaultButton, id: 1, name: "defaultButton"),
        ViewColor.init(color: .designSystem.disabledButton, id: 2, name: "disabledButton"),
        ViewColor.init(color: .designSystem.disabledText, id: 3, name: "disabledText"),
        ViewColor.init(color: .designSystem.enabledText, id: 4, name: "enabledText"),
        ViewColor.init(color: .designSystem.error, id: 5, name: "error"),
        ViewColor.init(color: .designSystem.hoverButton, id: 6, name: "hoverButton"),
        ViewColor.init(color: .designSystem.info, id: 7, name: "info"),
        ViewColor.init(color: .designSystem.navigationBackground, id: 8, name: "navigationBackground"),
        ViewColor.init(color: .designSystem.pressedButton, id: 9, name: "pressedButton"),
        ViewColor.init(color: .designSystem.success, id: 10, name: "success"),
        ViewColor.init(color: .designSystem.tintBarButton, id: 11, name: "tintBarButton"),
        ViewColor.init(color: .designSystem.tintTabBar, id: 12, name: "tintTabBar"),
        ViewColor.init(color: .designSystem.titleNavigationBar, id: 13, name: "titleNavigationBar"),
        ViewColor.init(color: .designSystem.warning, id: 14, name: "warning"),
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            List {
                
                ForEach(items) { color in
                    Rectangle().foregroundColor(color.color)
                        .overlay {
                            VStack {
                                Text(color.name)
                                    .apply(token: .title2, weight: .bold)
                                    .underline()
                                Text("#" + (color.color.toHex(alpha: true) ?? ""))
                                    .apply(token: .title2, weight: .bold)
                            }

                        }.frame(height: 100)
                }
            }.listStyle(GroupedListStyle())
        }
        .navigationTitle("Colors")
        .background(Color.mint)
    }
}

#Preview {
    DDDColorsView()
}
