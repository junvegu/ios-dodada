//
//  DDDFont.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 20/01/24.
//

import Foundation
import SwiftUI

struct DDDFont {
    let fontName: String
    let fontSize: CGFloat
    let textCase: TextCase
    let textDecoration: TextDecoration
    let letterSpacingPercentage: CGFloat
    let lineHeight: CGFloat
}

extension DDDFont {
    enum TextCase {
        case none, uppercase
    }
    enum TextDecoration {
        case none, strike, underline
    }
}

extension DDDFont {
   // func toFont() -> FontFamily.{
     //   gua
    //}
    
}

public extension SwiftUI.Font {
    static func d3Font(_ token: DDDFontToken) -> SwiftUI.Font  {
        switch token {
        case .caption2Regular:
            return FontFamily.Quicksand.regular.swiftUIFont(size: 11)
        default:
            return SwiftUI.Font.system(size: 16)
        }
    }
}






open class XDDDOPEN {
    
}


public class XD {
    
}


class XDD {
    
    
}

private class XDDD {
    
}

/// 3 tipos de niveles de acceso
/// Open, Public, Internal y Private .... fileprivate
///
///
