//
// AUTO-GENERATED FILE
// This file is overridden each time the code generator runs.
// For more details check `generate-platform-outputs.js` in the scripts folder.
//

import CoreGraphics
import SwiftUI

/// `DodadaInputTokens` contains the tokens for the Input component.
public struct DodadaInputTokens {
    public let borderRadius: DodadaRadiusToken?
    public let paddingHorizontal: DodadaSpacingToken?
    public let gap: DodadaSpacingToken?
    public let shapeHeight: DodadaSizingToken?
    public let backgroundColor: DodadaColorToken?
    public let borderColor: DodadaColorToken?
    public let textColor: DodadaColorToken?
    public let iconColor: DodadaColorToken?
    public let labelColor: DodadaColorToken?
    public let optionalLabelColor: DodadaColorToken?
    public let placeholderColor: DodadaColorToken?
    public let contentTextColor: DodadaColorToken?
    public let asteriskColor: DodadaColorToken?
    public let labelTypography: DodadaTypographyToken?
    public let optionalTypography: DodadaTypographyToken?
    public let placeholderTypography: DodadaTypographyToken?
    public let contentTextTypography: DodadaTypographyToken?

    private init(
        borderRadius: DodadaRadiusToken? = .md,
        paddingHorizontal: DodadaSpacingToken? = .md,
        gap: DodadaSpacingToken? = .sm,
        shapeHeight: DodadaSizingToken? = .inputHeightLg,
        backgroundColor: DodadaColorToken? = nil,
        borderColor: DodadaColorToken? = nil,
        textColor: DodadaColorToken? = nil,
        iconColor: DodadaColorToken? = nil,
        labelColor: DodadaColorToken? = .secondaryValue500,
        optionalLabelColor: DodadaColorToken? = .secondaryValue400,
        placeholderColor: DodadaColorToken? = .secondaryValue400,
        contentTextColor: DodadaColorToken? = .secondaryValue500,
        asteriskColor: DodadaColorToken? = .errorValue500,
        labelTypography: DodadaTypographyToken? = .footnoteBold,
        optionalTypography: DodadaTypographyToken? = .footnoteRegular,
        placeholderTypography: DodadaTypographyToken? = .calloutRegular,
        contentTextTypography: DodadaTypographyToken? = .caption2Regular
    ) {
        self.borderRadius = borderRadius
        self.paddingHorizontal = paddingHorizontal
        self.gap = gap
        self.shapeHeight = shapeHeight
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.textColor = textColor
        self.iconColor = iconColor
        self.labelColor = labelColor
        self.optionalLabelColor = optionalLabelColor
        self.placeholderColor = placeholderColor
        self.contentTextColor = contentTextColor
        self.asteriskColor = asteriskColor
        self.labelTypography = labelTypography
        self.optionalTypography = optionalTypography
        self.placeholderTypography = placeholderTypography
        self.contentTextTypography = contentTextTypography
    }

    /// Default state: border secondary200, background white, text secondary400, icons secondary500.
    public static let defaultState = DodadaInputTokens(
        backgroundColor: .neutralZero,
        borderColor: .secondaryValue200,
        textColor: .secondaryValue400,
        iconColor: .secondaryValue500
    )

    /// Focus state: border secondary500, background white, text secondary500, icons secondary500.
    public static let focusState = DodadaInputTokens(
        backgroundColor: .neutralZero,
        borderColor: .secondaryValue500,
        textColor: .secondaryValue500,
        iconColor: .secondaryValue500
    )

    /// Error state: border error500, background white, text secondary500, icons secondary500.
    public static let errorState = DodadaInputTokens(
        backgroundColor: .neutralZero,
        borderColor: .errorValue500,
        textColor: .secondaryValue500,
        iconColor: .secondaryValue500
    )

    /// Disabled state: border secondary200, background secondary100, text secondary400, icons secondary500.
    public static let disabledState = DodadaInputTokens(
        backgroundColor: .secondaryValue100,
        borderColor: .secondaryValue200,
        textColor: .secondaryValue400,
        iconColor: .secondaryValue500
    )
}

public extension DodadaInputTokens {
    /// Content text colors for different validation statuses.
    static let contentTextDefaultColor: DodadaColorToken = .secondaryValue500
    static let contentTextSuccessColor: DodadaColorToken = .successValue500
    static let contentTextErrorColor: DodadaColorToken = .errorValue500
}
