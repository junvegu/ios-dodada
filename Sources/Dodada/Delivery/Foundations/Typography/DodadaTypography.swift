// Do not edit directly. Generated from design tokens.
import UIKit

public struct DodadaFont {
    public let family: String
    public let size: CGFloat
    public let weight: CGFloat
    public let lineHeight: CGFloat
    public let letterSpacing: CGFloat?
    public let underline: Bool
}

public enum DodadaTypographyToken: CaseIterable {
    case largeTitleRegular
    case largeTitleBold
    case largeTitleBoldUnderline
    case title1Regular
    case title1Bold
    case title1BoldUnderline
    case title2Regular
    case title2Bold
    case title2BoldUnderline
    case title3Regular
    case title3Bold
    case title3BoldUnderline
    case headlineRegular
    case headlineBold
    case headlineBoldUnderline
    case bodyRegular
    case bodyBold
    case bodyBoldUnderline
    case calloutRegular
    case calloutBold
    case calloutBoldUnderline
    case subheadlineRegular
    case subheadlineBold
    case subheadlineBoldUnderline
    case footnoteRegular
    case footnoteBold
    case footnoteBoldUnderline
    case caption1Regular
    case caption1Bold
    case caption1BoldUnderline
    case caption2Regular
    case caption2Bold
    case caption2BoldUnderline
}

extension DodadaTypographyToken {
    public var font: DodadaFont {
        switch self {
        case .largeTitleRegular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(28),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.2),
            letterSpacing: CGFloat(-0.025),
            underline: false
        )
        case .largeTitleBold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(28),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .largeTitleBoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(28),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: true
        )
        case .title1Regular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(22),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .title1Bold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(22),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .title1BoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(22),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: true
        )
        case .title2Regular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(20),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .title2Bold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(20),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .title2BoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(20),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: true
        )
        case .title3Regular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(18),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .title3Bold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(18),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: false
        )
        case .title3BoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(18),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.2),
            letterSpacing: nil,
            underline: true
        )
        case .headlineRegular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(17),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .headlineBold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(17),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .headlineBoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(17),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        case .bodyRegular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(15),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .bodyBold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(15),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .bodyBoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(15),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        case .calloutRegular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(13),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .calloutBold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(13),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .calloutBoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(13),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        case .subheadlineRegular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(12),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .subheadlineBold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(12),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .subheadlineBoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(12),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        case .footnoteRegular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(11),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .footnoteBold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(11),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .footnoteBoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(11),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        case .caption1Regular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(12),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .caption1Bold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(12),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .caption1BoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(12),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        case .caption2Regular: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(11),
            weight: CGFloat(400),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .caption2Bold: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(11),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: false
        )
        case .caption2BoldUnderline: return DodadaFont(
            family: "Quicksand",
            size: CGFloat(11),
            weight: CGFloat(700),
            lineHeight: CGFloat(1.5),
            letterSpacing: nil,
            underline: true
        )
        }
    }
}

public protocol DodadaThemeTypographyTokens {
    var largeTitleRegular: DodadaFont { get }
    var largeTitleBold: DodadaFont { get }
    var largeTitleBoldUnderline: DodadaFont { get }
    var title1Regular: DodadaFont { get }
    var title1Bold: DodadaFont { get }
    var title1BoldUnderline: DodadaFont { get }
    var title2Regular: DodadaFont { get }
    var title2Bold: DodadaFont { get }
    var title2BoldUnderline: DodadaFont { get }
    var title3Regular: DodadaFont { get }
    var title3Bold: DodadaFont { get }
    var title3BoldUnderline: DodadaFont { get }
    var headlineRegular: DodadaFont { get }
    var headlineBold: DodadaFont { get }
    var headlineBoldUnderline: DodadaFont { get }
    var bodyRegular: DodadaFont { get }
    var bodyBold: DodadaFont { get }
    var bodyBoldUnderline: DodadaFont { get }
    var calloutRegular: DodadaFont { get }
    var calloutBold: DodadaFont { get }
    var calloutBoldUnderline: DodadaFont { get }
    var subheadlineRegular: DodadaFont { get }
    var subheadlineBold: DodadaFont { get }
    var subheadlineBoldUnderline: DodadaFont { get }
    var footnoteRegular: DodadaFont { get }
    var footnoteBold: DodadaFont { get }
    var footnoteBoldUnderline: DodadaFont { get }
    var caption1Regular: DodadaFont { get }
    var caption1Bold: DodadaFont { get }
    var caption1BoldUnderline: DodadaFont { get }
    var caption2Regular: DodadaFont { get }
    var caption2Bold: DodadaFont { get }
    var caption2BoldUnderline: DodadaFont { get }
    func font(for token: DodadaTypographyToken) -> DodadaFont
}

