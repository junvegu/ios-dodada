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
    private var offImage: DDDIcon?
    private var onImage = DDDIcon(.star)
    private var offColor = Asset.Colors.secondary200.swiftUIColor
    private var onColor = Color.yellow
    
    public init(rating: Binding<Int>, label: String = "", maximumRating: Int = 5) {
        _rating = rating
        self.maximumRating = maximumRating
        self.label = label
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            if label.isEmpty == false {
                Text(label).apply()
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number).iconColor(number > rating ? offColor : onColor)
                }
            }
        }.iconSize(custom: .small)
    }
    func image(for number: Int) -> DDDIcon {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    DDDRatingView(rating: .constant(4))
}
