//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 14/06/24.
//

import Foundation
import SwiftUI

public struct DDDChipButton: View {
    private let action: (ChipModel) -> Void
    private let model: ChipModel
    @State var isSelected: Bool
    @Environment(\.colorTheme) private var colorTheme: DDDTheme

    init(
        model: ChipModel,
        isSelected: Bool,
        action: @escaping (ChipModel) -> Void
    ) {
        self.action = action
        self.isSelected = isSelected
        self.model = model
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            
            Text(model.titleKey)
                .textStyle(.subheadlineBold)
                .foregroundColor(isSelected ? .white : .black )
                .lineLimit(1)
            Image(systemName: model.systemImage).font(.body)
                .foregroundColor(isSelected ? .white : colorTheme.hoverButton )
        }
        .frame(height: 34)
        .padding(.vertical, 4)
        .padding(.leading, 12)
        .padding(.trailing, 8)
        .background(isSelected ? colorTheme.hoverButton : Color.clear)
        .cornerRadius(50)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(colorTheme.hoverButton, lineWidth: 1.5)
            
        ).onTapGesture {
            isSelected.toggle()
            action(model)
        }
    }
}

struct DDDChipButton_Previews: PreviewProvider {
    static var previews: some View {
        DDDChipButton(model: .init(
            isSelected: false,
            systemImage: "xmark.circle.fill",
            titleKey: "Title"
        ),
                      isSelected: false,
                      action: {
            _ in
            
        })
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
