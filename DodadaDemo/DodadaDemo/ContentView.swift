//
//  ContentView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 28/03/24.
//

import SwiftUI
import Dodada

enum DesingSystemMenu: String, CaseIterable, Hashable {
    case atoms = "Atoms"
    case molecules = "Molecules"
    case organisms = "Organisms"
    case templates = "Templates"
    case pages = "Pages"
}

struct MenuItem: Identifiable {
    let id: Int
    let type: DesingSystemMenu
    
    init(type: DesingSystemMenu) {
        self.id = type.hashValue
        self.type = type
    }
}
struct ContentView: View {
    let items: [MenuItem] = [
        .init(type: .atoms),
        .init(type: .molecules),
        .init(type: .organisms),
        .init(type: .templates),
        .init(type: .pages)
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { menu in
                    NavigationLink {
                        switch menu.type {
                        case .atoms:
                            DDDAtomsDetail()
                        default:
                            DDDColorsView()
                        }
                    } label: {
                        Text(menu.type.rawValue).apply(token: .title3, weight: .bold)
                    }
                }

                
            }
            .navigationTitle("Dodada")
            .listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    ContentView()
}
