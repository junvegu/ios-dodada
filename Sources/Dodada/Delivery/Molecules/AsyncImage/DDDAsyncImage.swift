//
//  DDDAsyncImage.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 22/06/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

/// Async image wrapper built on top of `SDWebImageSwiftUI`.
///
/// Features:
/// - Native activity indicator while loading.
/// - Smooth fade + blur animation when the image loads.
/// - Fallback error image when URL is nil or loading fails.
/// - Designed to be clipped and sized externally.
///
/// Example:
/// ```swift
/// DDDAsyncImage(urlString: "https://...")
///   .frame(width: 120, height: 120)
///   .clipShape(Circle())
/// ```
public struct DDDAsyncImage: View {

    // MARK: - Properties

    private let imageURL: URL?
    @State private var isLoaded = false
    @State private var didFail = false

    // MARK: - Initializers

    /// Creates an async image from a string URL.
    ///
    /// - Parameter urlString: String representation of the remote URL.
    ///   If invalid or nil, a fallback error image will be shown.
    public init(urlString: String?) {
        let trimmed = (urlString ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        self.imageURL = URL(string: trimmed)
    }

    /// Creates an async image from a URL.
    ///
    /// - Parameter url: Remote image URL. If nil, a fallback error image will be shown.
    public init(url: URL?) {
        self.imageURL = url
    }

    // MARK: - Body

    public var body: some View {
        ZStack {
            if imageURL != nil, !didFail, !isLoaded {
                ProgressView()
                    .transition(.opacity)
            }

            if imageURL == nil || didFail {
                Image(._404)
                    .resizable()
                    .scaledToFill()
                    .transition(.opacity)
            }

            if let url = imageURL, !didFail {
                WebImage(url: url)
                    .resizable()
                    .onSuccess { _, _, _ in
                        withAnimation(.easeOut(duration: 0.28)) {
                            isLoaded = true
                        }
                    }
                    .onFailure { _ in
                        withAnimation(.easeOut(duration: 0.2)) {
                            didFail = true
                        }
                    }
                    .opacity(isLoaded ? 1 : 0.001)
                    .blur(radius: isLoaded ? 0 : 10)
                    .animation(.easeOut(duration: 0.28), value: isLoaded)
                    .scaledToFill()
            }
        }
        .clipped()
        .onChange(of: imageURL) { _ in
            isLoaded = false
            didFail = false
        }
    }
}

#Preview {
    
    VStack {
        
        
        DDDAsyncImage(urlString: "https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png")
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        DDDAsyncImage(urlString: "https://upload.wikimedia.org/wikipedia/commons/3/3a/Paris_Jackson_2021_02.jpg")
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        
        DDDAsyncImage(urlString: "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2024/03/17/17106774423813.jpg")
            .frame(width: 160, height: 160)
            .clipShape(Circle())
        
        DDDAsyncImage(urlString: "https://nolae.es/cdn/shop/articles/jennie-blackpink-profil-646657.jpg?v=1732634830&width=1200")
            .frame(width: 120, height: 120)
            .clipShape(Circle())
        
        
    }
}
