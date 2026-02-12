//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

public struct PasswordStrengthIndicator: View {
    
    private let passwordStrength: PasswordStrength
    
    public var body: some View {
        if text.isEmpty == false {
            HStack(spacing: .spacingMd) {
                indicator
                    .animation(.easeOut, value: passwordStrength)
                
                Text(text)
                // .textSize(.small)
                // .textColor(color)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            //.accessibility(.passwordStrengthIndicator)
        }
    }
    
    private var indicator: some View {
        Capsule()
        // .fill(.cloudNormal)
            .overlay(bar)
            .frame(height: .spacingTwoXs)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var bar: some View {
        HStack(spacing: 0) {
            Capsule()
                .fill(color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(0 ..< spacers, id: \.self) { _ in
                Spacer()
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    private var text: String {
        switch passwordStrength {
        case .weak(let title):     return title
        case .medium(let title):   return title
        case .strong(let title):   return title
        }
    }
    
    private var spacers: Int {
        switch passwordStrength {
        case .weak:     return 3
        case .medium:   return 1
        case .strong:   return 0
        }
    }
    
    private var color: Color {
        switch passwordStrength {
        case .weak:     return .red
        case .medium:   return .orange
        case .strong:   return .green
        }
    }
    
    public init(passwordStrength: PasswordStrengthIndicator.PasswordStrength) {
        self.passwordStrength = passwordStrength
    }
}

// MARK: - Types
public extension PasswordStrengthIndicator {
    
    enum PasswordStrength: Equatable {
        case weak(title: String)
        case medium(title: String)
        case strong(title: String)
    }
}
