//
//  DDDShadow.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 5/02/26.
//
import SwiftUI

public struct DDDShadow: Equatable, Sendable {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}
