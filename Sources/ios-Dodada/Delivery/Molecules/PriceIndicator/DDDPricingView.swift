//
//  SwiftUIView.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 18/04/24.
//

import SwiftUI

struct DDDPricingView: View {
    private let enabled: Bool

    public init(enabled: Bool = true) {
        self.enabled = enabled
    }

    var body: some View {
        HStack {
            DDDIcon(.dollarSign)
                .iconColor(.white)
                .iconSize(custom: .small)
        }
        .padding(.xxxSmall)
        .background(enabled ? Asset.Colors.secondary.swiftUIColor :
                        Asset.Colors.secondary200.swiftUIColor)
        .clipShape(Circle())
    }
}

#Preview {
    HStack {
        DDDPricingView()
        DDDPricingView(enabled: false)
        DDDPricingView(enabled: false)
    }
}
