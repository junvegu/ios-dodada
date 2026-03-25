//
//  SwiftUIView.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import SwiftUI

public struct DDDListTagView<Data: Collection>: View where Data.Element == String {
    let data: Data
    let invert: Bool
    
    public init(data: Data, _ invert: Bool = false) {
        self.data = data
        self.invert = invert
    }
    
    public var body: some View {
        DDDFlexibleView(data: data,
                        spacing: .spacingXs,
                        alignment: .leading
        ) { item in
            DDDTagView(label: item, invert: invert)
        }
    }
}

#Preview {
    DDDListTagView(data: ["Taza", "Tetera", "cuchara", "Cucharon", "Plato Hondo", "PLato Llano", "Cuchillito", "Tenedor"])
}
