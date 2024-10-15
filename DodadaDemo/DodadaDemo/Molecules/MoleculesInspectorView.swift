//
//  MoleculesInspectorView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import Foundation

import SwiftUI

struct MoleculesInspectorView: View {
    var body: some View {
        List {
            NavigationLink {
                DDDTagViewDetail()
            } label: {
                Text("TagCategories").apply(token: .title3, weight: .bold)
            }
            
            NavigationLink {
                PricinViewDetail()
            } label: {
                Text("PricingView").apply(token: .title3, weight: .bold)
            }

            NavigationLink {
                NotificationMessageViewDetail()
            } label: {
                Text("Notification Message").apply(token: .title3, weight: .bold)
            }
            
            NavigationLink {
                RatingViewDetail()
            } label: {
                Text("Rating View").apply(token: .title3, weight: .bold)
            }
            
            NavigationLink {
                RantingMentionsDetailView()
            } label: {
                Text("Rating mentions Detailk").apply(token: .title3, weight: .bold)
            }
            
            NavigationLink {
                PhoneInputDetailView()
            } label: {
                Text("Phone Input").apply(token: .title3, weight: .bold)
            }
        }
        .navigationTitle("Molecules")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    MoleculesInspectorView()
}
