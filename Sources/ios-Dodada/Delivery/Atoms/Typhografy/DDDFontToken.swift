//
//  DDDFontToken.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI
public enum DDDFontToken: String, CaseIterable {
    case caption2Regular
    case caption1Regular
    case footNoteRegular
    case subheadlineRegular
    case callOutRegular
    case bodyRegular
    case headlineRegular
    case title3Regular
    case title2Regular
    case title1Regular
    case largeTitleRegular
    
    case caption2Bold
    case caption1Bold
    case footNoteBold
    case subheadlineBold
    case callOutBold
    case bodyBold
    case headlineBold
    case title3Bold
    case title2Bold
    case title1Bold
    case largeTitleBold
    
    case caption2Underline
    case caption1Underline
    case footNoteUnderline
    case subheadlineUnderline
    case callOutUnderline
    case bodyUnderline
    case headlineUnderline
    case title3Underline
    case title2Underline
    case title1Underline
    case largeTitleUnderline
    
    
    
    //MARK: - MALA FORMA o mejor dicho no es practica
   /*
    let testFont = Font.init(name: "Quicksand-Bold.ttf", size: 14)
    let test image = ImageAsset(name: "chevron-right")
    */
    
    //MARK: - Forma reducida
   
    func test() {
        let font = FontFamily.Quicksand.bold.font(size: 14) // fuente
        let image = Asset.Assets.chevronRight.image // imagen
        
        let color = Asset.Colors.primary // Color
        
        let pruebaDeAccesos = XDD()
        let pruebaDeAccesos2 = XD()
       // let pruebaDeAccesos3 = XDDD() ERROR
    }
 
}
