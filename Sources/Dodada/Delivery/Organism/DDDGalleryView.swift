//
//  DDDGalleryView.swift
//  Dodada
//
//  Created on 27/01/25.
//

import SwiftUI
import SDWebImageSwiftUI

public struct DDDGalleryView: View {
    let imageURLs: [String]
    let title: String?
    @State private var selectedIndex: Int?
    
    public init(imageURLs: [String], title: String? = nil) {
        self.imageURLs = imageURLs
        self.title = title
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            if let title = title {
                HStack {
                    Text(title)
                        .apply(token: .headline, weight: .regular)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                    Spacer()
                    if !imageURLs.isEmpty {
                        Text("1/\(imageURLs.count)")
                            .apply(token: .caption1, weight: .bold)
                            .foregroundColor(Asset.Colors.secondary400.swiftUIColor)
                    }
                }
                .padding(.horizontal, .small)
            }
            
            if imageURLs.isEmpty {
                EmptyGalleryView()
            } else {
                GalleryGridView(
                    imageURLs: imageURLs,
                    onImageTap: { index in
                        selectedIndex = index
                    }
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(item: Binding(
            get: { selectedIndex.map { GalleryItem(index: $0) } },
            set: { _ in selectedIndex = nil }
        )) { item in
            FullScreenImageView(
                imageURLs: imageURLs,
                initialIndex: item.index
            )
        }
    }
}

private struct GalleryItem: Identifiable {
    let id: Int
    let index: Int
    
    init(index: Int) {
        self.id = index
        self.index = index
    }
}

private struct GalleryGridView: View {
    let imageURLs: [String]
    let onImageTap: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            if let firstImage = imageURLs.first {
                GalleryImageItem(
                    urlString: firstImage,
                    index: 0,
                    isLarge: true,
                    onTap: {
                        onImageTap(0)
                    }
                )
                .frame(height: 200)
            }
            
            if imageURLs.count > 1 {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: .xSmall),
                    GridItem(.flexible(), spacing: .xSmall)
                ], alignment: .leading, spacing: .xSmall) {
                    ForEach(Array(imageURLs.enumerated().dropFirst()), id: \.offset) { index, urlString in
                        GalleryImageItem(
                            urlString: urlString,
                            index: index + 1,
                            isLarge: false,
                            onTap: {
                                onImageTap(index + 1)
                            }
                        )
                        .frame(height: 150)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, .small)
    }
}

private struct GalleryImageItem: View {
    let urlString: String
    let index: Int
    let isLarge: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            GeometryReader { geometry in
                DDDAsyncImage(urlString: urlString)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .frame(height: isLarge ? 200 : 150)
            .clipShape(RoundedRectangle(cornerRadius: .regularCornerRadius))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

private struct FullScreenImageView: View {
    let imageURLs: [String]
    @State private var currentIndex: Int
    @Environment(\.dismiss) private var dismiss
    
    init(imageURLs: [String], initialIndex: Int) {
        self.imageURLs = imageURLs
        self._currentIndex = State(initialValue: initialIndex)
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(Array(imageURLs.enumerated()), id: \.offset) { index, urlString in
                    DDDAsyncImage(urlString: urlString)
                        .scaledToFill()
                        .ignoresSafeArea()
                        .blur(radius: 20)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .disabled(true)
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            
            
            TabView(selection: $currentIndex) {
                ForEach(Array(imageURLs.enumerated()), id: \.offset) { index, urlString in
                    DDDAsyncImage(urlString: urlString)
                        .scaledToFit()
                        .ignoresSafeArea()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("\(currentIndex + 1)/\(imageURLs.count)")
                        .apply(token: .callOut, weight: .regular)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, .medium)
                        .padding(.vertical, .small)
                        .background(
                            RoundedRectangle(cornerRadius: .regularCornerRadius)
                                .fill(.regularMaterial)
                        )
                        .padding(.trailing, .medium)
                        .padding(.bottom, .large)
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { value in
                    if value.translation.height > 100 {
                        dismiss()
                    }
                }
        )
    }
}

private struct EmptyGalleryView: View {
    var body: some View {
        VStack(spacing: .medium) {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 48))
                .foregroundColor(Asset.Colors.secondary400.swiftUIColor)
            Text("No hay imágenes disponibles")
                .apply(token: .body, weight: .regular)
                .foregroundColor(Asset.Colors.secondary400.swiftUIColor)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, .xLarge)
    }
}

#Preview {
    DDDGalleryView(imageURLs: [
        "https://cdn.shopify.com/s/files/1/0469/3927/5428/t/21/assets/bannerredvelvet-1669985736741.png?v=1669985742",
        "https://media.allure.com/photos/5b7b0983b60c70133b1eaaf0/16:9/w_1920,c_limit/Red%20Velvet%20Power%20Up.jpg",
        "https://nolae.es/cdn/shop/articles/jennie-blackpink-profil-646657.jpg?v=1732634830&width=1200",
        "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2024/03/17/17106774423813.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/3/3a/Paris_Jackson_2021_02.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/3/3a/Paris_Jackson_2021_02.jpg",
        "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2024/03/17/17106774423813.jpg",
        "https://nolae.es/cdn/shop/articles/jennie-blackpink-profil-646657.jpg?v=1732634830&width=1200"
    ])
}
