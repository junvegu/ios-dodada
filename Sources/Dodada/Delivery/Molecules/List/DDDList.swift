//
//  DDDList.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 3/05/26.
//

import SwiftUI

public struct DDDList: View {
    public let title: String
    public let subtitle: String
    public let imageURL: String
    public let onTap: () -> Void
    
    private let imageSize: CGFloat = 88
    private let horizontalGap: CGFloat = 8
    private let paddingRight: CGFloat = 16
    private let paddingBottom: CGFloat = 40
    
    public init(title: String, subtitle: String, imageURL: String?, onTap: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL ?? ""
        self.onTap = onTap
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: horizontalGap) {
            // MARK: - Image
            VStack {
                if !imageURL.isEmpty {
                    DDDAsyncImage(urlString: imageURL)
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .cornerRadius(8)
                        .clipped()
                } else {
                    ZStack {
                        Color.secondaryValue100
                        
                        Image("Route", bundle: .module)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                    }
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(8)
                }
            }
            
            // MARK: - Texts
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .textStyle(.subheadlineBold)
                    .foregroundColor(.secondaryValue500)
                
                Text(subtitle)
                    .textStyle(.caption2Bold)
                    .foregroundColor(.secondaryValue400)
                
                
            }
            .padding(.trailing, paddingRight)
            .padding(.bottom, paddingBottom)
            
            Spacer()
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    VStack{
        DDDList(
            title: "Comida criolla",
            subtitle: "20 platos",
            imageURL: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200"
        )
        
        DDDList(
            title: "Comida criolla",
            subtitle: "20 platos",
            imageURL: ""
        )
    }.padding(.horizontal)
}
