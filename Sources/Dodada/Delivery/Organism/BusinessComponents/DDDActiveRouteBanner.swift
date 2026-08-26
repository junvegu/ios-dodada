//
//  DDDActiveRouteBanner.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 1/07/26.
//

import SwiftUI

public struct DDDActiveRouteBanner: View {
    private let sectionTitle: String
    private let label: String
    private let imageURL: String
    private let routeTitle: String
    private let progressText: String
    private let buttonTitle: String
    private let onButtonTap: () -> Void
    
    public init(
        sectionTitle: String,
        label: String,
        imageURL: String,
        routeTitle: String,
        progressText: String,
        buttonTitle: String,
        onButtonTap: @escaping () -> Void
    ) {
        self.sectionTitle = sectionTitle
        self.label = label
        self.imageURL = imageURL
        self.routeTitle = routeTitle
        self.progressText = progressText
        self.buttonTitle = buttonTitle
        self.onButtonTap = onButtonTap
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .spacingLg) {
            
            DDDSection(title: sectionTitle)
                .foregroundStyle(Color.secondaryValue500)
            
            ZStack(alignment: .leading) {
                DDDAsyncImage(urlString: imageURL)
                    .frame(maxWidth: .infinity, minHeight: 140, maxHeight: 140)
                    .clipped()
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.25),
                                Color.black.opacity(0.5),
                                Color.black.opacity(0.7)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                HStack{
                    VStack {
                        VStack(alignment: .leading, spacing: .spacingXs) {
                            
                            HStack(spacing: .spacingXs) {
                                DDDIcon(.arrowsUpRight, color: .primaryValue500, size: .iconXs)
                                Text(label)
                                    .textStyle(.caption1Regular)
                                    .foregroundStyle(Color.neutralZero.opacity(0.8))
                            }
                            
                            Text(routeTitle)
                                .textStyle(.title3Bold)
                                .foregroundStyle(Color.neutralZero)
                                .lineLimit(2)
                            
                            Text(progressText)
                                .textStyle(.caption1Regular)
                                .foregroundStyle(Color.neutralZero.opacity(0.8))
                        }
                    }
                    
                    VStack{
                        
                        DDDButton(buttonTitle, desing: .primary, size: .small ,action: onButtonTap)
                            .padding(.leading, 60)
                        
                    }
                }.padding(.horizontal, .spacingLg)
                    
            }
            .frame(width: 358, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: .radiusXl, style: .continuous))
            .padding(.horizontal, .spacingLg)
        }
    }
}

#if PREVIEW || DEBUG
#Preview {
    DDDActiveRouteBanner(
        sectionTitle: "Continúa explorando",
        label: "Ruta activa",
        imageURL: "https://picsum.photos/seed/ceviche/800/400",
        routeTitle: "Ruta del ceviche",
        progressText: "1 de 4 paradas completadas",
        buttonTitle: "Continuar",
        onButtonTap: {}
    )
}
#endif
