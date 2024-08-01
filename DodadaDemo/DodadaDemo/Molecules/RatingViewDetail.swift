//
//  RatingViewDetail.swift
//  DodadaDemo
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import SwiftUI
import Dodada

struct RatingViewDetail: View {
    @State var dynamicRating: Int = 0
    var body: some View {
        VStack(spacing: .large) {
            DDDButton("Tap me for increment start") {
                if dynamicRating == 5 {
                    dynamicRating = 0
                } else {
                    dynamicRating += 1
                }
            }
            DDDLabel("Dynamic")
            DDDRatingView(rating: $dynamicRating)
            DDDLabel("Static")
            DDDRatingView(rating: .constant(5))
            DDDRatingView(rating: .constant(4))
            DDDRatingView(rating: .constant(3))
            DDDRatingView(rating: .constant(2))
            DDDRatingView(rating: .constant(1))
        }
    }
}

#Preview {
    RatingViewDetail()
}
