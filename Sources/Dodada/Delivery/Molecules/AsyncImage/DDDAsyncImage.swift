//
//  DDDAsyncImage.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 22/06/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

public struct DDDAsyncImage: View {
    private let imageURL: URL?
    
    public init(urlString: String?) {
        self.imageURL = URL(string: urlString ?? "")
    }
    
    public init(url: URL?) {
        self.imageURL = url
    }

    public var body: some View {
        WebImage(url: imageURL)
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.3))
            .scaledToFill()
            .clipped()
            .background(
                imageURL == nil ?
                    Image(._404) // error si no hay URL
                        .resizable()
                        .scaledToFill()
                    : nil
            )
    }
}

#Preview {
    
    VStack {
        
    DDDAsyncImage(urlString: "https://netzun.com/_nuxt/img/siu.2cb6881.svg")
        .frame(height: 200)
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
