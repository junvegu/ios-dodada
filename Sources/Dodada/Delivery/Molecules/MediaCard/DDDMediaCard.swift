//
//  DDDMediaCard.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 10/04/25.
//

import SwiftUI
import SDWebImageSwiftUI

public struct DDDMediaCard: View {
    let imageURL: URL?
    let text: String
    let views: String
    let isLive: Bool
    let author: String
    
    public init(imageURL: URL?, text: String, views: String, isLive: Bool, author: String) {
        self.imageURL = imageURL
        self.text = text
        self.views = views
        self.isLive = isLive
        self.author = author
    }
    
    public var body: some View {
        VStack (alignment: .leading){
            
            VStack{
                VStack{
                    HStack {
                        DDDBadge(text: views, icon: .userEye, type: .filled, state: .secondary)
                        Spacer()
                        if isLive{
                            DDDBadge(text: "Live", icon: .trendingZap, type: .filled, state: .default)
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 8)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text(text)
                            .textStyle(.subheadlineBold)
                    }.foregroundColor(.white)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 8)
                    
                }
                .frame(width: 164,height: 192)
                .background(
                    WebImage(url: imageURL)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 164, height: 192)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                )
                .padding(.trailing, 16)
                .padding(.bottom, 16)
            }
            
            VStack(alignment: .leading){
                Text("TikTok")
                    .textStyle(.caption2Bold)
                Text(author)
                    .textStyle(.subheadlineBold)
            }
        }
        .frame(width: 164, height: 233)
    }
}

#Preview {
    DDDMediaCard(imageURL: URL(string: "https://www.biografia.de/biografia/Emma-Myers.jpg"), text: "Emma Myers, my love, her is so cute", views: "2.5k", isLive: false, author: "Fxkrzn")
}
