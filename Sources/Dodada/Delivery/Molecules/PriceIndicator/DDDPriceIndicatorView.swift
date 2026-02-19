//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import Foundation
import SwiftUI
public enum LevelPrice: Int {
    case low = 1
    case medium = 2
    case high = 3
}
public struct DDDPriceIndicatorView: View {
    private let prices: [LevelPrice] = [.low, .medium, .high]
    let level: LevelPrice

    public init(level: LevelPrice) {
        self.level = level
    }
    
    public var body: some View {
        DDDFlexibleView(data: prices,
                        spacing: .spacingXs,
                        alignment: .leading
        ) { item in
            DDDPricingView(enabled: level.rawValue >= item.rawValue)
        }.frame(width: 60)
    }
}

#Preview {
    VStack {
        DDDPriceIndicatorView(level: .low)
        DDDPriceIndicatorView(level: .medium)
        DDDPriceIndicatorView(level: .high)
    }
}
