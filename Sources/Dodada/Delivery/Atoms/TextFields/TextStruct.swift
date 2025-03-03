//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 1/03/25.
//

import Foundation
import SwiftUI

public struct TextStrut: View {

    @Environment(\.textSize) private var textSize
    @Environment(\.textLineHeight) private var textLineHeight
    @Environment(\.sizeCategory) private var sizeCategory
    
    public var body: some View {
        Color.clear
            .frame(width: 0, height: lineHeight * sizeCategory.ratio)
            .alignmentGuide(.firstTextBaseline) { _ in size }
            .alignmentGuide(.lastTextBaseline) { _ in size }
    }

    private var lineHeight: CGFloat {
        textLineHeight ?? LabelToken.Size.lineHeight(forTextSize: size)
    }

    private var size: CGFloat {
        textSize ?? LabelToken.Size.normal.value
    }

    public init() {}
}
