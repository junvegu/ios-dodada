//
//  DDDFontsDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import SwiftUI
import Dodada

struct FontItem: Identifiable {
    var id: Int
    var item: DDDFontToken
    
    static func map() -> [FontItem] {
        var font: [FontItem] = []
        for item in DDDFontToken.allCases {
            font.append(FontItem(id: item.hashValue, item: item))
        }
        return font
    }
}

struct DDDFontsDetail: View {
    let fonts: [FontItem] = FontItem.map()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Regular").apply(token: .title3, weight: .bold)) {
                  
                    ForEach(fonts) { item in
                        Text(item.item.rawValue).apply(token: item.item, weight: .regular)
                    }
                }
                
                Section(header: Text("Bold").apply(token: .title3, weight: .bold)) {
                  
                    ForEach(fonts) { item in
                        Text(item.item.rawValue).apply(token: item.item, weight: .bold)
                    }
                }
                
                Section(header: Text("Underline").apply(token: .title3, weight: .bold)) {
                  
                    ForEach(fonts) { item in
                        Text(item.item.rawValue).apply(token: item.item, weight: .bold)
                            .underline()
                    }
                }
            }
        }
        .navigationTitle("Fonts")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    DDDFontsDetail()
}
