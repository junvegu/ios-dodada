//
//  DDDAsyncImage.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 22/06/24.
//

import Foundation
import SwiftUI

public struct DDDAsyncImage: View {
    private let url: String
    public init(url: String) {
        self.url = url
    }
    public var body: some View {
        AsyncImage(url:  URL.init(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()

            } else if phase.error != nil {
                Image(._404)
            } else {
                // Acts as a placeholder.
                ProgressView().progressViewStyle(.circular)
                // Image("Mickey Mouse")
            }
        }
    }
}
#Preview {
    DDDAsyncImage(url: "https://upload.wikimedia.org/wikipedia/commons/3/3a/Paris_Jackson_2021_02.jpg")
}
