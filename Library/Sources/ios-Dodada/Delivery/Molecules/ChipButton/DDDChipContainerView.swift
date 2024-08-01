//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 14/06/24.
//

import Foundation
import SwiftUI

public struct DDDChipContainerView: View {
    @ObservedObject var viewModel = ChipsViewModel()
    private let action: ((ChipModel) -> Void)?

    public init(viewModel: ChipsViewModel = ChipsViewModel(),
         action: ((ChipModel) -> Void)? = nil) {
        self.viewModel = viewModel
        self.action = action
    }
    
    public var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
            ZStack(alignment: .topLeading,
                   content: {
                ForEach(viewModel.dataObject) { data in
                    DDDChipButton(
                        model: data,
                        isSelected: data.isSelected,
                        action: {
                            model in
                            viewModel.remove(model: model)
                            action?(model)
                        }
                    )
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > geo.size.width) {
                                width = 0
                                height -= dimension.height
                            }
                            let result = width
                            if data.id == viewModel.dataObject.last!.id {
                                width = 0
                            } else {
                                width -= dimension.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if data.id == viewModel.dataObject.last!.id {
                                height = 0
                            }
                            return result
                        }
                }
            })
        }.animation(.spring(), value: viewModel.dataObject)
    }
}

struct ChipContainerView_Previews: PreviewProvider {
    static var previews: some View {
        DDDChipContainerView() { _ in
            
        }
    }
}
