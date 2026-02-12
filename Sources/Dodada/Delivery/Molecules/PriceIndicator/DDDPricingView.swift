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
            DDDIcon(.paymentDollarSign, color: .textOnPrimary, size: .iconSm)
        }
        .padding(.spacingTwoXs)
        .background(enabled ? Color.secondaryValue500 : Color.secondaryValue200)
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
