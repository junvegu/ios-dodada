//
//  RantingMentionsDetailView.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import Foundation
import SwiftUI
import Dodada

struct RantingMentionsDetailView: View {
    var body: some View {
        VStack(spacing: .zero) {
            DDDRatingMentionDetailsView(rating: 4.1, mentions: 3, facilities: 1)
            DDDRatingMentionDetailsView(rating: 4.21, mentions: 3, facilities: 1)

            DDDRatingMentionDetailsView(rating: 0, mentions: 666, facilities: 100)

        }
    }
}

#Preview {
    RantingMentionsDetailView()
}
