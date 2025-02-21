//
//  File.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import Foundation
import SwiftUI

public struct DDDRatingMentionDetailsView: View {
    private let rating: Double
    private let mentions: Int
    private let facilities: Int
    
    public init(rating: Double, mentions: Int, facilities: Int) {
        self.rating = rating
        self.mentions = mentions
        self.facilities = facilities
    }
    
    public var body: some View {
        VStack {
            
            Divider().frame(height: .small)
            HStack{
                VStack(spacing: .xSmall) {
                    Text("Calificaciones")
                        .apply(token: .caption2, weight: .bold)
                        .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
                    Text("\(rating, specifier: "%.1f")").apply(token: .title2, weight: .bold)
                    DDDRatingView(rating: .constant(Int(rating)))
                }
                Divider().frame(width: .xxLarge, height: .large)
                
                VStack(spacing: .xSmall) {
                    Text("Menciones")
                        .apply(token: .caption2, weight: .bold)
                        .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
                    Text("\(mentions)").apply(token: .title2, weight: .bold)
                    Text("Vlogs")
                        .apply(token: .caption2, weight: .bold)
                        .foregroundStyle(Asset.Colors.secondary.swiftUIColor)
                }
                Divider().frame(width: .xxLarge, height: .large)

                VStack(spacing: .xSmall) {
                    Text("Detalles")
                        .apply(token: .caption2, weight: .bold)
                        .foregroundStyle(Asset.Colors.secondary400.swiftUIColor)
                    Text("\(facilities)").apply(token: .title2, weight: .bold)
                    Text("Facilidades")
                        .apply(token: .caption2, weight: .bold)
                        .foregroundStyle(Asset.Colors.secondary.swiftUIColor)
                }
            }
            Divider().frame(height: .small)
            
        }.padding(.small)
        
    }
    
}

#Preview {
    DDDRatingMentionDetailsView(rating: 4.1, mentions: 1, facilities: 1)
}
