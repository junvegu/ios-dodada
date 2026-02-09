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
    static var largeTitleRegular: DodadaFont { get }
    static var largeTitleBold: DodadaFont { get }
    static var largeTitleBoldUnderline: DodadaFont { get }
    static var title1Regular: DodadaFont { get }
    static var title1Bold: DodadaFont { get }
    static var title1BoldUnderline: DodadaFont { get }
    static var title2Regular: DodadaFont { get }
    static var title2Bold: DodadaFont { get }
    static var title2BoldUnderline: DodadaFont { get }
    static var title3Regular: DodadaFont { get }
    static var title3Bold: DodadaFont { get }
    static var title3BoldUnderline: DodadaFont { get }
    static var headlineRegular: DodadaFont { get }
    static var headlineBold: DodadaFont { get }
    static var headlineBoldUnderline: DodadaFont { get }
    static var bodyRegular: DodadaFont { get }
    static var bodyBold: DodadaFont { get }
    static var bodyBoldUnderline: DodadaFont { get }
    static var calloutRegular: DodadaFont { get }
    static var calloutBold: DodadaFont { get }
    static var calloutBoldUnderline: DodadaFont { get }
    static var subheadlineRegular: DodadaFont { get }
    static var subheadlineBold: DodadaFont { get }
    static var subheadlineBoldUnderline: DodadaFont { get }
    static var footnoteRegular: DodadaFont { get }
    static var footnoteBold: DodadaFont { get }
    static var footnoteBoldUnderline: DodadaFont { get }
    static var caption1Regular: DodadaFont { get }
    static var caption1Bold: DodadaFont { get }
    static var caption1BoldUnderline: DodadaFont { get }
    static var caption2Regular: DodadaFont { get }
    static var caption2Bold: DodadaFont { get }
    static var caption2BoldUnderline: DodadaFont { get }
    func font(for token: DodadaTypographyToken) -> DodadaFont
}

public struct DodadaThemeTypographyTokensDefault: DodadaThemeTypographyTokens {
    public static var largeTitleRegular: DodadaFont { DodadaTypographyToken.largeTitleRegular.font }
    public static var largeTitleBold: DodadaFont { DodadaTypographyToken.largeTitleBold.font }
    public static var largeTitleBoldUnderline: DodadaFont { DodadaTypographyToken.largeTitleBoldUnderline.font }
    public static var title1Regular: DodadaFont { DodadaTypographyToken.title1Regular.font }
    public static var title1Bold: DodadaFont { DodadaTypographyToken.title1Bold.font }
    public static var title1BoldUnderline: DodadaFont { DodadaTypographyToken.title1BoldUnderline.font }
    public static var title2Regular: DodadaFont { DodadaTypographyToken.title2Regular.font }
    public static var title2Bold: DodadaFont { DodadaTypographyToken.title2Bold.font }
    public static var title2BoldUnderline: DodadaFont { DodadaTypographyToken.title2BoldUnderline.font }
    public static var title3Regular: DodadaFont { DodadaTypographyToken.title3Regular.font }
    public static var title3Bold: DodadaFont { DodadaTypographyToken.title3Bold.font }
    public static var title3BoldUnderline: DodadaFont { DodadaTypographyToken.title3BoldUnderline.font }
    public static var headlineRegular: DodadaFont { DodadaTypographyToken.headlineRegular.font }
    public static var headlineBold: DodadaFont { DodadaTypographyToken.headlineBold.font }
    public static var headlineBoldUnderline: DodadaFont { DodadaTypographyToken.headlineBoldUnderline.font }
    public static var bodyRegular: DodadaFont { DodadaTypographyToken.bodyRegular.font }
    public static var bodyBold: DodadaFont { DodadaTypographyToken.bodyBold.font }
    public static var bodyBoldUnderline: DodadaFont { DodadaTypographyToken.bodyBoldUnderline.font }
    public static var calloutRegular: DodadaFont { DodadaTypographyToken.calloutRegular.font }
    public static var calloutBold: DodadaFont { DodadaTypographyToken.calloutBold.font }
    public static var calloutBoldUnderline: DodadaFont { DodadaTypographyToken.calloutBoldUnderline.font }
    public static var subheadlineRegular: DodadaFont { DodadaTypographyToken.subheadlineRegular.font }
    public static var subheadlineBold: DodadaFont { DodadaTypographyToken.subheadlineBold.font }
    public static var subheadlineBoldUnderline: DodadaFont { DodadaTypographyToken.subheadlineBoldUnderline.font }
    public static var footnoteRegular: DodadaFont { DodadaTypographyToken.footnoteRegular.font }
    public static var footnoteBold: DodadaFont { DodadaTypographyToken.footnoteBold.font }
    public static var footnoteBoldUnderline: DodadaFont { DodadaTypographyToken.footnoteBoldUnderline.font }
    public static var caption1Regular: DodadaFont { DodadaTypographyToken.caption1Regular.font }
    public static var caption1Bold: DodadaFont { DodadaTypographyToken.caption1Bold.font }
    public static var caption1BoldUnderline: DodadaFont { DodadaTypographyToken.caption1BoldUnderline.font }
    public static var caption2Regular: DodadaFont { DodadaTypographyToken.caption2Regular.font }
    public static var caption2Bold: DodadaFont { DodadaTypographyToken.caption2Bold.font }
    public static var caption2BoldUnderline: DodadaFont { DodadaTypographyToken.caption2BoldUnderline.font }
    public func font(for token: DodadaTypographyToken) -> DodadaFont {
        switch token {
        case .largeTitleRegular: return Self.largeTitleRegular
        case .largeTitleBold: return Self.largeTitleBold
        case .largeTitleBoldUnderline: return Self.largeTitleBoldUnderline
        case .title1Regular: return Self.title1Regular
        case .title1Bold: return Self.title1Bold
        case .title1BoldUnderline: return Self.title1BoldUnderline
        case .title2Regular: return Self.title2Regular
        case .title2Bold: return Self.title2Bold
        case .title2BoldUnderline: return Self.title2BoldUnderline
        case .title3Regular: return Self.title3Regular
        case .title3Bold: return Self.title3Bold
        case .title3BoldUnderline: return Self.title3BoldUnderline
        case .headlineRegular: return Self.headlineRegular
        case .headlineBold: return Self.headlineBold
        case .headlineBoldUnderline: return Self.headlineBoldUnderline
        case .bodyRegular: return Self.bodyRegular
        case .bodyBold: return Self.bodyBold
        case .bodyBoldUnderline: return Self.bodyBoldUnderline
        case .calloutRegular: return Self.calloutRegular
        case .calloutBold: return Self.calloutBold
        case .calloutBoldUnderline: return Self.calloutBoldUnderline
        case .subheadlineRegular: return Self.subheadlineRegular
        case .subheadlineBold: return Self.subheadlineBold
        case .subheadlineBoldUnderline: return Self.subheadlineBoldUnderline
        case .footnoteRegular: return Self.footnoteRegular
        case .footnoteBold: return Self.footnoteBold
        case .footnoteBoldUnderline: return Self.footnoteBoldUnderline
        case .caption1Regular: return Self.caption1Regular
        case .caption1Bold: return Self.caption1Bold
        case .caption1BoldUnderline: return Self.caption1BoldUnderline
        case .caption2Regular: return Self.caption2Regular
        case .caption2Bold: return Self.caption2Bold
        case .caption2BoldUnderline: return Self.caption2BoldUnderline
        }
    }
}
