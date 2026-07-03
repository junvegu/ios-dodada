//
//  DDDPlaceThumbnail.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDPlaceThumbnail: View {
    private let imageURL: String
    private let title: String
    private let imageSize: CGFloat = 70

    public init(imageURL: String, title: String) {
        self.imageURL = imageURL
        self.title = title
    }

    public var body: some View {
        VStack(alignment: .center, spacing: .spacingXs) {
            DDDAsyncImage(urlString: imageURL)
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(.radiusXl)

            Text(title)
                .textStyle(.caption1Regular)
                .foregroundStyle(Color.secondaryValue500)
                .lineLimit(1)
                .frame(width: imageSize + .spacingSm)
                .multilineTextAlignment(.center)
        }
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDPlaceThumbnail(
        imageURL:  "https://mx.web.img2.acsta.net/c_310_420/pictures/22/11/29/19/54/5215983.jpg",
        title: "Lo mejor"
    )
}
#endif
