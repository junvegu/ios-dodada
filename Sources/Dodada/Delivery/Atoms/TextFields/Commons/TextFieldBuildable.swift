//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 2/03/25.
//

import Foundation
import SwiftUI

protocol TextFieldBuildable {

    var autocapitalizationType: UITextAutocapitalizationType { get set }
    var isAutocorrectionDisabled: Bool? { get set }
    var keyboardType: UIKeyboardType { get set }
    var returnKeyType: SubmitLabel { get set }
    var shouldDeleteBackwardAction: (String) -> Bool { get set }
    var textContentType: UITextContentType? { get set }
}
