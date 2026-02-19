//
//  DodadaIconToken+Image.swift
//  Dodada
//
//  Created by Junior Quevedo Gutiérrez  on 14/02/26.
//
import SwiftUI
import UIKit

public extension DodadaIconToken {
    func toImage() -> Image {
        Image(self.assetName, bundle: .module)
    }
    
    func toUIImage() -> UIImage {
        UIImage(named: self.assetName, in: .module, compatibleWith: nil) ?? UIImage()
    }
}

