//
//  SwiftUIView.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import SwiftUI

public struct DDDListTagView<Data: Collection>: View where Data.Element == String {
    let data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    public var body: some View {
        DDDFlexibleView(data: data,
                        spacing: .xxSmall,
                        alignment: .leading
        ) { item in
            DDDTagView(label: item)
        }
    }
}

#Preview {
    DDDListTagView(data: ["Taza", "Tetera", "cuchara", "Cucharon", "Plato Hondo", "PLato Llano", "Cuchillito", "Tenedor"])
}
