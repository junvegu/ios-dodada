//
//  SwiftUIView.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 31/05/24.
//

import SwiftUI

public struct DDDRatingView: View {

    @Binding var rating: Int

    private let label: String
    private let maximumRating: Int
    private var offImage: DodadaIconToken?
    private var onImage: DodadaIconToken = .contentStar
    private var offColor = Color.secondaryValue200
    private var onColor = Color.yellow
    
    public init(rating: Binding<Int>, label: String = "", maximumRating: Int = 5) {
        _rating = rating
        self.maximumRating = maximumRating
        self.label = label
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            if label.isEmpty == false {
                Text(label).textStyle(.caption2Regular)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    let iconImage = image(for: number)
                    DDDIcon(iconImage, color: number > rating ? .secondaryValue200 : nil, size: .iconSm)
                }
            }
        }
    }
    func image(for number: Int) -> DodadaIconToken {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    DDDRatingView(rating: .constant(4))
}
