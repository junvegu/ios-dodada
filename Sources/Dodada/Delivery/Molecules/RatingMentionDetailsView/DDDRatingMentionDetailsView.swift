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
            
            Divider().frame(height: .spacingSm)
            HStack{
                VStack(spacing: .spacingXs) {
                    Text("Calificaciones")
                        .textStyle(.caption2Bold)
                        .foregroundStyle(Color.secondaryValue400)
                    Text("\(rating, specifier: "%.1f")").textStyle(.title2Bold)
                    DDDRatingView(rating: .constant(Int(rating)))
                }
                Divider().frame(width: .spacingTwoXl, height: .spacingLg)
                
                VStack(spacing: .spacingXs) {
                    Text("Menciones")
                        .textStyle(.caption2Bold)
                        .foregroundStyle(Color.secondaryValue400)
                    Text("\(mentions)").textStyle(.title2Bold)
                    Text("Vlogs")
                        .textStyle(.caption2Bold)
                        .foregroundStyle(Color.secondaryValue500)
                }
                Divider().frame(width: .spacingTwoXl, height: .spacingLg)

                VStack(spacing: .spacingXs) {
                    Text("Detalles")
                        .textStyle(.caption2Bold)
                        .foregroundStyle(Color.secondaryValue400)
                    Text("\(facilities)").textStyle(.title2Bold)
                    Text("Facilidades")
                        .textStyle(.caption2Bold)
                        .foregroundStyle(Color.secondaryValue500)
                }
            }
            Divider().frame(height: .spacingSm)
            
        }.padding(.spacingSm)
        
    }
    
}

#Preview {
    DDDRatingMentionDetailsView(rating: 4.1, mentions: 1, facilities: 1)
}