public struct DodadaThemeTypographyTokensDefault: DodadaThemeTypographyTokens {
    public var largeTitleRegular: DodadaFont { DodadaTypographyToken.largeTitleRegular.font }
    public var largeTitleBold: DodadaFont { DodadaTypographyToken.largeTitleBold.font }
    public var largeTitleBoldUnderline: DodadaFont { DodadaTypographyToken.largeTitleBoldUnderline.font }
    public var title1Regular: DodadaFont { DodadaTypographyToken.title1Regular.font }
    public var title1Bold: DodadaFont { DodadaTypographyToken.title1Bold.font }
    public var title1BoldUnderline: DodadaFont { DodadaTypographyToken.title1BoldUnderline.font }
    public var title2Regular: DodadaFont { DodadaTypographyToken.title2Regular.font }
    public var title2Bold: DodadaFont { DodadaTypographyToken.title2Bold.font }
    public var title2BoldUnderline: DodadaFont { DodadaTypographyToken.title2BoldUnderline.font }
    public var title3Regular: DodadaFont { DodadaTypographyToken.title3Regular.font }
    public var title3Bold: DodadaFont { DodadaTypographyToken.title3Bold.font }
    public var title3BoldUnderline: DodadaFont { DodadaTypographyToken.title3BoldUnderline.font }
    public var headlineRegular: DodadaFont { DodadaTypographyToken.headlineRegular.font }
    public var headlineBold: DodadaFont { DodadaTypographyToken.headlineBold.font }
    public var headlineBoldUnderline: DodadaFont { DodadaTypographyToken.headlineBoldUnderline.font }
    public var bodyRegular: DodadaFont { DodadaTypographyToken.bodyRegular.font }
    public var bodyBold: DodadaFont { DodadaTypographyToken.bodyBold.font }
    public var bodyBoldUnderline: DodadaFont { DodadaTypographyToken.bodyBoldUnderline.font }
    public var calloutRegular: DodadaFont { DodadaTypographyToken.calloutRegular.font }
    public var calloutBold: DodadaFont { DodadaTypographyToken.calloutBold.font }
    public var calloutBoldUnderline: DodadaFont { DodadaTypographyToken.calloutBoldUnderline.font }
    public var subheadlineRegular: DodadaFont { DodadaTypographyToken.subheadlineRegular.font }
    public var subheadlineBold: DodadaFont { DodadaTypographyToken.subheadlineBold.font }
    public var subheadlineBoldUnderline: DodadaFont { DodadaTypographyToken.subheadlineBoldUnderline.font }
    public var footnoteRegular: DodadaFont { DodadaTypographyToken.footnoteRegular.font }
    public var footnoteBold: DodadaFont { DodadaTypographyToken.footnoteBold.font }
    public var footnoteBoldUnderline: DodadaFont { DodadaTypographyToken.footnoteBoldUnderline.font }
    public var caption1Regular: DodadaFont { DodadaTypographyToken.caption1Regular.font }
    public var caption1Bold: DodadaFont { DodadaTypographyToken.caption1Bold.font }
    public var caption1BoldUnderline: DodadaFont { DodadaTypographyToken.caption1BoldUnderline.font }
    public var caption2Regular: DodadaFont { DodadaTypographyToken.caption2Regular.font }
    public var caption2Bold: DodadaFont { DodadaTypographyToken.caption2Bold.font }
    public var caption2BoldUnderline: DodadaFont { DodadaTypographyToken.caption2BoldUnderline.font }
    public func font(for token: DodadaTypographyToken) -> DodadaFont {
        switch token {
        case .largeTitleRegular: return largeTitleRegular
        case .largeTitleBold: return largeTitleBold
        case .largeTitleBoldUnderline: return largeTitleBoldUnderline
        case .title1Regular: return title1Regular
        case .title1Bold: return title1Bold
        case .title1BoldUnderline: return title1BoldUnderline
        case .title2Regular: return title2Regular
        case .title2Bold: return title2Bold
        case .title2BoldUnderline: return title2BoldUnderline
        case .title3Regular: return title3Regular
        case .title3Bold: return title3Bold
        case .title3BoldUnderline: return title3BoldUnderline
        case .headlineRegular: return headlineRegular
        case .headlineBold: return headlineBold
        case .headlineBoldUnderline: return headlineBoldUnderline
        case .bodyRegular: return bodyRegular
        case .bodyBold: return bodyBold
        case .bodyBoldUnderline: return bodyBoldUnderline
        case .calloutRegular: return calloutRegular
        case .calloutBold: return calloutBold
        case .calloutBoldUnderline: return calloutBoldUnderline
        case .subheadlineRegular: return subheadlineRegular
        case .subheadlineBold: return subheadlineBold
        case .subheadlineBoldUnderline: return subheadlineBoldUnderline
        case .footnoteRegular: return footnoteRegular
        case .footnoteBold: return footnoteBold
        case .footnoteBoldUnderline: return footnoteBoldUnderline
        case .caption1Regular: return caption1Regular
        case .caption1Bold: return caption1Bold
        case .caption1BoldUnderline: return caption1BoldUnderline
        case .caption2Regular: return caption2Regular
        case .caption2Bold: return caption2Bold
        case .caption2BoldUnderline: return caption2BoldUnderline
        }
    }
}
