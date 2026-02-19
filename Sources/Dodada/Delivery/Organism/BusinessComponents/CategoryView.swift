//
//  CategoryView.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 26/12/25.
//
import SwiftUI

public struct CategoryView: View {
    private let imageURL: URL?
    private let name: String
    
    public init(imageURL: URL?, name: String) {
        self.imageURL = imageURL
        self.name = name
    }

    public var body: some View {
        VStack(spacing: .spacingXs) {
            ZStack {
                Color.white
                if let imageURL = imageURL {
                    DDDAsyncImage(url: imageURL)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 32, height: 32)
                        .clipped()
                } else {
                    DDDIcon(.specialAquisito, color: .primaryValue500)
                }
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: .radiusMd))
            .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0, y: 0)

            Text(name)
                .textStyle(.caption2Bold)
                .foregroundStyle(Color.black)
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 60)
        }
    }
}


// Preview
struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            CategoryView(
                imageURL: URL(string: "https://cdn-icons-png.flaticon.com/512/3075/3075977.png"),
                name: "Anticucheria"
            )
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

