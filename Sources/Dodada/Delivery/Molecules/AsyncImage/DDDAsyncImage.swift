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
    private let url: String
    @State var isAnimating: Bool = true

    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        WebImage(
            url: URL(string:url))
        .resizable()
        .indicator(.activity)
        .transition(.fade(duration: 0.3))
        .background(
            Image(._404)
                .resizable()
                .scaledToFill()
        )
        .scaledToFill()
        .clipped()
      
        
    }
}
#Preview {
    VStack {
        DDDAsyncImage(url: "https://upload.wikimedia.org/wikipedia/commons/3/3a/Paris_Jackson_2021_02.jpg")
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        
        DDDAsyncImage(url: "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2024/03/17/17106774423813.jpg")
            .frame(width: 160, height: 160)
            .clipShape(Circle())
        
        DDDAsyncImage(url: "https://nolae.es/cdn/shop/articles/jennie-blackpink-profil-646657.jpg?v=1732634830&width=1200")
            .frame(width: 120, height: 120)
            .clipShape(Circle())
    

    }
}
