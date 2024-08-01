//
//  File.swift
//
//
//  Created by Junior Quevedo Gutiérrez  on 14/06/24.
//

import Foundation
import SwiftUI
public struct ChipModel: Identifiable, Equatable {
    public static func == (lhs: ChipModel, rhs: ChipModel) -> Bool {
        lhs.id == rhs.id
    }
    
    @State public var isSelected: Bool
    public let id = UUID()
    public let systemImage: String
    public let titleKey: LocalizedStringKey
}

public class ChipsViewModel: ObservableObject {
    public init() {
    }
    @Published var dataObject: [ChipModel] = []
    @Published var chipArray: [ChipModel] = [
        ChipModel(isSelected: false, systemImage: "heart.circle", titleKey: "Heart"),
        ChipModel(isSelected: false, systemImage: "folder.circle", titleKey: "Folder"),
        ChipModel(isSelected: false, systemImage: "pencil.and.outline", titleKey: "Pen"),
        ChipModel(isSelected: false, systemImage: "book.circle", titleKey: "Book"),
        ChipModel(isSelected: false, systemImage: "paperplane.circle", titleKey: "Paper Plain"),
        ChipModel(isSelected: false, systemImage: "opticaldiscdrive", titleKey: "Optical Drive"),
        ChipModel(isSelected: false, systemImage: "doc.circle", titleKey: "Documents")
    ]
    
    public func addChipButtonCloseAction(text: String) {
        dataObject.append(
            ChipModel(
                isSelected: false,
                systemImage: "xmark.circle.fill",
                titleKey: "\(text)"
            )
        )
    }
    
    public func addChip(model: ChipModel) {
       
    }
    
    public func removeLast() {
        guard dataObject.count != 0 else {
            return
        }
        dataObject.removeLast()
    }
    public func remove(model: ChipModel) {
        dataObject.removeAll { found in
            found.id == model.id
        }
    }
}
