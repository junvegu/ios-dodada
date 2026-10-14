//
//  DDDButtonThemeTests.swift
//
//  A button must paint with the theme it receives (the environment theme), not with the global
//  `DDDThemeManager.shared.main`. Regression test for `getBackgroundColor(by:)`, which used to ignore its
//  `theme` parameter, so a custom theme got the default theme's background (red) with its own text color.
//

import SwiftUI
import UIKit
import XCTest
@testable import Dodada

final class DDDButtonThemeTests: XCTestCase {

    private let defaultColor = Color(red: 0.10, green: 0.80, blue: 0.30)
    private let pressedColor = Color(red: 0.20, green: 0.30, blue: 0.90)
    private let disabledColor = Color(red: 0.70, green: 0.70, blue: 0.20)
    private let tertiaryColor = Color(red: 0.60, green: 0.10, blue: 0.60)

    private var theme: DDDTheme {
        RecoloredTheme(overrides: [
            "buttonPrimaryBackgroundDefault": defaultColor,
            "buttonPrimaryBackgroundPressed": pressedColor,
            "buttonPrimaryBackgroundDisabled": disabledColor,
            "buttonTertiaryBackgroundDefault": tertiaryColor
        ])
    }

    private func rgba(_ color: Color) -> [CGFloat] {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return [red, green, blue, alpha].map { ($0 * 1000).rounded() / 1000 }
    }

    func testTheTestThemeReallyDiffersFromTheGlobalOne() {
        let global = DDDButtonDesing.primary.getBackgroundColor(
            by: DDDThemeManager.shared.main, size: .regular, isDisabled: false, isPressed: false
        )
        XCTAssertNotEqual(rgba(global), rgba(defaultColor), "otherwise the tests below prove nothing")
    }

    func testPrimaryBackgroundUsesTheThemePassedInForEverySizeAndState() {
        for size in [DDDButtonSize.regular, .medium, .small] {
            let normal = DDDButtonDesing.primary.getBackgroundColor(by: theme, size: size, isDisabled: false, isPressed: false)
            let pressed = DDDButtonDesing.primary.getBackgroundColor(by: theme, size: size, isDisabled: false, isPressed: true)
            let disabled = DDDButtonDesing.primary.getBackgroundColor(by: theme, size: size, isDisabled: true, isPressed: false)

            XCTAssertEqual(rgba(normal), rgba(defaultColor), "default, \(size)")
            XCTAssertEqual(rgba(pressed), rgba(pressedColor), "pressed, \(size)")
            XCTAssertEqual(rgba(disabled), rgba(disabledColor), "disabled, \(size)")
        }
    }

    func testOtherVariantsUseTheThemePassedInToo() {
        let tertiary = DDDButtonDesing.tertiary.getBackgroundColor(by: theme, size: .regular, isDisabled: false, isPressed: false)
        XCTAssertEqual(rgba(tertiary), rgba(tertiaryColor))
    }

    func testTheForegroundAndTheBackgroundComeFromTheSameTheme() {
        // The foreground already honored the theme; the background must now agree with it.
        let foreground = DDDButtonDesing.primary.getForegroundColor(by: theme, size: .regular, isDisabled: false, isPressed: false)
        let background = DDDButtonDesing.primary.getBackgroundColor(by: theme, size: .regular, isDisabled: false, isPressed: false)
        let globalForeground = DDDButtonDesing.primary.getForegroundColor(
            by: DDDThemeManager.shared.main, size: .regular, isDisabled: false, isPressed: false
        )

        XCTAssertEqual(rgba(foreground), rgba(globalForeground), "unchanged tokens still resolve to Dodada's defaults")
        XCTAssertEqual(rgba(background), rgba(defaultColor))
    }
}
