//
//  DDDCardNotification.swift
//  Dodada
//
//  Created by Aly Benjamin Contreras Del Pino on 28/04/26.
//

import SwiftUI

public struct DDDCardNotification: View {
    public let title: String
    public let descriptionText: String
    public let timeText: String
    public let showUnreadBadge: Bool
    
    public init(
        title: String,
        descriptionText: String,
        timeText: String,
        showUnreadBadge: Bool = false
    ) {
        self.title = title
        self.descriptionText = descriptionText
        self.timeText = timeText
        self.showUnreadBadge = showUnreadBadge
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            headerView
            
            contentView
        }
    }
    
    // MARK: - ViewBuilders
    
    @ViewBuilder
    private var headerView: some View {
        HStack(alignment: .center, spacing: 12) {
            ZStack(alignment: .bottomTrailing) {
                Circle()
                    .fill(Color.primaryValue500)
                    .frame(width: 32, height: 32)
                    .overlay(
                        DDDIcon(.specialAquisito, color: .neutralZero, size: .iconSm)
                    )
                
                if showUnreadBadge {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 12, height: 12)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 2)
                        )
                        .offset(x: 2, y: 2)
                }
            }
            
            Text(title)
                .textStyle(.headlineBold)
                .foregroundColor(.secondaryValue500)
            
            Spacer()
            
            Text(timeText)
                .textStyle(.footnoteBold)
                .foregroundColor(.secondaryValue400)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        Text(descriptionText)
            .textStyle(.subheadlineRegular)
            .foregroundColor(.secondaryValue500)
            .multilineTextAlignment(.leading)
    }
}

// MARK: - Preview
struct DDDCardNotification_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 16) {
                DDDCardNotification(
                    title: "Tienes una promoción especial!!",
                    descriptionText: "Aprovecha nuestras ofertas exclusivas y ahorra en tus compras. Estas promociones son limitadas, así que no te las pierdas.",
                    timeText: "5 min",
                    showUnreadBadge: true
                )
                
                DDDCardNotification(
                    title: "No te pierdas nuestras novedades!!",
                    descriptionText: "Descubre lo que tenemos para ti y sorpréndete con nuestra amplia variedad de productos. Desde tecnología hasta moda, hay algo para todos los gustos.",
                    timeText: "3 h",
                    showUnreadBadge: false
                )
            }
            .padding()
        }
    }
}
