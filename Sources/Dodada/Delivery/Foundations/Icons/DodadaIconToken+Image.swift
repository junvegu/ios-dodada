//
//  DodadaIconToken+Image.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 14/02/26.
//
import SwiftUI
public extension DodadaIconToken {
    func toImage() -> Image {
        Image(self.assetName, bundle: .module)
    }
}

