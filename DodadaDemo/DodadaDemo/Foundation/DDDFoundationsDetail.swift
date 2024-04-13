//
//  DDDAtomsDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 30/03/24.
//

import SwiftUI

struct DDDFoundationsDetail: View {
    var body: some View {
        List {
            NavigationLink {
                DDDColorsView()
            } label: {
                Text("Colors").apply(token: .title3, weight: .bold)
            }
            
            NavigationLink {
                DDDFontsDetail()
            } label: {
                Text("Fonts").apply(token: .title3, weight: .bold)
            }
            
            NavigationLink {
                DDDIconFoundationView()
            } label: {
                Text("Icons").apply(token: .title3, weight: .bold)
            }
        }
        .navigationTitle("Foundations")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    DDDFoundationsDetail()
}
